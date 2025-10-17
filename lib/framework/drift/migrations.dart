import 'package:drift/drift.dart';
import 'package:drift/internal/versioned_schema.dart';
import 'package:flutter/foundation.dart';
import 'package:project_shelf_v3/framework/drift/shelf_database.steps.dart';

extension Migrations on GeneratedDatabase {
  OnUpgrade get schemaUpgrade => (m, from, to) async {
    // https://github.com/simolus3/drift/blob/develop/examples/migrations_example/lib/database.dart
    // Following the advice from https://drift.simonbinder.eu/Migrations/api/#general-tips
    await customStatement('PRAGMA foreign_keys = OFF');

    await transaction(
      () => VersionedSchema.runMigrationSteps(
        migrator: m,
        from: from,
        to: to,
        steps: _upgrade,
      ),
    );

    if (kDebugMode) {
      final wrongForeignKeys = await customSelect(
        'PRAGMA foreign_key_check',
      ).get();

      assert(
        wrongForeignKeys.isEmpty,
        '${wrongForeignKeys.map((e) => e.data)}',
      );
    }

    await customStatement('PRAGMA foreign_keys = ON');
  };

  static final _upgrade = migrationSteps(
    from1To2: (m, schema) async {
      // Adds currency ISO code column to product table.
      await m.alterTable(
        TableMigration(
          schema.product,
          columnTransformer: {
            schema.product.currencyIsoCode: const Constant<String>('COP'),
          },
          newColumns: [schema.product.currencyIsoCode],
        ),
      );
    },
    from2To3: (Migrator m, Schema3 schema) async {
      // Adds currency ISO code column to invoice table, and invoice product table.
      await m.alterTable(
        TableMigration(
          schema.invoice,
          columnTransformer: {
            schema.invoice.currencyIsoCode: const Constant<String>('COP'),
          },
          newColumns: [schema.invoice.currencyIsoCode],
        ),
      );

      await m.alterTable(
        TableMigration(
          schema.invoiceProduct,
          columnTransformer: {
            schema.invoiceProduct.currencyIsoCode: const Constant<String>(
              'COP',
            ),
          },
          newColumns: [schema.invoiceProduct.currencyIsoCode],
        ),
      );
    },
  );
}
