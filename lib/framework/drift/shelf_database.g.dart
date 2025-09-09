// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_database.dart';

// ignore_for_file: type=lint
class $ProductTableTable extends ProductTable
    with TableInfo<$ProductTableTable, ProductDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultPriceMeta = const VerificationMeta(
    'defaultPrice',
  );
  @override
  late final GeneratedColumn<int> defaultPrice = GeneratedColumn<int>(
    'default_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pendingDeleteUntilMeta =
      const VerificationMeta('pendingDeleteUntil');
  @override
  late final GeneratedColumn<DateTime> pendingDeleteUntil =
      GeneratedColumn<DateTime>(
        'pending_delete_until',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    defaultPrice,
    stock,
    createdAt,
    updatedAt,
    pendingDeleteUntil,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductDto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('default_price')) {
      context.handle(
        _defaultPriceMeta,
        defaultPrice.isAcceptableOrUnknown(
          data['default_price']!,
          _defaultPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultPriceMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('pending_delete_until')) {
      context.handle(
        _pendingDeleteUntilMeta,
        pendingDeleteUntil.isAcceptableOrUnknown(
          data['pending_delete_until']!,
          _pendingDeleteUntilMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductDto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      defaultPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_price'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      pendingDeleteUntil: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}pending_delete_until'],
      ),
    );
  }

  @override
  $ProductTableTable createAlias(String alias) {
    return $ProductTableTable(attachedDatabase, alias);
  }
}

class ProductTableCompanion extends UpdateCompanion<ProductDto> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> defaultPrice;
  final Value<int> stock;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> pendingDeleteUntil;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.defaultPrice = const Value.absent(),
    this.stock = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.pendingDeleteUntil = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int defaultPrice,
    required int stock,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.pendingDeleteUntil = const Value.absent(),
  }) : name = Value(name),
       defaultPrice = Value(defaultPrice),
       stock = Value(stock),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProductDto> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? defaultPrice,
    Expression<int>? stock,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? pendingDeleteUntil,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (defaultPrice != null) 'default_price': defaultPrice,
      if (stock != null) 'stock': stock,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (pendingDeleteUntil != null)
        'pending_delete_until': pendingDeleteUntil,
    });
  }

  ProductTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? defaultPrice,
    Value<int>? stock,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? pendingDeleteUntil,
  }) {
    return ProductTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      defaultPrice: defaultPrice ?? this.defaultPrice,
      stock: stock ?? this.stock,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      pendingDeleteUntil: pendingDeleteUntil ?? this.pendingDeleteUntil,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (defaultPrice.present) {
      map['default_price'] = Variable<int>(defaultPrice.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (pendingDeleteUntil.present) {
      map['pending_delete_until'] = Variable<DateTime>(
        pendingDeleteUntil.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('defaultPrice: $defaultPrice, ')
          ..write('stock: $stock, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('pendingDeleteUntil: $pendingDeleteUntil')
          ..write(')'))
        .toString();
  }
}

class $CityTableTable extends CityTable
    with TableInfo<$CityTableTable, CityDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _departmentMeta = const VerificationMeta(
    'department',
  );
  @override
  late final GeneratedColumn<String> department = GeneratedColumn<String>(
    'department',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, department];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'city';
  @override
  VerificationContext validateIntegrity(
    Insertable<CityDto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('department')) {
      context.handle(
        _departmentMeta,
        department.isAcceptableOrUnknown(data['department']!, _departmentMeta),
      );
    } else if (isInserting) {
      context.missing(_departmentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CityDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CityDto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      department: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}department'],
      )!,
    );
  }

  @override
  $CityTableTable createAlias(String alias) {
    return $CityTableTable(attachedDatabase, alias);
  }
}

class CityTableCompanion extends UpdateCompanion<CityDto> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> department;
  const CityTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.department = const Value.absent(),
  });
  CityTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String department,
  }) : name = Value(name),
       department = Value(department);
  static Insertable<CityDto> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? department,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (department != null) 'department': department,
    });
  }

  CityTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? department,
  }) {
    return CityTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      department: department ?? this.department,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (department.present) {
      map['department'] = Variable<String>(department.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('department: $department')
          ..write(')'))
        .toString();
  }
}

abstract class _$ShelfDatabase extends GeneratedDatabase {
  _$ShelfDatabase(QueryExecutor e) : super(e);
  $ShelfDatabaseManager get managers => $ShelfDatabaseManager(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $CityTableTable cityTable = $CityTableTable(this);
  late final Index idxUniqueNameNotPendingForDeletion = Index(
    'idx_unique_name_not_pending_for_deletion',
    'CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_name_not_pending_for_deletion ON product (name) WHERE pending_delete_until IS NULL',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    productTable,
    cityTable,
    idxUniqueNameNotPendingForDeletion,
  ];
}

typedef $$ProductTableTableCreateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      required String name,
      required int defaultPrice,
      required int stock,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> pendingDeleteUntil,
    });
typedef $$ProductTableTableUpdateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> defaultPrice,
      Value<int> stock,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> pendingDeleteUntil,
    });

class $$ProductTableTableFilterComposer
    extends Composer<_$ShelfDatabase, $ProductTableTable> {
  $$ProductTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get pendingDeleteUntil => $composableBuilder(
    column: $table.pendingDeleteUntil,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductTableTableOrderingComposer
    extends Composer<_$ShelfDatabase, $ProductTableTable> {
  $$ProductTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get pendingDeleteUntil => $composableBuilder(
    column: $table.pendingDeleteUntil,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductTableTableAnnotationComposer
    extends Composer<_$ShelfDatabase, $ProductTableTable> {
  $$ProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get pendingDeleteUntil => $composableBuilder(
    column: $table.pendingDeleteUntil,
    builder: (column) => column,
  );
}

class $$ProductTableTableTableManager
    extends
        RootTableManager<
          _$ShelfDatabase,
          $ProductTableTable,
          ProductDto,
          $$ProductTableTableFilterComposer,
          $$ProductTableTableOrderingComposer,
          $$ProductTableTableAnnotationComposer,
          $$ProductTableTableCreateCompanionBuilder,
          $$ProductTableTableUpdateCompanionBuilder,
          (
            ProductDto,
            BaseReferences<_$ShelfDatabase, $ProductTableTable, ProductDto>,
          ),
          ProductDto,
          PrefetchHooks Function()
        > {
  $$ProductTableTableTableManager(_$ShelfDatabase db, $ProductTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> defaultPrice = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => ProductTableCompanion(
                id: id,
                name: name,
                defaultPrice: defaultPrice,
                stock: stock,
                createdAt: createdAt,
                updatedAt: updatedAt,
                pendingDeleteUntil: pendingDeleteUntil,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int defaultPrice,
                required int stock,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => ProductTableCompanion.insert(
                id: id,
                name: name,
                defaultPrice: defaultPrice,
                stock: stock,
                createdAt: createdAt,
                updatedAt: updatedAt,
                pendingDeleteUntil: pendingDeleteUntil,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShelfDatabase,
      $ProductTableTable,
      ProductDto,
      $$ProductTableTableFilterComposer,
      $$ProductTableTableOrderingComposer,
      $$ProductTableTableAnnotationComposer,
      $$ProductTableTableCreateCompanionBuilder,
      $$ProductTableTableUpdateCompanionBuilder,
      (
        ProductDto,
        BaseReferences<_$ShelfDatabase, $ProductTableTable, ProductDto>,
      ),
      ProductDto,
      PrefetchHooks Function()
    >;
typedef $$CityTableTableCreateCompanionBuilder =
    CityTableCompanion Function({
      Value<int> id,
      required String name,
      required String department,
    });
typedef $$CityTableTableUpdateCompanionBuilder =
    CityTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> department,
    });

class $$CityTableTableFilterComposer
    extends Composer<_$ShelfDatabase, $CityTableTable> {
  $$CityTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CityTableTableOrderingComposer
    extends Composer<_$ShelfDatabase, $CityTableTable> {
  $$CityTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CityTableTableAnnotationComposer
    extends Composer<_$ShelfDatabase, $CityTableTable> {
  $$CityTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get department => $composableBuilder(
    column: $table.department,
    builder: (column) => column,
  );
}

class $$CityTableTableTableManager
    extends
        RootTableManager<
          _$ShelfDatabase,
          $CityTableTable,
          CityDto,
          $$CityTableTableFilterComposer,
          $$CityTableTableOrderingComposer,
          $$CityTableTableAnnotationComposer,
          $$CityTableTableCreateCompanionBuilder,
          $$CityTableTableUpdateCompanionBuilder,
          (CityDto, BaseReferences<_$ShelfDatabase, $CityTableTable, CityDto>),
          CityDto,
          PrefetchHooks Function()
        > {
  $$CityTableTableTableManager(_$ShelfDatabase db, $CityTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CityTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CityTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CityTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> department = const Value.absent(),
              }) => CityTableCompanion(
                id: id,
                name: name,
                department: department,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String department,
              }) => CityTableCompanion.insert(
                id: id,
                name: name,
                department: department,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CityTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShelfDatabase,
      $CityTableTable,
      CityDto,
      $$CityTableTableFilterComposer,
      $$CityTableTableOrderingComposer,
      $$CityTableTableAnnotationComposer,
      $$CityTableTableCreateCompanionBuilder,
      $$CityTableTableUpdateCompanionBuilder,
      (CityDto, BaseReferences<_$ShelfDatabase, $CityTableTable, CityDto>),
      CityDto,
      PrefetchHooks Function()
    >;

class $ShelfDatabaseManager {
  final _$ShelfDatabase _db;
  $ShelfDatabaseManager(this._db);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
  $$CityTableTableTableManager get cityTable =>
      $$CityTableTableTableManager(_db, _db.cityTable);
}
