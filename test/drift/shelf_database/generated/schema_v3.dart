// dart format width=80
// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
import 'package:drift/drift.dart';

class Product extends Table with TableInfo<Product, ProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Product(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> defaultPrice = GeneratedColumn<int>(
    'default_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> purchasePrice = GeneratedColumn<int>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> currencyIsoCode = GeneratedColumn<String>(
    'currency_iso_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      defaultPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}default_price'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}purchase_price'],
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
  Product createAlias(String alias) {
    return Product(attachedDatabase, alias);
  }
}

class ProductData extends DataClass implements Insertable<ProductData> {
  final int id;
  final String name;
  final int stock;
  final int defaultPrice;
  final int purchasePrice;
  final String currencyIsoCode;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pendingDeleteUntil;
  const ProductData({
    required this.id,
    required this.name,
    required this.stock,
    required this.defaultPrice,
    required this.purchasePrice,
    required this.currencyIsoCode,
    required this.createdAt,
    required this.updatedAt,
    this.pendingDeleteUntil,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['stock'] = Variable<int>(stock);
    map['default_price'] = Variable<int>(defaultPrice);
    map['purchase_price'] = Variable<int>(purchasePrice);
    map['currency_iso_code'] = Variable<String>(currencyIsoCode);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || pendingDeleteUntil != null) {
      map['pending_delete_until'] = Variable<DateTime>(pendingDeleteUntil);
    }
    return map;
  }

  ProductCompanion toCompanion(bool nullToAbsent) {
    return ProductCompanion(
      id: Value(id),
      name: Value(name),
      stock: Value(stock),
      defaultPrice: Value(defaultPrice),
      purchasePrice: Value(purchasePrice),
      currencyIsoCode: Value(currencyIsoCode),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      pendingDeleteUntil: pendingDeleteUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(pendingDeleteUntil),
    );
  }

  factory ProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      stock: serializer.fromJson<int>(json['stock']),
      defaultPrice: serializer.fromJson<int>(json['defaultPrice']),
      purchasePrice: serializer.fromJson<int>(json['purchasePrice']),
      currencyIsoCode: serializer.fromJson<String>(json['currencyIsoCode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      pendingDeleteUntil: serializer.fromJson<DateTime?>(
        json['pendingDeleteUntil'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'stock': serializer.toJson<int>(stock),
      'defaultPrice': serializer.toJson<int>(defaultPrice),
      'purchasePrice': serializer.toJson<int>(purchasePrice),
      'currencyIsoCode': serializer.toJson<String>(currencyIsoCode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'pendingDeleteUntil': serializer.toJson<DateTime?>(pendingDeleteUntil),
    };
  }

  ProductData copyWith({
    int? id,
    String? name,
    int? stock,
    int? defaultPrice,
    int? purchasePrice,
    String? currencyIsoCode,
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> pendingDeleteUntil = const Value.absent(),
  }) => ProductData(
    id: id ?? this.id,
    name: name ?? this.name,
    stock: stock ?? this.stock,
    defaultPrice: defaultPrice ?? this.defaultPrice,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    currencyIsoCode: currencyIsoCode ?? this.currencyIsoCode,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    pendingDeleteUntil: pendingDeleteUntil.present
        ? pendingDeleteUntil.value
        : this.pendingDeleteUntil,
  );
  ProductData copyWithCompanion(ProductCompanion data) {
    return ProductData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      stock: data.stock.present ? data.stock.value : this.stock,
      defaultPrice: data.defaultPrice.present
          ? data.defaultPrice.value
          : this.defaultPrice,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      currencyIsoCode: data.currencyIsoCode.present
          ? data.currencyIsoCode.value
          : this.currencyIsoCode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      pendingDeleteUntil: data.pendingDeleteUntil.present
          ? data.pendingDeleteUntil.value
          : this.pendingDeleteUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductData(')
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

  @override
  int get hashCode => Object.hash(
    id,
    name,
    stock,
    defaultPrice,
    purchasePrice,
    currencyIsoCode,
    createdAt,
    updatedAt,
    pendingDeleteUntil,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductData &&
          other.id == this.id &&
          other.name == this.name &&
          other.stock == this.stock &&
          other.defaultPrice == this.defaultPrice &&
          other.purchasePrice == this.purchasePrice &&
          other.currencyIsoCode == this.currencyIsoCode &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.pendingDeleteUntil == this.pendingDeleteUntil);
}

class ProductCompanion extends UpdateCompanion<ProductData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> stock;
  final Value<int> defaultPrice;
  final Value<int> purchasePrice;
  final Value<String> currencyIsoCode;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> pendingDeleteUntil;
  const ProductCompanion({
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
  ProductCompanion.insert({
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
  static Insertable<ProductData> custom({
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

  ProductCompanion copyWith({
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
    return ProductCompanion(
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
    return (StringBuffer('ProductCompanion(')
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

class City extends Table with TableInfo<City, CityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  City(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CityData(
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
  City createAlias(String alias) {
    return City(attachedDatabase, alias);
  }
}

class CityData extends DataClass implements Insertable<CityData> {
  final int id;
  final String name;
  final String department;
  const CityData({
    required this.id,
    required this.name,
    required this.department,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['department'] = Variable<String>(department);
    return map;
  }

  CityCompanion toCompanion(bool nullToAbsent) {
    return CityCompanion(
      id: Value(id),
      name: Value(name),
      department: Value(department),
    );
  }

  factory CityData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CityData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      department: serializer.fromJson<String>(json['department']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'department': serializer.toJson<String>(department),
    };
  }

  CityData copyWith({int? id, String? name, String? department}) => CityData(
    id: id ?? this.id,
    name: name ?? this.name,
    department: department ?? this.department,
  );
  CityData copyWithCompanion(CityCompanion data) {
    return CityData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      department: data.department.present
          ? data.department.value
          : this.department,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CityData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('department: $department')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, department);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CityData &&
          other.id == this.id &&
          other.name == this.name &&
          other.department == this.department);
}

class CityCompanion extends UpdateCompanion<CityData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> department;
  const CityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.department = const Value.absent(),
  });
  CityCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String department,
  }) : name = Value(name),
       department = Value(department);
  static Insertable<CityData> custom({
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

  CityCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? department,
  }) {
    return CityCompanion(
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
    return (StringBuffer('CityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('department: $department')
          ..write(')'))
        .toString();
  }
}

class Customer extends Table with TableInfo<Customer, CustomerData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Customer(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> businessName = GeneratedColumn<String>(
    'business_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
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
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
    'phone_number',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomerData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomerData(
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
  Customer createAlias(String alias) {
    return Customer(attachedDatabase, alias);
  }
}

class CustomerData extends DataClass implements Insertable<CustomerData> {
  final int id;
  final String name;
  final String? businessName;
  final int city;
  final String? address;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? pendingDeleteUntil;
  const CustomerData({
    required this.id,
    required this.name,
    this.businessName,
    required this.city,
    this.address,
    this.phoneNumber,
    required this.createdAt,
    required this.updatedAt,
    this.pendingDeleteUntil,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || businessName != null) {
      map['business_name'] = Variable<String>(businessName);
    }
    map['city'] = Variable<int>(city);
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || phoneNumber != null) {
      map['phone_number'] = Variable<String>(phoneNumber);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || pendingDeleteUntil != null) {
      map['pending_delete_until'] = Variable<DateTime>(pendingDeleteUntil);
    }
    return map;
  }

  CustomerCompanion toCompanion(bool nullToAbsent) {
    return CustomerCompanion(
      id: Value(id),
      name: Value(name),
      businessName: businessName == null && nullToAbsent
          ? const Value.absent()
          : Value(businessName),
      city: Value(city),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      phoneNumber: phoneNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(phoneNumber),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      pendingDeleteUntil: pendingDeleteUntil == null && nullToAbsent
          ? const Value.absent()
          : Value(pendingDeleteUntil),
    );
  }

  factory CustomerData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomerData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      businessName: serializer.fromJson<String?>(json['businessName']),
      city: serializer.fromJson<int>(json['city']),
      address: serializer.fromJson<String?>(json['address']),
      phoneNumber: serializer.fromJson<String?>(json['phoneNumber']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      pendingDeleteUntil: serializer.fromJson<DateTime?>(
        json['pendingDeleteUntil'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'businessName': serializer.toJson<String?>(businessName),
      'city': serializer.toJson<int>(city),
      'address': serializer.toJson<String?>(address),
      'phoneNumber': serializer.toJson<String?>(phoneNumber),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'pendingDeleteUntil': serializer.toJson<DateTime?>(pendingDeleteUntil),
    };
  }

  CustomerData copyWith({
    int? id,
    String? name,
    Value<String?> businessName = const Value.absent(),
    int? city,
    Value<String?> address = const Value.absent(),
    Value<String?> phoneNumber = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
    Value<DateTime?> pendingDeleteUntil = const Value.absent(),
  }) => CustomerData(
    id: id ?? this.id,
    name: name ?? this.name,
    businessName: businessName.present ? businessName.value : this.businessName,
    city: city ?? this.city,
    address: address.present ? address.value : this.address,
    phoneNumber: phoneNumber.present ? phoneNumber.value : this.phoneNumber,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    pendingDeleteUntil: pendingDeleteUntil.present
        ? pendingDeleteUntil.value
        : this.pendingDeleteUntil,
  );
  CustomerData copyWithCompanion(CustomerCompanion data) {
    return CustomerData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      businessName: data.businessName.present
          ? data.businessName.value
          : this.businessName,
      city: data.city.present ? data.city.value : this.city,
      address: data.address.present ? data.address.value : this.address,
      phoneNumber: data.phoneNumber.present
          ? data.phoneNumber.value
          : this.phoneNumber,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      pendingDeleteUntil: data.pendingDeleteUntil.present
          ? data.pendingDeleteUntil.value
          : this.pendingDeleteUntil,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomerData(')
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

  @override
  int get hashCode => Object.hash(
    id,
    name,
    businessName,
    city,
    address,
    phoneNumber,
    createdAt,
    updatedAt,
    pendingDeleteUntil,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomerData &&
          other.id == this.id &&
          other.name == this.name &&
          other.businessName == this.businessName &&
          other.city == this.city &&
          other.address == this.address &&
          other.phoneNumber == this.phoneNumber &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.pendingDeleteUntil == this.pendingDeleteUntil);
}

class CustomerCompanion extends UpdateCompanion<CustomerData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> businessName;
  final Value<int> city;
  final Value<String?> address;
  final Value<String?> phoneNumber;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> pendingDeleteUntil;
  const CustomerCompanion({
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
  CustomerCompanion.insert({
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
  static Insertable<CustomerData> custom({
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

  CustomerCompanion copyWith({
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
    return CustomerCompanion(
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
    return (StringBuffer('CustomerCompanion(')
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

class Invoice extends Table with TableInfo<Invoice, InvoiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Invoice(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> remainingUnpaidBalance = GeneratedColumn<int>(
    'remaining_unpaid_balance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
    'total',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> currencyIsoCode = GeneratedColumn<String>(
    'currency_iso_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
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
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceData(
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
      total: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}total'],
      )!,
      currencyIsoCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency_iso_code'],
      )!,
      customer: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}customer'],
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
  Invoice createAlias(String alias) {
    return Invoice(attachedDatabase, alias);
  }
}

class InvoiceData extends DataClass implements Insertable<InvoiceData> {
  final int id;
  final int number;
  final DateTime date;
  final int remainingUnpaidBalance;
  final int total;
  final String currencyIsoCode;
  final int customer;
  final DateTime createdAt;
  final DateTime updatedAt;
  const InvoiceData({
    required this.id,
    required this.number,
    required this.date,
    required this.remainingUnpaidBalance,
    required this.total,
    required this.currencyIsoCode,
    required this.customer,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['number'] = Variable<int>(number);
    map['date'] = Variable<DateTime>(date);
    map['remaining_unpaid_balance'] = Variable<int>(remainingUnpaidBalance);
    map['total'] = Variable<int>(total);
    map['currency_iso_code'] = Variable<String>(currencyIsoCode);
    map['customer'] = Variable<int>(customer);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  InvoiceCompanion toCompanion(bool nullToAbsent) {
    return InvoiceCompanion(
      id: Value(id),
      number: Value(number),
      date: Value(date),
      remainingUnpaidBalance: Value(remainingUnpaidBalance),
      total: Value(total),
      currencyIsoCode: Value(currencyIsoCode),
      customer: Value(customer),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory InvoiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceData(
      id: serializer.fromJson<int>(json['id']),
      number: serializer.fromJson<int>(json['number']),
      date: serializer.fromJson<DateTime>(json['date']),
      remainingUnpaidBalance: serializer.fromJson<int>(
        json['remainingUnpaidBalance'],
      ),
      total: serializer.fromJson<int>(json['total']),
      currencyIsoCode: serializer.fromJson<String>(json['currencyIsoCode']),
      customer: serializer.fromJson<int>(json['customer']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'number': serializer.toJson<int>(number),
      'date': serializer.toJson<DateTime>(date),
      'remainingUnpaidBalance': serializer.toJson<int>(remainingUnpaidBalance),
      'total': serializer.toJson<int>(total),
      'currencyIsoCode': serializer.toJson<String>(currencyIsoCode),
      'customer': serializer.toJson<int>(customer),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  InvoiceData copyWith({
    int? id,
    int? number,
    DateTime? date,
    int? remainingUnpaidBalance,
    int? total,
    String? currencyIsoCode,
    int? customer,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => InvoiceData(
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
  InvoiceData copyWithCompanion(InvoiceCompanion data) {
    return InvoiceData(
      id: data.id.present ? data.id.value : this.id,
      number: data.number.present ? data.number.value : this.number,
      date: data.date.present ? data.date.value : this.date,
      remainingUnpaidBalance: data.remainingUnpaidBalance.present
          ? data.remainingUnpaidBalance.value
          : this.remainingUnpaidBalance,
      total: data.total.present ? data.total.value : this.total,
      currencyIsoCode: data.currencyIsoCode.present
          ? data.currencyIsoCode.value
          : this.currencyIsoCode,
      customer: data.customer.present ? data.customer.value : this.customer,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceData(')
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

  @override
  int get hashCode => Object.hash(
    id,
    number,
    date,
    remainingUnpaidBalance,
    total,
    currencyIsoCode,
    customer,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceData &&
          other.id == this.id &&
          other.number == this.number &&
          other.date == this.date &&
          other.remainingUnpaidBalance == this.remainingUnpaidBalance &&
          other.total == this.total &&
          other.currencyIsoCode == this.currencyIsoCode &&
          other.customer == this.customer &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class InvoiceCompanion extends UpdateCompanion<InvoiceData> {
  final Value<int> id;
  final Value<int> number;
  final Value<DateTime> date;
  final Value<int> remainingUnpaidBalance;
  final Value<int> total;
  final Value<String> currencyIsoCode;
  final Value<int> customer;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const InvoiceCompanion({
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
  InvoiceCompanion.insert({
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
  static Insertable<InvoiceData> custom({
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

  InvoiceCompanion copyWith({
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
    return InvoiceCompanion(
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
    return (StringBuffer('InvoiceCompanion(')
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

class InvoiceProduct extends Table
    with TableInfo<InvoiceProduct, InvoiceProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  InvoiceProduct(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
    'unit_price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<String> currencyIsoCode = GeneratedColumn<String>(
    'currency_iso_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invoice_product';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  InvoiceProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvoiceProductData(
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
  InvoiceProduct createAlias(String alias) {
    return InvoiceProduct(attachedDatabase, alias);
  }
}

class InvoiceProductData extends DataClass
    implements Insertable<InvoiceProductData> {
  final int id;
  final int invoice;
  final int product;
  final int quantity;
  final int unitPrice;
  final String currencyIsoCode;
  final DateTime createdAt;
  const InvoiceProductData({
    required this.id,
    required this.invoice,
    required this.product,
    required this.quantity,
    required this.unitPrice,
    required this.currencyIsoCode,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['invoice'] = Variable<int>(invoice);
    map['product'] = Variable<int>(product);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['currency_iso_code'] = Variable<String>(currencyIsoCode);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  InvoiceProductCompanion toCompanion(bool nullToAbsent) {
    return InvoiceProductCompanion(
      id: Value(id),
      invoice: Value(invoice),
      product: Value(product),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      currencyIsoCode: Value(currencyIsoCode),
      createdAt: Value(createdAt),
    );
  }

  factory InvoiceProductData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvoiceProductData(
      id: serializer.fromJson<int>(json['id']),
      invoice: serializer.fromJson<int>(json['invoice']),
      product: serializer.fromJson<int>(json['product']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      currencyIsoCode: serializer.fromJson<String>(json['currencyIsoCode']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'invoice': serializer.toJson<int>(invoice),
      'product': serializer.toJson<int>(product),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'currencyIsoCode': serializer.toJson<String>(currencyIsoCode),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  InvoiceProductData copyWith({
    int? id,
    int? invoice,
    int? product,
    int? quantity,
    int? unitPrice,
    String? currencyIsoCode,
    DateTime? createdAt,
  }) => InvoiceProductData(
    id: id ?? this.id,
    invoice: invoice ?? this.invoice,
    product: product ?? this.product,
    quantity: quantity ?? this.quantity,
    unitPrice: unitPrice ?? this.unitPrice,
    currencyIsoCode: currencyIsoCode ?? this.currencyIsoCode,
    createdAt: createdAt ?? this.createdAt,
  );
  InvoiceProductData copyWithCompanion(InvoiceProductCompanion data) {
    return InvoiceProductData(
      id: data.id.present ? data.id.value : this.id,
      invoice: data.invoice.present ? data.invoice.value : this.invoice,
      product: data.product.present ? data.product.value : this.product,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      currencyIsoCode: data.currencyIsoCode.present
          ? data.currencyIsoCode.value
          : this.currencyIsoCode,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceProductData(')
          ..write('id: $id, ')
          ..write('invoice: $invoice, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('currencyIsoCode: $currencyIsoCode, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    invoice,
    product,
    quantity,
    unitPrice,
    currencyIsoCode,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvoiceProductData &&
          other.id == this.id &&
          other.invoice == this.invoice &&
          other.product == this.product &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.currencyIsoCode == this.currencyIsoCode &&
          other.createdAt == this.createdAt);
}

class InvoiceProductCompanion extends UpdateCompanion<InvoiceProductData> {
  final Value<int> id;
  final Value<int> invoice;
  final Value<int> product;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<String> currencyIsoCode;
  final Value<DateTime> createdAt;
  const InvoiceProductCompanion({
    this.id = const Value.absent(),
    this.invoice = const Value.absent(),
    this.product = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.currencyIsoCode = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  InvoiceProductCompanion.insert({
    this.id = const Value.absent(),
    required int invoice,
    required int product,
    required int quantity,
    required int unitPrice,
    required String currencyIsoCode,
    required DateTime createdAt,
  }) : invoice = Value(invoice),
       product = Value(product),
       quantity = Value(quantity),
       unitPrice = Value(unitPrice),
       currencyIsoCode = Value(currencyIsoCode),
       createdAt = Value(createdAt);
  static Insertable<InvoiceProductData> custom({
    Expression<int>? id,
    Expression<int>? invoice,
    Expression<int>? product,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<String>? currencyIsoCode,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (invoice != null) 'invoice': invoice,
      if (product != null) 'product': product,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (currencyIsoCode != null) 'currency_iso_code': currencyIsoCode,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  InvoiceProductCompanion copyWith({
    Value<int>? id,
    Value<int>? invoice,
    Value<int>? product,
    Value<int>? quantity,
    Value<int>? unitPrice,
    Value<String>? currencyIsoCode,
    Value<DateTime>? createdAt,
  }) {
    return InvoiceProductCompanion(
      id: id ?? this.id,
      invoice: invoice ?? this.invoice,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      currencyIsoCode: currencyIsoCode ?? this.currencyIsoCode,
      createdAt: createdAt ?? this.createdAt,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvoiceProductCompanion(')
          ..write('id: $id, ')
          ..write('invoice: $invoice, ')
          ..write('product: $product, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('currencyIsoCode: $currencyIsoCode, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class DatabaseAtV3 extends GeneratedDatabase {
  DatabaseAtV3(QueryExecutor e) : super(e);
  late final Product product = Product(this);
  late final City city = City(this);
  late final Customer customer = Customer(this);
  late final Invoice invoice = Invoice(this);
  late final InvoiceProduct invoiceProduct = InvoiceProduct(this);
  late final Index idxUniqueNameNotPendingForDeletion = Index(
    'idx_unique_name_not_pending_for_deletion',
    'CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_name_not_pending_for_deletion ON product (name) WHERE pending_delete_until IS NULL',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    product,
    city,
    customer,
    invoice,
    invoiceProduct,
    idxUniqueNameNotPendingForDeletion,
  ];
  @override
  int get schemaVersion => 3;
}
