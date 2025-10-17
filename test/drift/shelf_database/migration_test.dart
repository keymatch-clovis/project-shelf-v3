// dart format width=80
// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    const versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = ShelfDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // The following template shows how to write tests ensuring your migrations
  // preserve existing data.
  // Testing this can be useful for migrations that change existing columns
  // (e.g. by alterating their type or constraints). Migrations that only add
  // tables or columns typically don't need these advanced tests. For more
  // information, see https://drift.simonbinder.eu/migrations/tests/#verifying-data-integrity
  // TODO: This generated template shows how these tests could be written. Adopt
  // it to your own needs when testing migrations with data integrity.
  test('migration from v1 to v2 does not corrupt data', () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    // TODO: Fill these lists
    final oldProductData = <v1.ProductData>[];
    final expectedNewProductData = <v2.ProductData>[];

    final oldCityData = <v1.CityData>[];
    final expectedNewCityData = <v2.CityData>[];

    final oldCustomerData = <v1.CustomerData>[];
    final expectedNewCustomerData = <v2.CustomerData>[];

    final oldInvoiceData = <v1.InvoiceData>[];
    final expectedNewInvoiceData = <v2.InvoiceData>[];

    final oldInvoiceProductData = <v1.InvoiceProductData>[];
    final expectedNewInvoiceProductData = <v2.InvoiceProductData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: ShelfDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.product, oldProductData);
        batch.insertAll(oldDb.city, oldCityData);
        batch.insertAll(oldDb.customer, oldCustomerData);
        batch.insertAll(oldDb.invoice, oldInvoiceData);
        batch.insertAll(oldDb.invoiceProduct, oldInvoiceProductData);
      },
      validateItems: (newDb) async {
        expect(expectedNewProductData, await newDb.select(newDb.product).get());
        expect(expectedNewCityData, await newDb.select(newDb.city).get());
        expect(
          expectedNewCustomerData,
          await newDb.select(newDb.customer).get(),
        );
        expect(expectedNewInvoiceData, await newDb.select(newDb.invoice).get());
        expect(
          expectedNewInvoiceProductData,
          await newDb.select(newDb.invoiceProduct).get(),
        );
      },
    );
  });
}
