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
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
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
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<int> purchasePrice = GeneratedColumn<int>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyIsoCodeMeta = const VerificationMeta(
    'currencyIsoCode',
  );
  @override
  late final GeneratedColumn<String> currencyIsoCode = GeneratedColumn<String>(
    'currency_iso_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
    stock,
    defaultPrice,
    purchasePrice,
    currencyIsoCode,
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
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    } else if (isInserting) {
      context.missing(_stockMeta);
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
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_purchasePriceMeta);
    }
    if (data.containsKey('currency_iso_code')) {
      context.handle(
        _currencyIsoCodeMeta,
        currencyIsoCode.isAcceptableOrUnknown(
          data['currency_iso_code']!,
          _currencyIsoCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyIsoCodeMeta);
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
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_price'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      currencyIsoCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_iso_code'],
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
  final Value<int> stock;
  final Value<int> defaultPrice;
  final Value<int> purchasePrice;
  final Value<String> currencyIsoCode;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> pendingDeleteUntil;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.stock = const Value.absent(),
    this.defaultPrice = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.currencyIsoCode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.pendingDeleteUntil = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int stock,
    required int defaultPrice,
    required int purchasePrice,
    required String currencyIsoCode,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.pendingDeleteUntil = const Value.absent(),
  }) : name = Value(name),
       stock = Value(stock),
       defaultPrice = Value(defaultPrice),
       purchasePrice = Value(purchasePrice),
       currencyIsoCode = Value(currencyIsoCode),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProductDto> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? stock,
    Expression<int>? defaultPrice,
    Expression<int>? purchasePrice,
    Expression<String>? currencyIsoCode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? pendingDeleteUntil,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stock != null) 'stock': stock,
      if (defaultPrice != null) 'default_price': defaultPrice,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (currencyIsoCode != null) 'currency_iso_code': currencyIsoCode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (pendingDeleteUntil != null)
        'pending_delete_until': pendingDeleteUntil,
    });
  }

  ProductTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int>? stock,
    Value<int>? defaultPrice,
    Value<int>? purchasePrice,
    Value<String>? currencyIsoCode,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? pendingDeleteUntil,
  }) {
    return ProductTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      stock: stock ?? this.stock,
      defaultPrice: defaultPrice ?? this.defaultPrice,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      currencyIsoCode: currencyIsoCode ?? this.currencyIsoCode,
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
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (defaultPrice.present) {
      map['default_price'] = Variable<int>(defaultPrice.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<int>(purchasePrice.value);
    }
    if (currencyIsoCode.present) {
      map['currency_iso_code'] = Variable<String>(currencyIsoCode.value);
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
          ..write('stock: $stock, ')
          ..write('defaultPrice: $defaultPrice, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('currencyIsoCode: $currencyIsoCode, ')
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

class $CustomerTableTable extends CustomerTable
    with TableInfo<$CustomerTableTable, CustomerDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomerTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _businessNameMeta = const VerificationMeta(
    'businessName',
  );
  @override
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<int> city = GeneratedColumn<int>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES city (id)',
    ),
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneNumberMeta = const VerificationMeta(
    'phoneNumber',
  );
  @override
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
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
    businessName,
    city,
    address,
    phoneNumber,
    createdAt,
    updatedAt,
    pendingDeleteUntil,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customer';
  @override
  VerificationContext validateIntegrity(
    Insertable<CustomerDto> instance, {
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
    if (data.containsKey('business_name')) {
      context.handle(
        _businessNameMeta,
        businessName.isAcceptableOrUnknown(
          data['business_name']!,
          _businessNameMeta,
        ),
      );
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('phone_number')) {
      context.handle(
        _phoneNumberMeta,
        phoneNumber.isAcceptableOrUnknown(
          data['phone_number']!,
          _phoneNumberMeta,
        ),
      );
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
  CustomerDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerDto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      businessName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}business_name'],
      ),
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}city'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      ),
      phoneNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone_number'],
      ),
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
  $CustomerTableTable createAlias(String alias) {
    return $CustomerTableTable(attachedDatabase, alias);
  }
}

class CustomerTableCompanion extends UpdateCompanion<CustomerDto> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> businessName;
  final Value<int> city;
  final Value<String?> address;
  final Value<String?> phoneNumber;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> pendingDeleteUntil;
  const CustomerTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.businessName = const Value.absent(),
    this.city = const Value.absent(),
    this.address = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.pendingDeleteUntil = const Value.absent(),
  });
  CustomerTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.businessName = const Value.absent(),
    required int city,
    this.address = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.pendingDeleteUntil = const Value.absent(),
  }) : name = Value(name),
       city = Value(city),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<CustomerDto> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? businessName,
    Expression<int>? city,
    Expression<String>? address,
    Expression<String>? phoneNumber,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? pendingDeleteUntil,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (businessName != null) 'business_name': businessName,
      if (city != null) 'city': city,
      if (address != null) 'address': address,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (pendingDeleteUntil != null)
        'pending_delete_until': pendingDeleteUntil,
    });
  }

  CustomerTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? businessName,
    Value<int>? city,
    Value<String?>? address,
    Value<String?>? phoneNumber,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? pendingDeleteUntil,
  }) {
    return CustomerTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      businessName: businessName ?? this.businessName,
      city: city ?? this.city,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
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
    if (businessName.present) {
      map['business_name'] = Variable<String>(businessName.value);
    }
    if (city.present) {
      map['city'] = Variable<int>(city.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (phoneNumber.present) {
      map['phone_number'] = Variable<String>(phoneNumber.value);
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
    return (StringBuffer('CustomerTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('businessName: $businessName, ')
          ..write('city: $city, ')
          ..write('address: $address, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('pendingDeleteUntil: $pendingDeleteUntil')
          ..write(')'))
        .toString();
  }
}

class $InvoiceTableTable extends InvoiceTable
    with TableInfo<$InvoiceTableTable, InvoiceDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remainingUnpaidBalanceMeta =
      const VerificationMeta('remainingUnpaidBalance');
  @override
  late final GeneratedColumn<int> remainingUnpaidBalance = GeneratedColumn<int>(
    'remaining_unpaid_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyIsoCodeMeta = const VerificationMeta(
    'currencyIsoCode',
  );
  @override
  late final GeneratedColumn<String> currencyIsoCode = GeneratedColumn<String>(
    'currency_iso_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _customerMeta = const VerificationMeta(
    'customer',
  );
  @override
  late final GeneratedColumn<int> customer = GeneratedColumn<int>(
    'customer',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES customer (id)',
    ),
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    number,
    date,
    remainingUnpaidBalance,
    total,
    currencyIsoCode,
    customer,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceDto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('remaining_unpaid_balance')) {
      context.handle(
        _remainingUnpaidBalanceMeta,
        remainingUnpaidBalance.isAcceptableOrUnknown(
          data['remaining_unpaid_balance']!,
          _remainingUnpaidBalanceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_remainingUnpaidBalanceMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
        _totalMeta,
        total.isAcceptableOrUnknown(data['total']!, _totalMeta),
      );
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('currency_iso_code')) {
      context.handle(
        _currencyIsoCodeMeta,
        currencyIsoCode.isAcceptableOrUnknown(
          data['currency_iso_code']!,
          _currencyIsoCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyIsoCodeMeta);
    }
    if (data.containsKey('customer')) {
      context.handle(
        _customerMeta,
        customer.isAcceptableOrUnknown(data['customer']!, _customerMeta),
      );
    } else if (isInserting) {
      context.missing(_customerMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceDto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      remainingUnpaidBalance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}remaining_unpaid_balance'],
      )!,
      customer: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer'],
      )!,
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      currencyIsoCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_iso_code'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $InvoiceTableTable createAlias(String alias) {
    return $InvoiceTableTable(attachedDatabase, alias);
  }
}

class InvoiceTableCompanion extends UpdateCompanion<InvoiceDto> {
  final Value<int> id;
  final Value<int> number;
  final Value<DateTime> date;
  final Value<int> remainingUnpaidBalance;
  final Value<int> total;
  final Value<String> currencyIsoCode;
  final Value<int> customer;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InvoiceTableCompanion({
    this.id = const Value.absent(),
    this.number = const Value.absent(),
    this.date = const Value.absent(),
    this.remainingUnpaidBalance = const Value.absent(),
    this.total = const Value.absent(),
    this.currencyIsoCode = const Value.absent(),
    this.customer = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InvoiceTableCompanion.insert({
    this.id = const Value.absent(),
    required int number,
    required DateTime date,
    required int remainingUnpaidBalance,
    required int total,
    required String currencyIsoCode,
    required int customer,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : number = Value(number),
       date = Value(date),
       remainingUnpaidBalance = Value(remainingUnpaidBalance),
       total = Value(total),
       currencyIsoCode = Value(currencyIsoCode),
       customer = Value(customer),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<InvoiceDto> custom({
    Expression<int>? id,
    Expression<int>? number,
    Expression<DateTime>? date,
    Expression<int>? remainingUnpaidBalance,
    Expression<int>? total,
    Expression<String>? currencyIsoCode,
    Expression<int>? customer,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (number != null) 'number': number,
      if (date != null) 'date': date,
      if (remainingUnpaidBalance != null)
        'remaining_unpaid_balance': remainingUnpaidBalance,
      if (total != null) 'total': total,
      if (currencyIsoCode != null) 'currency_iso_code': currencyIsoCode,
      if (customer != null) 'customer': customer,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InvoiceTableCompanion copyWith({
    Value<int>? id,
    Value<int>? number,
    Value<DateTime>? date,
    Value<int>? remainingUnpaidBalance,
    Value<int>? total,
    Value<String>? currencyIsoCode,
    Value<int>? customer,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return InvoiceTableCompanion(
      id: id ?? this.id,
      number: number ?? this.number,
      date: date ?? this.date,
      remainingUnpaidBalance:
          remainingUnpaidBalance ?? this.remainingUnpaidBalance,
      total: total ?? this.total,
      currencyIsoCode: currencyIsoCode ?? this.currencyIsoCode,
      customer: customer ?? this.customer,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (remainingUnpaidBalance.present) {
      map['remaining_unpaid_balance'] = Variable<int>(
        remainingUnpaidBalance.value,
      );
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (currencyIsoCode.present) {
      map['currency_iso_code'] = Variable<String>(currencyIsoCode.value);
    }
    if (customer.present) {
      map['customer'] = Variable<int>(customer.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceTableCompanion(')
          ..write('id: $id, ')
          ..write('number: $number, ')
          ..write('date: $date, ')
          ..write('remainingUnpaidBalance: $remainingUnpaidBalance, ')
          ..write('total: $total, ')
          ..write('currencyIsoCode: $currencyIsoCode, ')
          ..write('customer: $customer, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $InvoiceProductTableTable extends InvoiceProductTable
    with TableInfo<$InvoiceProductTableTable, InvoiceProductDto> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvoiceProductTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _invoiceMeta = const VerificationMeta(
    'invoice',
  );
  @override
  late final GeneratedColumn<int> invoice = GeneratedColumn<int>(
    'invoice',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES invoice (id)',
    ),
  );
  static const VerificationMeta _productMeta = const VerificationMeta(
    'product',
  );
  @override
  late final GeneratedColumn<int> product = GeneratedColumn<int>(
    'product',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES product (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitPriceMeta = const VerificationMeta(
    'unitPrice',
  );
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyIsoCodeMeta = const VerificationMeta(
    'currencyIsoCode',
  );
  @override
  late final GeneratedColumn<String> currencyIsoCode = GeneratedColumn<String>(
    'currency_iso_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  @override
  List<GeneratedColumn> get $columns => [
    id,
    invoice,
    product,
    quantity,
    unitPrice,
    currencyIsoCode,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_product';
  @override
  VerificationContext validateIntegrity(
    Insertable<InvoiceProductDto> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('invoice')) {
      context.handle(
        _invoiceMeta,
        invoice.isAcceptableOrUnknown(data['invoice']!, _invoiceMeta),
      );
    } else if (isInserting) {
      context.missing(_invoiceMeta);
    }
    if (data.containsKey('product')) {
      context.handle(
        _productMeta,
        product.isAcceptableOrUnknown(data['product']!, _productMeta),
      );
    } else if (isInserting) {
      context.missing(_productMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(
        _unitPriceMeta,
        unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta),
      );
    } else if (isInserting) {
      context.missing(_unitPriceMeta);
    }
    if (data.containsKey('currency_iso_code')) {
      context.handle(
        _currencyIsoCodeMeta,
        currencyIsoCode.isAcceptableOrUnknown(
          data['currency_iso_code']!,
          _currencyIsoCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currencyIsoCodeMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceProductDto map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceProductDto(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      invoice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}invoice'],
      )!,
      product: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}product'],
      )!,
      quantity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quantity'],
      )!,
      unitPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_price'],
      )!,
      currencyIsoCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_iso_code'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $InvoiceProductTableTable createAlias(String alias) {
    return $InvoiceProductTableTable(attachedDatabase, alias);
  }
}

class InvoiceProductTableCompanion extends UpdateCompanion<InvoiceProductDto> {
  final Value<int> id;
  final Value<int> invoice;
  final Value<int> product;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<String> currencyIsoCode;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InvoiceProductTableCompanion({
    this.id = const Value.absent(),
    this.invoice = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.currencyIsoCode = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  InvoiceProductTableCompanion.insert({
    this.id = const Value.absent(),
    required int invoice,
    required int product,
    required int quantity,
    required int unitPrice,
    required String currencyIsoCode,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) : invoice = Value(invoice),
       product = Value(product),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice),
       currencyIsoCode = Value(currencyIsoCode),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<InvoiceProductDto> custom({
    Expression<int>? id,
    Expression<int>? invoice,
    Expression<int>? product,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<String>? currencyIsoCode,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoice != null) 'invoice': invoice,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (currencyIsoCode != null) 'currency_iso_code': currencyIsoCode,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  InvoiceProductTableCompanion copyWith({
    Value<int>? id,
    Value<int>? invoice,
    Value<int>? product,
    Value<int>? quantity,
    Value<int>? unitPrice,
    Value<String>? currencyIsoCode,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return InvoiceProductTableCompanion(
      id: id ?? this.id,
      invoice: invoice ?? this.invoice,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      currencyIsoCode: currencyIsoCode ?? this.currencyIsoCode,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (invoice.present) {
      map['invoice'] = Variable<int>(invoice.value);
    }
    if (product.present) {
      map['product'] = Variable<int>(product.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (currencyIsoCode.present) {
      map['currency_iso_code'] = Variable<String>(currencyIsoCode.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceProductTableCompanion(')
          ..write('id: $id, ')
          ..write('invoice: $invoice, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('currencyIsoCode: $currencyIsoCode, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$ShelfDatabase extends GeneratedDatabase {
  _$ShelfDatabase(QueryExecutor e) : super(e);
  $ShelfDatabaseManager get managers => $ShelfDatabaseManager(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $CityTableTable cityTable = $CityTableTable(this);
  late final $CustomerTableTable customerTable = $CustomerTableTable(this);
  late final $InvoiceTableTable invoiceTable = $InvoiceTableTable(this);
  late final $InvoiceProductTableTable invoiceProductTable =
      $InvoiceProductTableTable(this);
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
    customerTable,
    invoiceTable,
    invoiceProductTable,
    idxUniqueNameNotPendingForDeletion,
  ];
}

typedef $$ProductTableTableCreateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      required String name,
      required int stock,
      required int defaultPrice,
      required int purchasePrice,
      required String currencyIsoCode,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> pendingDeleteUntil,
    });
typedef $$ProductTableTableUpdateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int> stock,
      Value<int> defaultPrice,
      Value<int> purchasePrice,
      Value<String> currencyIsoCode,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> pendingDeleteUntil,
    });

final class $$ProductTableTableReferences
    extends BaseReferences<_$ShelfDatabase, $ProductTableTable, ProductDto> {
  $$ProductTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$InvoiceProductTableTable, List<InvoiceProductDto>>
  _invoiceProductTableRefsTable(_$ShelfDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.invoiceProductTable,
        aliasName: $_aliasNameGenerator(
          db.productTable.id,
          db.invoiceProductTable.product,
        ),
      );

  $$InvoiceProductTableTableProcessedTableManager get invoiceProductTableRefs {
    final manager = $$InvoiceProductTableTableTableManager(
      $_db,
      $_db.invoiceProductTable,
    ).filter((f) => f.product.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _invoiceProductTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
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

  Expression<bool> invoiceProductTableRefs(
    Expression<bool> Function($$InvoiceProductTableTableFilterComposer f) f,
  ) {
    final $$InvoiceProductTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceProductTable,
      getReferencedColumn: (t) => t.product,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceProductTableTableFilterComposer(
            $db: $db,
            $table: $db.invoiceProductTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
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

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<int> get defaultPrice => $composableBuilder(
    column: $table.defaultPrice,
    builder: (column) => column,
  );

  GeneratedColumn<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get pendingDeleteUntil => $composableBuilder(
    column: $table.pendingDeleteUntil,
    builder: (column) => column,
  );

  Expression<T> invoiceProductTableRefs<T extends Object>(
    Expression<T> Function($$InvoiceProductTableTableAnnotationComposer a) f,
  ) {
    final $$InvoiceProductTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.invoiceProductTable,
          getReferencedColumn: (t) => t.product,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InvoiceProductTableTableAnnotationComposer(
                $db: $db,
                $table: $db.invoiceProductTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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
          (ProductDto, $$ProductTableTableReferences),
          ProductDto,
          PrefetchHooks Function({bool invoiceProductTableRefs})
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
                Value<int> stock = const Value.absent(),
                Value<int> defaultPrice = const Value.absent(),
                Value<int> purchasePrice = const Value.absent(),
                Value<String> currencyIsoCode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => ProductTableCompanion(
                id: id,
                name: name,
                stock: stock,
                defaultPrice: defaultPrice,
                purchasePrice: purchasePrice,
                currencyIsoCode: currencyIsoCode,
                createdAt: createdAt,
                updatedAt: updatedAt,
                pendingDeleteUntil: pendingDeleteUntil,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required int stock,
                required int defaultPrice,
                required int purchasePrice,
                required String currencyIsoCode,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => ProductTableCompanion.insert(
                id: id,
                name: name,
                stock: stock,
                defaultPrice: defaultPrice,
                purchasePrice: purchasePrice,
                currencyIsoCode: currencyIsoCode,
                createdAt: createdAt,
                updatedAt: updatedAt,
                pendingDeleteUntil: pendingDeleteUntil,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProductTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoiceProductTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (invoiceProductTableRefs) db.invoiceProductTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoiceProductTableRefs)
                    await $_getPrefetchedData<
                      ProductDto,
                      $ProductTableTable,
                      InvoiceProductDto
                    >(
                      currentTable: table,
                      referencedTable: $$ProductTableTableReferences
                          ._invoiceProductTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProductTableTableReferences(
                            db,
                            table,
                            p0,
                          ).invoiceProductTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.product == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (ProductDto, $$ProductTableTableReferences),
      ProductDto,
      PrefetchHooks Function({bool invoiceProductTableRefs})
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

final class $$CityTableTableReferences
    extends BaseReferences<_$ShelfDatabase, $CityTableTable, CityDto> {
  $$CityTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CustomerTableTable, List<CustomerDto>>
  _customerTableRefsTable(_$ShelfDatabase db) => MultiTypedResultKey.fromTable(
    db.customerTable,
    aliasName: $_aliasNameGenerator(db.cityTable.id, db.customerTable.city),
  );

  $$CustomerTableTableProcessedTableManager get customerTableRefs {
    final manager = $$CustomerTableTableTableManager(
      $_db,
      $_db.customerTable,
    ).filter((f) => f.city.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_customerTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  Expression<bool> customerTableRefs(
    Expression<bool> Function($$CustomerTableTableFilterComposer f) f,
  ) {
    final $$CustomerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customerTable,
      getReferencedColumn: (t) => t.city,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableTableFilterComposer(
            $db: $db,
            $table: $db.customerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  Expression<T> customerTableRefs<T extends Object>(
    Expression<T> Function($$CustomerTableTableAnnotationComposer a) f,
  ) {
    final $$CustomerTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.customerTable,
      getReferencedColumn: (t) => t.city,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableTableAnnotationComposer(
            $db: $db,
            $table: $db.customerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
          (CityDto, $$CityTableTableReferences),
          CityDto,
          PrefetchHooks Function({bool customerTableRefs})
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
              .map(
                (e) => (
                  e.readTable(table),
                  $$CityTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({customerTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (customerTableRefs) db.customerTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (customerTableRefs)
                    await $_getPrefetchedData<
                      CityDto,
                      $CityTableTable,
                      CustomerDto
                    >(
                      currentTable: table,
                      referencedTable: $$CityTableTableReferences
                          ._customerTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CityTableTableReferences(
                            db,
                            table,
                            p0,
                          ).customerTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.city == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (CityDto, $$CityTableTableReferences),
      CityDto,
      PrefetchHooks Function({bool customerTableRefs})
    >;
typedef $$CustomerTableTableCreateCompanionBuilder =
    CustomerTableCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> businessName,
      required int city,
      Value<String?> address,
      Value<String?> phoneNumber,
      required DateTime createdAt,
      required DateTime updatedAt,
      Value<DateTime?> pendingDeleteUntil,
    });
typedef $$CustomerTableTableUpdateCompanionBuilder =
    CustomerTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> businessName,
      Value<int> city,
      Value<String?> address,
      Value<String?> phoneNumber,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> pendingDeleteUntil,
    });

final class $$CustomerTableTableReferences
    extends BaseReferences<_$ShelfDatabase, $CustomerTableTable, CustomerDto> {
  $$CustomerTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CityTableTable _cityTable(_$ShelfDatabase db) =>
      db.cityTable.createAlias(
        $_aliasNameGenerator(db.customerTable.city, db.cityTable.id),
      );

  $$CityTableTableProcessedTableManager get city {
    final $_column = $_itemColumn<int>('city')!;

    final manager = $$CityTableTableTableManager(
      $_db,
      $_db.cityTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cityTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoiceTableTable, List<InvoiceDto>>
  _invoiceTableRefsTable(_$ShelfDatabase db) => MultiTypedResultKey.fromTable(
    db.invoiceTable,
    aliasName: $_aliasNameGenerator(
      db.customerTable.id,
      db.invoiceTable.customer,
    ),
  );

  $$InvoiceTableTableProcessedTableManager get invoiceTableRefs {
    final manager = $$InvoiceTableTableTableManager(
      $_db,
      $_db.invoiceTable,
    ).filter((f) => f.customer.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_invoiceTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CustomerTableTableFilterComposer
    extends Composer<_$ShelfDatabase, $CustomerTableTable> {
  $$CustomerTableTableFilterComposer({
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

  ColumnFilters<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
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

  $$CityTableTableFilterComposer get city {
    final $$CityTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.city,
      referencedTable: $db.cityTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CityTableTableFilterComposer(
            $db: $db,
            $table: $db.cityTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoiceTableRefs(
    Expression<bool> Function($$InvoiceTableTableFilterComposer f) f,
  ) {
    final $$InvoiceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceTable,
      getReferencedColumn: (t) => t.customer,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceTableTableFilterComposer(
            $db: $db,
            $table: $db.invoiceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomerTableTableOrderingComposer
    extends Composer<_$ShelfDatabase, $CustomerTableTable> {
  $$CustomerTableTableOrderingComposer({
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

  ColumnOrderings<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
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

  $$CityTableTableOrderingComposer get city {
    final $$CityTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.city,
      referencedTable: $db.cityTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CityTableTableOrderingComposer(
            $db: $db,
            $table: $db.cityTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CustomerTableTableAnnotationComposer
    extends Composer<_$ShelfDatabase, $CustomerTableTable> {
  $$CustomerTableTableAnnotationComposer({
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

  GeneratedColumn<String> get businessName => $composableBuilder(
    column: $table.businessName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get phoneNumber => $composableBuilder(
    column: $table.phoneNumber,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get pendingDeleteUntil => $composableBuilder(
    column: $table.pendingDeleteUntil,
    builder: (column) => column,
  );

  $$CityTableTableAnnotationComposer get city {
    final $$CityTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.city,
      referencedTable: $db.cityTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CityTableTableAnnotationComposer(
            $db: $db,
            $table: $db.cityTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoiceTableRefs<T extends Object>(
    Expression<T> Function($$InvoiceTableTableAnnotationComposer a) f,
  ) {
    final $$InvoiceTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceTable,
      getReferencedColumn: (t) => t.customer,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceTableTableAnnotationComposer(
            $db: $db,
            $table: $db.invoiceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CustomerTableTableTableManager
    extends
        RootTableManager<
          _$ShelfDatabase,
          $CustomerTableTable,
          CustomerDto,
          $$CustomerTableTableFilterComposer,
          $$CustomerTableTableOrderingComposer,
          $$CustomerTableTableAnnotationComposer,
          $$CustomerTableTableCreateCompanionBuilder,
          $$CustomerTableTableUpdateCompanionBuilder,
          (CustomerDto, $$CustomerTableTableReferences),
          CustomerDto,
          PrefetchHooks Function({bool city, bool invoiceTableRefs})
        > {
  $$CustomerTableTableTableManager(
    _$ShelfDatabase db,
    $CustomerTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomerTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomerTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomerTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> businessName = const Value.absent(),
                Value<int> city = const Value.absent(),
                Value<String?> address = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => CustomerTableCompanion(
                id: id,
                name: name,
                businessName: businessName,
                city: city,
                address: address,
                phoneNumber: phoneNumber,
                createdAt: createdAt,
                updatedAt: updatedAt,
                pendingDeleteUntil: pendingDeleteUntil,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> businessName = const Value.absent(),
                required int city,
                Value<String?> address = const Value.absent(),
                Value<String?> phoneNumber = const Value.absent(),
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => CustomerTableCompanion.insert(
                id: id,
                name: name,
                businessName: businessName,
                city: city,
                address: address,
                phoneNumber: phoneNumber,
                createdAt: createdAt,
                updatedAt: updatedAt,
                pendingDeleteUntil: pendingDeleteUntil,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CustomerTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({city = false, invoiceTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (invoiceTableRefs) db.invoiceTable],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (city) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.city,
                                referencedTable: $$CustomerTableTableReferences
                                    ._cityTable(db),
                                referencedColumn: $$CustomerTableTableReferences
                                    ._cityTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (invoiceTableRefs)
                    await $_getPrefetchedData<
                      CustomerDto,
                      $CustomerTableTable,
                      InvoiceDto
                    >(
                      currentTable: table,
                      referencedTable: $$CustomerTableTableReferences
                          ._invoiceTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CustomerTableTableReferences(
                            db,
                            table,
                            p0,
                          ).invoiceTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.customer == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CustomerTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShelfDatabase,
      $CustomerTableTable,
      CustomerDto,
      $$CustomerTableTableFilterComposer,
      $$CustomerTableTableOrderingComposer,
      $$CustomerTableTableAnnotationComposer,
      $$CustomerTableTableCreateCompanionBuilder,
      $$CustomerTableTableUpdateCompanionBuilder,
      (CustomerDto, $$CustomerTableTableReferences),
      CustomerDto,
      PrefetchHooks Function({bool city, bool invoiceTableRefs})
    >;
typedef $$InvoiceTableTableCreateCompanionBuilder =
    InvoiceTableCompanion Function({
      Value<int> id,
      required int number,
      required DateTime date,
      required int remainingUnpaidBalance,
      required int total,
      required String currencyIsoCode,
      required int customer,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$InvoiceTableTableUpdateCompanionBuilder =
    InvoiceTableCompanion Function({
      Value<int> id,
      Value<int> number,
      Value<DateTime> date,
      Value<int> remainingUnpaidBalance,
      Value<int> total,
      Value<String> currencyIsoCode,
      Value<int> customer,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$InvoiceTableTableReferences
    extends BaseReferences<_$ShelfDatabase, $InvoiceTableTable, InvoiceDto> {
  $$InvoiceTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CustomerTableTable _customerTable(_$ShelfDatabase db) =>
      db.customerTable.createAlias(
        $_aliasNameGenerator(db.invoiceTable.customer, db.customerTable.id),
      );

  $$CustomerTableTableProcessedTableManager get customer {
    final $_column = $_itemColumn<int>('customer')!;

    final manager = $$CustomerTableTableTableManager(
      $_db,
      $_db.customerTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_customerTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$InvoiceProductTableTable, List<InvoiceProductDto>>
  _invoiceProductTableRefsTable(_$ShelfDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.invoiceProductTable,
        aliasName: $_aliasNameGenerator(
          db.invoiceTable.id,
          db.invoiceProductTable.invoice,
        ),
      );

  $$InvoiceProductTableTableProcessedTableManager get invoiceProductTableRefs {
    final manager = $$InvoiceProductTableTableTableManager(
      $_db,
      $_db.invoiceProductTable,
    ).filter((f) => f.invoice.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _invoiceProductTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InvoiceTableTableFilterComposer
    extends Composer<_$ShelfDatabase, $InvoiceTableTable> {
  $$InvoiceTableTableFilterComposer({
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

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get remainingUnpaidBalance => $composableBuilder(
    column: $table.remainingUnpaidBalance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
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

  $$CustomerTableTableFilterComposer get customer {
    final $$CustomerTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customer,
      referencedTable: $db.customerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableTableFilterComposer(
            $db: $db,
            $table: $db.customerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> invoiceProductTableRefs(
    Expression<bool> Function($$InvoiceProductTableTableFilterComposer f) f,
  ) {
    final $$InvoiceProductTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.invoiceProductTable,
      getReferencedColumn: (t) => t.invoice,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceProductTableTableFilterComposer(
            $db: $db,
            $table: $db.invoiceProductTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InvoiceTableTableOrderingComposer
    extends Composer<_$ShelfDatabase, $InvoiceTableTable> {
  $$InvoiceTableTableOrderingComposer({
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

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get remainingUnpaidBalance => $composableBuilder(
    column: $table.remainingUnpaidBalance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get total => $composableBuilder(
    column: $table.total,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
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

  $$CustomerTableTableOrderingComposer get customer {
    final $$CustomerTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customer,
      referencedTable: $db.customerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableTableOrderingComposer(
            $db: $db,
            $table: $db.customerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceTableTableAnnotationComposer
    extends Composer<_$ShelfDatabase, $InvoiceTableTable> {
  $$InvoiceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get remainingUnpaidBalance => $composableBuilder(
    column: $table.remainingUnpaidBalance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get total =>
      $composableBuilder(column: $table.total, builder: (column) => column);

  GeneratedColumn<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CustomerTableTableAnnotationComposer get customer {
    final $$CustomerTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.customer,
      referencedTable: $db.customerTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CustomerTableTableAnnotationComposer(
            $db: $db,
            $table: $db.customerTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> invoiceProductTableRefs<T extends Object>(
    Expression<T> Function($$InvoiceProductTableTableAnnotationComposer a) f,
  ) {
    final $$InvoiceProductTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.invoiceProductTable,
          getReferencedColumn: (t) => t.invoice,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$InvoiceProductTableTableAnnotationComposer(
                $db: $db,
                $table: $db.invoiceProductTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$InvoiceTableTableTableManager
    extends
        RootTableManager<
          _$ShelfDatabase,
          $InvoiceTableTable,
          InvoiceDto,
          $$InvoiceTableTableFilterComposer,
          $$InvoiceTableTableOrderingComposer,
          $$InvoiceTableTableAnnotationComposer,
          $$InvoiceTableTableCreateCompanionBuilder,
          $$InvoiceTableTableUpdateCompanionBuilder,
          (InvoiceDto, $$InvoiceTableTableReferences),
          InvoiceDto,
          PrefetchHooks Function({bool customer, bool invoiceProductTableRefs})
        > {
  $$InvoiceTableTableTableManager(_$ShelfDatabase db, $InvoiceTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$InvoiceTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> remainingUnpaidBalance = const Value.absent(),
                Value<int> total = const Value.absent(),
                Value<String> currencyIsoCode = const Value.absent(),
                Value<int> customer = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InvoiceTableCompanion(
                id: id,
                number: number,
                date: date,
                remainingUnpaidBalance: remainingUnpaidBalance,
                total: total,
                currencyIsoCode: currencyIsoCode,
                customer: customer,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int number,
                required DateTime date,
                required int remainingUnpaidBalance,
                required int total,
                required String currencyIsoCode,
                required int customer,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => InvoiceTableCompanion.insert(
                id: id,
                number: number,
                date: date,
                remainingUnpaidBalance: remainingUnpaidBalance,
                total: total,
                currencyIsoCode: currencyIsoCode,
                customer: customer,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoiceTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({customer = false, invoiceProductTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (invoiceProductTableRefs) db.invoiceProductTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (customer) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.customer,
                                    referencedTable:
                                        $$InvoiceTableTableReferences
                                            ._customerTable(db),
                                    referencedColumn:
                                        $$InvoiceTableTableReferences
                                            ._customerTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (invoiceProductTableRefs)
                        await $_getPrefetchedData<
                          InvoiceDto,
                          $InvoiceTableTable,
                          InvoiceProductDto
                        >(
                          currentTable: table,
                          referencedTable: $$InvoiceTableTableReferences
                              ._invoiceProductTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$InvoiceTableTableReferences(
                                db,
                                table,
                                p0,
                              ).invoiceProductTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.invoice == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$InvoiceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShelfDatabase,
      $InvoiceTableTable,
      InvoiceDto,
      $$InvoiceTableTableFilterComposer,
      $$InvoiceTableTableOrderingComposer,
      $$InvoiceTableTableAnnotationComposer,
      $$InvoiceTableTableCreateCompanionBuilder,
      $$InvoiceTableTableUpdateCompanionBuilder,
      (InvoiceDto, $$InvoiceTableTableReferences),
      InvoiceDto,
      PrefetchHooks Function({bool customer, bool invoiceProductTableRefs})
    >;
typedef $$InvoiceProductTableTableCreateCompanionBuilder =
    InvoiceProductTableCompanion Function({
      Value<int> id,
      required int invoice,
      required int product,
      required int quantity,
      required int unitPrice,
      required String currencyIsoCode,
      required DateTime createdAt,
      required DateTime updatedAt,
    });
typedef $$InvoiceProductTableTableUpdateCompanionBuilder =
    InvoiceProductTableCompanion Function({
      Value<int> id,
      Value<int> invoice,
      Value<int> product,
      Value<int> quantity,
      Value<int> unitPrice,
      Value<String> currencyIsoCode,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$InvoiceProductTableTableReferences
    extends
        BaseReferences<
          _$ShelfDatabase,
          $InvoiceProductTableTable,
          InvoiceProductDto
        > {
  $$InvoiceProductTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $InvoiceTableTable _invoiceTable(_$ShelfDatabase db) =>
      db.invoiceTable.createAlias(
        $_aliasNameGenerator(
          db.invoiceProductTable.invoice,
          db.invoiceTable.id,
        ),
      );

  $$InvoiceTableTableProcessedTableManager get invoice {
    final $_column = $_itemColumn<int>('invoice')!;

    final manager = $$InvoiceTableTableTableManager(
      $_db,
      $_db.invoiceTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_invoiceTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ProductTableTable _productTable(_$ShelfDatabase db) =>
      db.productTable.createAlias(
        $_aliasNameGenerator(
          db.invoiceProductTable.product,
          db.productTable.id,
        ),
      );

  $$ProductTableTableProcessedTableManager get product {
    final $_column = $_itemColumn<int>('product')!;

    final manager = $$ProductTableTableTableManager(
      $_db,
      $_db.productTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$InvoiceProductTableTableFilterComposer
    extends Composer<_$ShelfDatabase, $InvoiceProductTableTable> {
  $$InvoiceProductTableTableFilterComposer({
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

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
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

  $$InvoiceTableTableFilterComposer get invoice {
    final $$InvoiceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoice,
      referencedTable: $db.invoiceTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceTableTableFilterComposer(
            $db: $db,
            $table: $db.invoiceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableTableFilterComposer get product {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.product,
      referencedTable: $db.productTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableTableFilterComposer(
            $db: $db,
            $table: $db.productTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceProductTableTableOrderingComposer
    extends Composer<_$ShelfDatabase, $InvoiceProductTableTable> {
  $$InvoiceProductTableTableOrderingComposer({
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

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get unitPrice => $composableBuilder(
    column: $table.unitPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
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

  $$InvoiceTableTableOrderingComposer get invoice {
    final $$InvoiceTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoice,
      referencedTable: $db.invoiceTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceTableTableOrderingComposer(
            $db: $db,
            $table: $db.invoiceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableTableOrderingComposer get product {
    final $$ProductTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.product,
      referencedTable: $db.productTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableTableOrderingComposer(
            $db: $db,
            $table: $db.productTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceProductTableTableAnnotationComposer
    extends Composer<_$ShelfDatabase, $InvoiceProductTableTable> {
  $$InvoiceProductTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<String> get currencyIsoCode => $composableBuilder(
    column: $table.currencyIsoCode,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$InvoiceTableTableAnnotationComposer get invoice {
    final $$InvoiceTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.invoice,
      referencedTable: $db.invoiceTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InvoiceTableTableAnnotationComposer(
            $db: $db,
            $table: $db.invoiceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ProductTableTableAnnotationComposer get product {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.product,
      referencedTable: $db.productTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProductTableTableAnnotationComposer(
            $db: $db,
            $table: $db.productTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$InvoiceProductTableTableTableManager
    extends
        RootTableManager<
          _$ShelfDatabase,
          $InvoiceProductTableTable,
          InvoiceProductDto,
          $$InvoiceProductTableTableFilterComposer,
          $$InvoiceProductTableTableOrderingComposer,
          $$InvoiceProductTableTableAnnotationComposer,
          $$InvoiceProductTableTableCreateCompanionBuilder,
          $$InvoiceProductTableTableUpdateCompanionBuilder,
          (InvoiceProductDto, $$InvoiceProductTableTableReferences),
          InvoiceProductDto,
          PrefetchHooks Function({bool invoice, bool product})
        > {
  $$InvoiceProductTableTableTableManager(
    _$ShelfDatabase db,
    $InvoiceProductTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InvoiceProductTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$InvoiceProductTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InvoiceProductTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> invoice = const Value.absent(),
                Value<int> product = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> unitPrice = const Value.absent(),
                Value<String> currencyIsoCode = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => InvoiceProductTableCompanion(
                id: id,
                invoice: invoice,
                product: product,
                quantity: quantity,
                unitPrice: unitPrice,
                currencyIsoCode: currencyIsoCode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int invoice,
                required int product,
                required int quantity,
                required int unitPrice,
                required String currencyIsoCode,
                required DateTime createdAt,
                required DateTime updatedAt,
              }) => InvoiceProductTableCompanion.insert(
                id: id,
                invoice: invoice,
                product: product,
                quantity: quantity,
                unitPrice: unitPrice,
                currencyIsoCode: currencyIsoCode,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$InvoiceProductTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({invoice = false, product = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (invoice) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.invoice,
                                referencedTable:
                                    $$InvoiceProductTableTableReferences
                                        ._invoiceTable(db),
                                referencedColumn:
                                    $$InvoiceProductTableTableReferences
                                        ._invoiceTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (product) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.product,
                                referencedTable:
                                    $$InvoiceProductTableTableReferences
                                        ._productTable(db),
                                referencedColumn:
                                    $$InvoiceProductTableTableReferences
                                        ._productTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$InvoiceProductTableTableProcessedTableManager =
    ProcessedTableManager<
      _$ShelfDatabase,
      $InvoiceProductTableTable,
      InvoiceProductDto,
      $$InvoiceProductTableTableFilterComposer,
      $$InvoiceProductTableTableOrderingComposer,
      $$InvoiceProductTableTableAnnotationComposer,
      $$InvoiceProductTableTableCreateCompanionBuilder,
      $$InvoiceProductTableTableUpdateCompanionBuilder,
      (InvoiceProductDto, $$InvoiceProductTableTableReferences),
      InvoiceProductDto,
      PrefetchHooks Function({bool invoice, bool product})
    >;

class $ShelfDatabaseManager {
  final _$ShelfDatabase _db;
  $ShelfDatabaseManager(this._db);
  $$ProductTableTableTableManager get productTable =>
      $$ProductTableTableTableManager(_db, _db.productTable);
  $$CityTableTableTableManager get cityTable =>
      $$CityTableTableTableManager(_db, _db.cityTable);
  $$CustomerTableTableTableManager get customerTable =>
      $$CustomerTableTableTableManager(_db, _db.customerTable);
  $$InvoiceTableTableTableManager get invoiceTable =>
      $$InvoiceTableTableTableManager(_db, _db.invoiceTable);
  $$InvoiceProductTableTableTableManager get invoiceProductTable =>
      $$InvoiceProductTableTableTableManager(_db, _db.invoiceProductTable);
}
