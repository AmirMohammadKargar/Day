// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps
class TabelUser extends DataClass implements Insertable<TabelUser> {
  final int id;
  final String email;
  final String name;
  final String lastName;
  final String password;
  TabelUser(
      {@required this.id,
      @required this.email,
      @required this.name,
      @required this.lastName,
      @required this.password});
  factory TabelUser.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return TabelUser(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      email:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}email']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      lastName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name']),
      password: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
    );
  }
  factory TabelUser.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return TabelUser(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      name: serializer.fromJson<String>(json['name']),
      lastName: serializer.fromJson<String>(json['lastName']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson(
      {ValueSerializer serializer = const ValueSerializer.defaults()}) {
    return {
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'name': serializer.toJson<String>(name),
      'lastName': serializer.toJson<String>(lastName),
      'password': serializer.toJson<String>(password),
    };
  }

  @override
  T createCompanion<T extends UpdateCompanion<TabelUser>>(bool nullToAbsent) {
    return TabelUsersCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      lastName: lastName == null && nullToAbsent
          ? const Value.absent()
          : Value(lastName),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
    ) as T;
  }

  TabelUser copyWith(
          {int id,
          String email,
          String name,
          String lastName,
          String password}) =>
      TabelUser(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return (StringBuffer('TabelUser(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('name: $name, ')
          ..write('lastName: $lastName, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(email.hashCode,
          $mrjc(name.hashCode, $mrjc(lastName.hashCode, password.hashCode)))));
  @override
  bool operator ==(other) =>
      identical(this, other) ||
      (other is TabelUser &&
          other.id == id &&
          other.email == email &&
          other.name == name &&
          other.lastName == lastName &&
          other.password == password);
}

class TabelUsersCompanion extends UpdateCompanion<TabelUser> {
  final Value<int> id;
  final Value<String> email;
  final Value<String> name;
  final Value<String> lastName;
  final Value<String> password;
  const TabelUsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.name = const Value.absent(),
    this.lastName = const Value.absent(),
    this.password = const Value.absent(),
  });
  TabelUsersCompanion copyWith(
      {Value<int> id,
      Value<String> email,
      Value<String> name,
      Value<String> lastName,
      Value<String> password}) {
    return TabelUsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      password: password ?? this.password,
    );
  }
}

class $TabelUsersTable extends TabelUsers
    with TableInfo<$TabelUsersTable, TabelUser> {
  final GeneratedDatabase _db;
  final String _alias;
  $TabelUsersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _emailMeta = const VerificationMeta('email');
  GeneratedTextColumn _email;
  @override
  GeneratedTextColumn get email => _email ??= _constructEmail();
  GeneratedTextColumn _constructEmail() {
    return GeneratedTextColumn('email', $tableName, false,
        minTextLength: 35, maxTextLength: 50);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        minTextLength: 35, maxTextLength: 50);
  }

  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  GeneratedTextColumn _lastName;
  @override
  GeneratedTextColumn get lastName => _lastName ??= _constructLastName();
  GeneratedTextColumn _constructLastName() {
    return GeneratedTextColumn('last_name', $tableName, false,
        minTextLength: 35, maxTextLength: 50);
  }

  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  GeneratedTextColumn _password;
  @override
  GeneratedTextColumn get password => _password ??= _constructPassword();
  GeneratedTextColumn _constructPassword() {
    return GeneratedTextColumn('password', $tableName, false,
        minTextLength: 8, maxTextLength: 50);
  }

  @override
  List<GeneratedColumn> get $columns => [id, email, name, lastName, password];
  @override
  $TabelUsersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tabel_users';
  @override
  final String actualTableName = 'tabel_users';
  @override
  VerificationContext validateIntegrity(TabelUsersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    } else if (id.isRequired && isInserting) {
      context.missing(_idMeta);
    }
    if (d.email.present) {
      context.handle(
          _emailMeta, email.isAcceptableValue(d.email.value, _emailMeta));
    } else if (email.isRequired && isInserting) {
      context.missing(_emailMeta);
    }
    if (d.name.present) {
      context.handle(
          _nameMeta, name.isAcceptableValue(d.name.value, _nameMeta));
    } else if (name.isRequired && isInserting) {
      context.missing(_nameMeta);
    }
    if (d.lastName.present) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableValue(d.lastName.value, _lastNameMeta));
    } else if (lastName.isRequired && isInserting) {
      context.missing(_lastNameMeta);
    }
    if (d.password.present) {
      context.handle(_passwordMeta,
          password.isAcceptableValue(d.password.value, _passwordMeta));
    } else if (password.isRequired && isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TabelUser map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return TabelUser.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(TabelUsersCompanion d) {
    final map = <String, Variable>{};
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.email.present) {
      map['email'] = Variable<String, StringType>(d.email.value);
    }
    if (d.name.present) {
      map['name'] = Variable<String, StringType>(d.name.value);
    }
    if (d.lastName.present) {
      map['last_name'] = Variable<String, StringType>(d.lastName.value);
    }
    if (d.password.present) {
      map['password'] = Variable<String, StringType>(d.password.value);
    }
    return map;
  }

  @override
  $TabelUsersTable createAlias(String alias) {
    return $TabelUsersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(const SqlTypeSystem.withDefaults(), e);
  $TabelUsersTable _tabelUsers;
  $TabelUsersTable get tabelUsers => _tabelUsers ??= $TabelUsersTable(this);
  @override
  List<TableInfo> get allTables => [tabelUsers];
}
