// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuarios.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Usuario extends DataClass implements Insertable<Usuario> {
  final int idUsuario;
  final int codigo;
  final String nombres;
  final String apellidos;
  final String documento;
  final String celular;
  final String? password;
  final String isAdmin;
  final bool activarYapa;
  final String estado;
  final DateTime fechaCreacion;
  final DateTime fechaIngreso;
  final DateTime? actualizado;
  Usuario(
      {required this.idUsuario,
      required this.codigo,
      required this.nombres,
      required this.apellidos,
      required this.documento,
      required this.celular,
      this.password,
      required this.isAdmin,
      required this.activarYapa,
      required this.estado,
      required this.fechaCreacion,
      required this.fechaIngreso,
      this.actualizado});
  factory Usuario.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Usuario(
      idUsuario: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_usuario'])!,
      codigo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}codigo'])!,
      nombres: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombres'])!,
      apellidos: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}apellidos'])!,
      documento: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}documento'])!,
      celular: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}celular'])!,
      password: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}password']),
      isAdmin: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_admin'])!,
      activarYapa: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}activar_yapa'])!,
      estado: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      fechaCreacion: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_creacion'])!,
      fechaIngreso: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_ingreso'])!,
      actualizado: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}actualizado']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_usuario'] = Variable<int>(idUsuario);
    map['codigo'] = Variable<int>(codigo);
    map['nombres'] = Variable<String>(nombres);
    map['apellidos'] = Variable<String>(apellidos);
    map['documento'] = Variable<String>(documento);
    map['celular'] = Variable<String>(celular);
    if (!nullToAbsent || password != null) {
      map['password'] = Variable<String?>(password);
    }
    map['is_admin'] = Variable<String>(isAdmin);
    map['activar_yapa'] = Variable<bool>(activarYapa);
    map['estado'] = Variable<String>(estado);
    map['fecha_creacion'] = Variable<DateTime>(fechaCreacion);
    map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    if (!nullToAbsent || actualizado != null) {
      map['actualizado'] = Variable<DateTime?>(actualizado);
    }
    return map;
  }

  UsuariosCompanion toCompanion(bool nullToAbsent) {
    return UsuariosCompanion(
      idUsuario: Value(idUsuario),
      codigo: Value(codigo),
      nombres: Value(nombres),
      apellidos: Value(apellidos),
      documento: Value(documento),
      celular: Value(celular),
      password: password == null && nullToAbsent
          ? const Value.absent()
          : Value(password),
      isAdmin: Value(isAdmin),
      activarYapa: Value(activarYapa),
      estado: Value(estado),
      fechaCreacion: Value(fechaCreacion),
      fechaIngreso: Value(fechaIngreso),
      actualizado: actualizado == null && nullToAbsent
          ? const Value.absent()
          : Value(actualizado),
    );
  }

  factory Usuario.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Usuario(
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      codigo: serializer.fromJson<int>(json['codigo']),
      nombres: serializer.fromJson<String>(json['nombres']),
      apellidos: serializer.fromJson<String>(json['apellidos']),
      documento: serializer.fromJson<String>(json['documento']),
      celular: serializer.fromJson<String>(json['celular']),
      password: serializer.fromJson<String?>(json['password']),
      isAdmin: serializer.fromJson<String>(json['isAdmin']),
      activarYapa: serializer.fromJson<bool>(json['activarYapa']),
      estado: serializer.fromJson<String>(json['estado']),
      fechaCreacion: serializer.fromJson<DateTime>(json['fechaCreacion']),
      fechaIngreso: serializer.fromJson<DateTime>(json['fechaIngreso']),
      actualizado: serializer.fromJson<DateTime?>(json['actualizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idUsuario': serializer.toJson<int>(idUsuario),
      'codigo': serializer.toJson<int>(codigo),
      'nombres': serializer.toJson<String>(nombres),
      'apellidos': serializer.toJson<String>(apellidos),
      'documento': serializer.toJson<String>(documento),
      'celular': serializer.toJson<String>(celular),
      'password': serializer.toJson<String?>(password),
      'isAdmin': serializer.toJson<String>(isAdmin),
      'activarYapa': serializer.toJson<bool>(activarYapa),
      'estado': serializer.toJson<String>(estado),
      'fechaCreacion': serializer.toJson<DateTime>(fechaCreacion),
      'fechaIngreso': serializer.toJson<DateTime>(fechaIngreso),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }

  Usuario copyWith(
          {int? idUsuario,
          int? codigo,
          String? nombres,
          String? apellidos,
          String? documento,
          String? celular,
          String? password,
          String? isAdmin,
          bool? activarYapa,
          String? estado,
          DateTime? fechaCreacion,
          DateTime? fechaIngreso,
          DateTime? actualizado}) =>
      Usuario(
        idUsuario: idUsuario ?? this.idUsuario,
        codigo: codigo ?? this.codigo,
        nombres: nombres ?? this.nombres,
        apellidos: apellidos ?? this.apellidos,
        documento: documento ?? this.documento,
        celular: celular ?? this.celular,
        password: password ?? this.password,
        isAdmin: isAdmin ?? this.isAdmin,
        activarYapa: activarYapa ?? this.activarYapa,
        estado: estado ?? this.estado,
        fechaCreacion: fechaCreacion ?? this.fechaCreacion,
        fechaIngreso: fechaIngreso ?? this.fechaIngreso,
        actualizado: actualizado ?? this.actualizado,
      );
  @override
  String toString() {
    return (StringBuffer('Usuario(')
          ..write('idUsuario: $idUsuario, ')
          ..write('codigo: $codigo, ')
          ..write('nombres: $nombres, ')
          ..write('apellidos: $apellidos, ')
          ..write('documento: $documento, ')
          ..write('celular: $celular, ')
          ..write('password: $password, ')
          ..write('isAdmin: $isAdmin, ')
          ..write('activarYapa: $activarYapa, ')
          ..write('estado: $estado, ')
          ..write('fechaCreacion: $fechaCreacion, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('actualizado: $actualizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idUsuario,
      codigo,
      nombres,
      apellidos,
      documento,
      celular,
      password,
      isAdmin,
      activarYapa,
      estado,
      fechaCreacion,
      fechaIngreso,
      actualizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Usuario &&
          other.idUsuario == this.idUsuario &&
          other.codigo == this.codigo &&
          other.nombres == this.nombres &&
          other.apellidos == this.apellidos &&
          other.documento == this.documento &&
          other.celular == this.celular &&
          other.password == this.password &&
          other.isAdmin == this.isAdmin &&
          other.activarYapa == this.activarYapa &&
          other.estado == this.estado &&
          other.fechaCreacion == this.fechaCreacion &&
          other.fechaIngreso == this.fechaIngreso &&
          other.actualizado == this.actualizado);
}

class UsuariosCompanion extends UpdateCompanion<Usuario> {
  final Value<int> idUsuario;
  final Value<int> codigo;
  final Value<String> nombres;
  final Value<String> apellidos;
  final Value<String> documento;
  final Value<String> celular;
  final Value<String?> password;
  final Value<String> isAdmin;
  final Value<bool> activarYapa;
  final Value<String> estado;
  final Value<DateTime> fechaCreacion;
  final Value<DateTime> fechaIngreso;
  final Value<DateTime?> actualizado;
  const UsuariosCompanion({
    this.idUsuario = const Value.absent(),
    this.codigo = const Value.absent(),
    this.nombres = const Value.absent(),
    this.apellidos = const Value.absent(),
    this.documento = const Value.absent(),
    this.celular = const Value.absent(),
    this.password = const Value.absent(),
    this.isAdmin = const Value.absent(),
    this.activarYapa = const Value.absent(),
    this.estado = const Value.absent(),
    this.fechaCreacion = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
    this.actualizado = const Value.absent(),
  });
  UsuariosCompanion.insert({
    this.idUsuario = const Value.absent(),
    required int codigo,
    required String nombres,
    required String apellidos,
    required String documento,
    required String celular,
    this.password = const Value.absent(),
    required String isAdmin,
    this.activarYapa = const Value.absent(),
    required String estado,
    required DateTime fechaCreacion,
    this.fechaIngreso = const Value.absent(),
    this.actualizado = const Value.absent(),
  })  : codigo = Value(codigo),
        nombres = Value(nombres),
        apellidos = Value(apellidos),
        documento = Value(documento),
        celular = Value(celular),
        isAdmin = Value(isAdmin),
        estado = Value(estado),
        fechaCreacion = Value(fechaCreacion);
  static Insertable<Usuario> custom({
    Expression<int>? idUsuario,
    Expression<int>? codigo,
    Expression<String>? nombres,
    Expression<String>? apellidos,
    Expression<String>? documento,
    Expression<String>? celular,
    Expression<String?>? password,
    Expression<String>? isAdmin,
    Expression<bool>? activarYapa,
    Expression<String>? estado,
    Expression<DateTime>? fechaCreacion,
    Expression<DateTime>? fechaIngreso,
    Expression<DateTime?>? actualizado,
  }) {
    return RawValuesInsertable({
      if (idUsuario != null) 'id_usuario': idUsuario,
      if (codigo != null) 'codigo': codigo,
      if (nombres != null) 'nombres': nombres,
      if (apellidos != null) 'apellidos': apellidos,
      if (documento != null) 'documento': documento,
      if (celular != null) 'celular': celular,
      if (password != null) 'password': password,
      if (isAdmin != null) 'is_admin': isAdmin,
      if (activarYapa != null) 'activar_yapa': activarYapa,
      if (estado != null) 'estado': estado,
      if (fechaCreacion != null) 'fecha_creacion': fechaCreacion,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
      if (actualizado != null) 'actualizado': actualizado,
    });
  }

  UsuariosCompanion copyWith(
      {Value<int>? idUsuario,
      Value<int>? codigo,
      Value<String>? nombres,
      Value<String>? apellidos,
      Value<String>? documento,
      Value<String>? celular,
      Value<String?>? password,
      Value<String>? isAdmin,
      Value<bool>? activarYapa,
      Value<String>? estado,
      Value<DateTime>? fechaCreacion,
      Value<DateTime>? fechaIngreso,
      Value<DateTime?>? actualizado}) {
    return UsuariosCompanion(
      idUsuario: idUsuario ?? this.idUsuario,
      codigo: codigo ?? this.codigo,
      nombres: nombres ?? this.nombres,
      apellidos: apellidos ?? this.apellidos,
      documento: documento ?? this.documento,
      celular: celular ?? this.celular,
      password: password ?? this.password,
      isAdmin: isAdmin ?? this.isAdmin,
      activarYapa: activarYapa ?? this.activarYapa,
      estado: estado ?? this.estado,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
      actualizado: actualizado ?? this.actualizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idUsuario.present) {
      map['id_usuario'] = Variable<int>(idUsuario.value);
    }
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (nombres.present) {
      map['nombres'] = Variable<String>(nombres.value);
    }
    if (apellidos.present) {
      map['apellidos'] = Variable<String>(apellidos.value);
    }
    if (documento.present) {
      map['documento'] = Variable<String>(documento.value);
    }
    if (celular.present) {
      map['celular'] = Variable<String>(celular.value);
    }
    if (password.present) {
      map['password'] = Variable<String?>(password.value);
    }
    if (isAdmin.present) {
      map['is_admin'] = Variable<String>(isAdmin.value);
    }
    if (activarYapa.present) {
      map['activar_yapa'] = Variable<bool>(activarYapa.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (fechaCreacion.present) {
      map['fecha_creacion'] = Variable<DateTime>(fechaCreacion.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    if (actualizado.present) {
      map['actualizado'] = Variable<DateTime?>(actualizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsuariosCompanion(')
          ..write('idUsuario: $idUsuario, ')
          ..write('codigo: $codigo, ')
          ..write('nombres: $nombres, ')
          ..write('apellidos: $apellidos, ')
          ..write('documento: $documento, ')
          ..write('celular: $celular, ')
          ..write('password: $password, ')
          ..write('isAdmin: $isAdmin, ')
          ..write('activarYapa: $activarYapa, ')
          ..write('estado: $estado, ')
          ..write('fechaCreacion: $fechaCreacion, ')
          ..write('fechaIngreso: $fechaIngreso, ')
          ..write('actualizado: $actualizado')
          ..write(')'))
        .toString();
  }
}

class $UsuariosTable extends Usuarios with TableInfo<$UsuariosTable, Usuario> {
  final GeneratedDatabase _db;
  final String? _alias;
  $UsuariosTable(this._db, [this._alias]);
  final VerificationMeta _idUsuarioMeta = const VerificationMeta('idUsuario');
  late final GeneratedColumn<int?> idUsuario = GeneratedColumn<int?>(
      'id_usuario', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  late final GeneratedColumn<int?> codigo = GeneratedColumn<int?>(
      'codigo', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nombresMeta = const VerificationMeta('nombres');
  late final GeneratedColumn<String?> nombres = GeneratedColumn<String?>(
      'nombres', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _apellidosMeta = const VerificationMeta('apellidos');
  late final GeneratedColumn<String?> apellidos = GeneratedColumn<String?>(
      'apellidos', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _documentoMeta = const VerificationMeta('documento');
  late final GeneratedColumn<String?> documento = GeneratedColumn<String?>(
      'documento', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _celularMeta = const VerificationMeta('celular');
  late final GeneratedColumn<String?> celular = GeneratedColumn<String?>(
      'celular', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _passwordMeta = const VerificationMeta('password');
  late final GeneratedColumn<String?> password = GeneratedColumn<String?>(
      'password', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isAdminMeta = const VerificationMeta('isAdmin');
  late final GeneratedColumn<String?> isAdmin = GeneratedColumn<String?>(
      'is_admin', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _activarYapaMeta =
      const VerificationMeta('activarYapa');
  late final GeneratedColumn<bool?> activarYapa = GeneratedColumn<bool?>(
      'activar_yapa', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (activar_yapa IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  late final GeneratedColumn<String?> estado = GeneratedColumn<String?>(
      'estado', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fechaCreacionMeta =
      const VerificationMeta('fechaCreacion');
  late final GeneratedColumn<DateTime?> fechaCreacion =
      GeneratedColumn<DateTime?>('fecha_creacion', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  late final GeneratedColumn<DateTime?> fechaIngreso =
      GeneratedColumn<DateTime?>('fecha_ingreso', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultValue: currentDate);
  final VerificationMeta _actualizadoMeta =
      const VerificationMeta('actualizado');
  late final GeneratedColumn<DateTime?> actualizado =
      GeneratedColumn<DateTime?>('actualizado', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idUsuario,
        codigo,
        nombres,
        apellidos,
        documento,
        celular,
        password,
        isAdmin,
        activarYapa,
        estado,
        fechaCreacion,
        fechaIngreso,
        actualizado
      ];
  @override
  String get aliasedName => _alias ?? 'usuarios';
  @override
  String get actualTableName => 'usuarios';
  @override
  VerificationContext validateIntegrity(Insertable<Usuario> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_usuario')) {
      context.handle(_idUsuarioMeta,
          idUsuario.isAcceptableOrUnknown(data['id_usuario']!, _idUsuarioMeta));
    }
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    } else if (isInserting) {
      context.missing(_codigoMeta);
    }
    if (data.containsKey('nombres')) {
      context.handle(_nombresMeta,
          nombres.isAcceptableOrUnknown(data['nombres']!, _nombresMeta));
    } else if (isInserting) {
      context.missing(_nombresMeta);
    }
    if (data.containsKey('apellidos')) {
      context.handle(_apellidosMeta,
          apellidos.isAcceptableOrUnknown(data['apellidos']!, _apellidosMeta));
    } else if (isInserting) {
      context.missing(_apellidosMeta);
    }
    if (data.containsKey('documento')) {
      context.handle(_documentoMeta,
          documento.isAcceptableOrUnknown(data['documento']!, _documentoMeta));
    } else if (isInserting) {
      context.missing(_documentoMeta);
    }
    if (data.containsKey('celular')) {
      context.handle(_celularMeta,
          celular.isAcceptableOrUnknown(data['celular']!, _celularMeta));
    } else if (isInserting) {
      context.missing(_celularMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    }
    if (data.containsKey('is_admin')) {
      context.handle(_isAdminMeta,
          isAdmin.isAcceptableOrUnknown(data['is_admin']!, _isAdminMeta));
    } else if (isInserting) {
      context.missing(_isAdminMeta);
    }
    if (data.containsKey('activar_yapa')) {
      context.handle(
          _activarYapaMeta,
          activarYapa.isAcceptableOrUnknown(
              data['activar_yapa']!, _activarYapaMeta));
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    if (data.containsKey('fecha_creacion')) {
      context.handle(
          _fechaCreacionMeta,
          fechaCreacion.isAcceptableOrUnknown(
              data['fecha_creacion']!, _fechaCreacionMeta));
    } else if (isInserting) {
      context.missing(_fechaCreacionMeta);
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    }
    if (data.containsKey('actualizado')) {
      context.handle(
          _actualizadoMeta,
          actualizado.isAcceptableOrUnknown(
              data['actualizado']!, _actualizadoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idUsuario};
  @override
  Usuario map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Usuario.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UsuariosTable createAlias(String alias) {
    return $UsuariosTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsuariosTable usuarios = $UsuariosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [usuarios];
}
