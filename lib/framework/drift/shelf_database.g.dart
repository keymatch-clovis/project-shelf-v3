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
    purchasePrice,
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
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_price'],
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
  final Value<int> purchasePrice;
  final Value<int> stock;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> pendingDeleteUntil;
  const ProductTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.defaultPrice = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.stock = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.pendingDeleteUntil = const Value.absent(),
  });
  ProductTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int defaultPrice,
    required int purchasePrice,
    required int stock,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.pendingDeleteUntil = const Value.absent(),
  }) : name = Value(name),
       defaultPrice = Value(defaultPrice),
       purchasePrice = Value(purchasePrice),
       stock = Value(stock),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<ProductDto> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? defaultPrice,
    Expression<int>? purchasePrice,
    Expression<int>? stock,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? pendingDeleteUntil,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (defaultPrice != null) 'default_price': defaultPrice,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
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
    Value<int>? purchasePrice,
    Value<int>? stock,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime?>? pendingDeleteUntil,
  }) {
    return ProductTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      defaultPrice: defaultPrice ?? this.defaultPrice,
      purchasePrice: purchasePrice ?? this.purchasePrice,
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
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<int>(purchasePrice.value);
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
          ..write('purchasePrice: $purchasePrice, ')
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
      'REFERENCES product (id)',
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

abstract class _$ShelfDatabase extends GeneratedDatabase {
  _$ShelfDatabase(QueryExecutor e) : super(e);
  $ShelfDatabaseManager get managers => $ShelfDatabaseManager(this);
  late final $ProductTableTable productTable = $ProductTableTable(this);
  late final $CityTableTable cityTable = $CityTableTable(this);
  late final $CustomerTableTable customerTable = $CustomerTableTable(this);
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
    idxUniqueNameNotPendingForDeletion,
  ];
}

typedef $$ProductTableTableCreateCompanionBuilder =
    ProductTableCompanion Function({
      Value<int> id,
      required String name,
      required int defaultPrice,
      required int purchasePrice,
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
      Value<int> purchasePrice,
      Value<int> stock,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime?> pendingDeleteUntil,
    });

final class $$ProductTableTableReferences
    extends BaseReferences<_$ShelfDatabase, $ProductTableTable, ProductDto> {
  $$ProductTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CustomerTableTable, List<CustomerDto>>
  _customerTableRefsTable(_$ShelfDatabase db) => MultiTypedResultKey.fromTable(
    db.customerTable,
    aliasName: $_aliasNameGenerator(db.productTable.id, db.customerTable.city),
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

  ColumnFilters<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
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

  ColumnOrderings<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
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

  GeneratedColumn<int> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
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
          PrefetchHooks Function({bool customerTableRefs})
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
                Value<int> purchasePrice = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => ProductTableCompanion(
                id: id,
                name: name,
                defaultPrice: defaultPrice,
                purchasePrice: purchasePrice,
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
                required int purchasePrice,
                required int stock,
                required DateTime createdAt,
                required DateTime updatedAt,
                Value<DateTime?> pendingDeleteUntil = const Value.absent(),
              }) => ProductTableCompanion.insert(
                id: id,
                name: name,
                defaultPrice: defaultPrice,
                purchasePrice: purchasePrice,
                stock: stock,
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
                      ProductDto,
                      $ProductTableTable,
                      CustomerDto
                    >(
                      currentTable: table,
                      referencedTable: $$ProductTableTableReferences
                          ._customerTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ProductTableTableReferences(
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
      PrefetchHooks Function({bool customerTableRefs})
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

  static $ProductTableTable _cityTable(_$ShelfDatabase db) =>
      db.productTable.createAlias(
        $_aliasNameGenerator(db.customerTable.city, db.productTable.id),
      );

  $$ProductTableTableProcessedTableManager get city {
    final $_column = $_itemColumn<int>('city')!;

    final manager = $$ProductTableTableTableManager(
      $_db,
      $_db.productTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_cityTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
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

  $$ProductTableTableFilterComposer get city {
    final $$ProductTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.city,
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

  $$ProductTableTableOrderingComposer get city {
    final $$ProductTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.city,
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

  $$ProductTableTableAnnotationComposer get city {
    final $$ProductTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.city,
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
          PrefetchHooks Function({bool city})
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
          prefetchHooksCallback: ({city = false}) {
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
                return [];
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
      PrefetchHooks Function({bool city})
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
}
