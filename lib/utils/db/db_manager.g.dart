// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_manager.dart';

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

class Juego extends DataClass implements Insertable<Juego> {
  final int idProgramacionJuego;
  final int? idJuego;
  final String tipoJuego;
  final DateTime fechaProgramada;
  final int moduloCartones;
  final String moneda;
  final double valorCarton;
  final int totalCartones;
  final double valorModulo;
  final int totalModulos;
  final double totalPremios;
  final String serie;
  final int cartonInicial;
  final int cartonFinal;
  final int hojaInicial;
  final int hojaFinal;
  final DateTime horaCierre;
  final int previoCierre;
  final String permitirDevolucion;
  final String estado;
  final DateTime? actualizado;
  Juego(
      {required this.idProgramacionJuego,
      this.idJuego,
      required this.tipoJuego,
      required this.fechaProgramada,
      required this.moduloCartones,
      required this.moneda,
      required this.valorCarton,
      required this.totalCartones,
      required this.valorModulo,
      required this.totalModulos,
      required this.totalPremios,
      required this.serie,
      required this.cartonInicial,
      required this.cartonFinal,
      required this.hojaInicial,
      required this.hojaFinal,
      required this.horaCierre,
      required this.previoCierre,
      required this.permitirDevolucion,
      required this.estado,
      this.actualizado});
  factory Juego.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Juego(
      idProgramacionJuego: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_programacion_juego'])!,
      idJuego: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_juego']),
      tipoJuego: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tipo_juego'])!,
      fechaProgramada: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_programada'])!,
      moduloCartones: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}modulo_cartones'])!,
      moneda: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}moneda'])!,
      valorCarton: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor_carton'])!,
      totalCartones: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_cartones'])!,
      valorModulo: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor_modulo'])!,
      totalModulos: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_modulos'])!,
      totalPremios: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_premios'])!,
      serie: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serie'])!,
      cartonInicial: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carton_inicial'])!,
      cartonFinal: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carton_final'])!,
      hojaInicial: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hoja_inicial'])!,
      hojaFinal: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hoja_final'])!,
      horaCierre: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}hora_cierre'])!,
      previoCierre: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}previo_cierre'])!,
      permitirDevolucion: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}permitir_devolucion'])!,
      estado: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      actualizado: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}actualizado']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_programacion_juego'] = Variable<int>(idProgramacionJuego);
    if (!nullToAbsent || idJuego != null) {
      map['id_juego'] = Variable<int?>(idJuego);
    }
    map['tipo_juego'] = Variable<String>(tipoJuego);
    map['fecha_programada'] = Variable<DateTime>(fechaProgramada);
    map['modulo_cartones'] = Variable<int>(moduloCartones);
    map['moneda'] = Variable<String>(moneda);
    map['valor_carton'] = Variable<double>(valorCarton);
    map['total_cartones'] = Variable<int>(totalCartones);
    map['valor_modulo'] = Variable<double>(valorModulo);
    map['total_modulos'] = Variable<int>(totalModulos);
    map['total_premios'] = Variable<double>(totalPremios);
    map['serie'] = Variable<String>(serie);
    map['carton_inicial'] = Variable<int>(cartonInicial);
    map['carton_final'] = Variable<int>(cartonFinal);
    map['hoja_inicial'] = Variable<int>(hojaInicial);
    map['hoja_final'] = Variable<int>(hojaFinal);
    map['hora_cierre'] = Variable<DateTime>(horaCierre);
    map['previo_cierre'] = Variable<int>(previoCierre);
    map['permitir_devolucion'] = Variable<String>(permitirDevolucion);
    map['estado'] = Variable<String>(estado);
    if (!nullToAbsent || actualizado != null) {
      map['actualizado'] = Variable<DateTime?>(actualizado);
    }
    return map;
  }

  JuegosCompanion toCompanion(bool nullToAbsent) {
    return JuegosCompanion(
      idProgramacionJuego: Value(idProgramacionJuego),
      idJuego: idJuego == null && nullToAbsent
          ? const Value.absent()
          : Value(idJuego),
      tipoJuego: Value(tipoJuego),
      fechaProgramada: Value(fechaProgramada),
      moduloCartones: Value(moduloCartones),
      moneda: Value(moneda),
      valorCarton: Value(valorCarton),
      totalCartones: Value(totalCartones),
      valorModulo: Value(valorModulo),
      totalModulos: Value(totalModulos),
      totalPremios: Value(totalPremios),
      serie: Value(serie),
      cartonInicial: Value(cartonInicial),
      cartonFinal: Value(cartonFinal),
      hojaInicial: Value(hojaInicial),
      hojaFinal: Value(hojaFinal),
      horaCierre: Value(horaCierre),
      previoCierre: Value(previoCierre),
      permitirDevolucion: Value(permitirDevolucion),
      estado: Value(estado),
      actualizado: actualizado == null && nullToAbsent
          ? const Value.absent()
          : Value(actualizado),
    );
  }

  factory Juego.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Juego(
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idJuego: serializer.fromJson<int?>(json['idJuego']),
      tipoJuego: serializer.fromJson<String>(json['tipoJuego']),
      fechaProgramada: serializer.fromJson<DateTime>(json['fechaProgramada']),
      moduloCartones: serializer.fromJson<int>(json['moduloCartones']),
      moneda: serializer.fromJson<String>(json['moneda']),
      valorCarton: serializer.fromJson<double>(json['valorCarton']),
      totalCartones: serializer.fromJson<int>(json['totalCartones']),
      valorModulo: serializer.fromJson<double>(json['valorModulo']),
      totalModulos: serializer.fromJson<int>(json['totalModulos']),
      totalPremios: serializer.fromJson<double>(json['totalPremios']),
      serie: serializer.fromJson<String>(json['serie']),
      cartonInicial: serializer.fromJson<int>(json['cartonInicial']),
      cartonFinal: serializer.fromJson<int>(json['cartonFinal']),
      hojaInicial: serializer.fromJson<int>(json['hojaInicial']),
      hojaFinal: serializer.fromJson<int>(json['hojaFinal']),
      horaCierre: serializer.fromJson<DateTime>(json['horaCierre']),
      previoCierre: serializer.fromJson<int>(json['previoCierre']),
      permitirDevolucion:
          serializer.fromJson<String>(json['permitirDevolucion']),
      estado: serializer.fromJson<String>(json['estado']),
      actualizado: serializer.fromJson<DateTime?>(json['actualizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'idJuego': serializer.toJson<int?>(idJuego),
      'tipoJuego': serializer.toJson<String>(tipoJuego),
      'fechaProgramada': serializer.toJson<DateTime>(fechaProgramada),
      'moduloCartones': serializer.toJson<int>(moduloCartones),
      'moneda': serializer.toJson<String>(moneda),
      'valorCarton': serializer.toJson<double>(valorCarton),
      'totalCartones': serializer.toJson<int>(totalCartones),
      'valorModulo': serializer.toJson<double>(valorModulo),
      'totalModulos': serializer.toJson<int>(totalModulos),
      'totalPremios': serializer.toJson<double>(totalPremios),
      'serie': serializer.toJson<String>(serie),
      'cartonInicial': serializer.toJson<int>(cartonInicial),
      'cartonFinal': serializer.toJson<int>(cartonFinal),
      'hojaInicial': serializer.toJson<int>(hojaInicial),
      'hojaFinal': serializer.toJson<int>(hojaFinal),
      'horaCierre': serializer.toJson<DateTime>(horaCierre),
      'previoCierre': serializer.toJson<int>(previoCierre),
      'permitirDevolucion': serializer.toJson<String>(permitirDevolucion),
      'estado': serializer.toJson<String>(estado),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }

  Juego copyWith(
          {int? idProgramacionJuego,
          int? idJuego,
          String? tipoJuego,
          DateTime? fechaProgramada,
          int? moduloCartones,
          String? moneda,
          double? valorCarton,
          int? totalCartones,
          double? valorModulo,
          int? totalModulos,
          double? totalPremios,
          String? serie,
          int? cartonInicial,
          int? cartonFinal,
          int? hojaInicial,
          int? hojaFinal,
          DateTime? horaCierre,
          int? previoCierre,
          String? permitirDevolucion,
          String? estado,
          DateTime? actualizado}) =>
      Juego(
        idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
        idJuego: idJuego ?? this.idJuego,
        tipoJuego: tipoJuego ?? this.tipoJuego,
        fechaProgramada: fechaProgramada ?? this.fechaProgramada,
        moduloCartones: moduloCartones ?? this.moduloCartones,
        moneda: moneda ?? this.moneda,
        valorCarton: valorCarton ?? this.valorCarton,
        totalCartones: totalCartones ?? this.totalCartones,
        valorModulo: valorModulo ?? this.valorModulo,
        totalModulos: totalModulos ?? this.totalModulos,
        totalPremios: totalPremios ?? this.totalPremios,
        serie: serie ?? this.serie,
        cartonInicial: cartonInicial ?? this.cartonInicial,
        cartonFinal: cartonFinal ?? this.cartonFinal,
        hojaInicial: hojaInicial ?? this.hojaInicial,
        hojaFinal: hojaFinal ?? this.hojaFinal,
        horaCierre: horaCierre ?? this.horaCierre,
        previoCierre: previoCierre ?? this.previoCierre,
        permitirDevolucion: permitirDevolucion ?? this.permitirDevolucion,
        estado: estado ?? this.estado,
        actualizado: actualizado ?? this.actualizado,
      );
  @override
  String toString() {
    return (StringBuffer('Juego(')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('idJuego: $idJuego, ')
          ..write('tipoJuego: $tipoJuego, ')
          ..write('fechaProgramada: $fechaProgramada, ')
          ..write('moduloCartones: $moduloCartones, ')
          ..write('moneda: $moneda, ')
          ..write('valorCarton: $valorCarton, ')
          ..write('totalCartones: $totalCartones, ')
          ..write('valorModulo: $valorModulo, ')
          ..write('totalModulos: $totalModulos, ')
          ..write('totalPremios: $totalPremios, ')
          ..write('serie: $serie, ')
          ..write('cartonInicial: $cartonInicial, ')
          ..write('cartonFinal: $cartonFinal, ')
          ..write('hojaInicial: $hojaInicial, ')
          ..write('hojaFinal: $hojaFinal, ')
          ..write('horaCierre: $horaCierre, ')
          ..write('previoCierre: $previoCierre, ')
          ..write('permitirDevolucion: $permitirDevolucion, ')
          ..write('estado: $estado, ')
          ..write('actualizado: $actualizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        idProgramacionJuego,
        idJuego,
        tipoJuego,
        fechaProgramada,
        moduloCartones,
        moneda,
        valorCarton,
        totalCartones,
        valorModulo,
        totalModulos,
        totalPremios,
        serie,
        cartonInicial,
        cartonFinal,
        hojaInicial,
        hojaFinal,
        horaCierre,
        previoCierre,
        permitirDevolucion,
        estado,
        actualizado
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Juego &&
          other.idProgramacionJuego == this.idProgramacionJuego &&
          other.idJuego == this.idJuego &&
          other.tipoJuego == this.tipoJuego &&
          other.fechaProgramada == this.fechaProgramada &&
          other.moduloCartones == this.moduloCartones &&
          other.moneda == this.moneda &&
          other.valorCarton == this.valorCarton &&
          other.totalCartones == this.totalCartones &&
          other.valorModulo == this.valorModulo &&
          other.totalModulos == this.totalModulos &&
          other.totalPremios == this.totalPremios &&
          other.serie == this.serie &&
          other.cartonInicial == this.cartonInicial &&
          other.cartonFinal == this.cartonFinal &&
          other.hojaInicial == this.hojaInicial &&
          other.hojaFinal == this.hojaFinal &&
          other.horaCierre == this.horaCierre &&
          other.previoCierre == this.previoCierre &&
          other.permitirDevolucion == this.permitirDevolucion &&
          other.estado == this.estado &&
          other.actualizado == this.actualizado);
}

class JuegosCompanion extends UpdateCompanion<Juego> {
  final Value<int> idProgramacionJuego;
  final Value<int?> idJuego;
  final Value<String> tipoJuego;
  final Value<DateTime> fechaProgramada;
  final Value<int> moduloCartones;
  final Value<String> moneda;
  final Value<double> valorCarton;
  final Value<int> totalCartones;
  final Value<double> valorModulo;
  final Value<int> totalModulos;
  final Value<double> totalPremios;
  final Value<String> serie;
  final Value<int> cartonInicial;
  final Value<int> cartonFinal;
  final Value<int> hojaInicial;
  final Value<int> hojaFinal;
  final Value<DateTime> horaCierre;
  final Value<int> previoCierre;
  final Value<String> permitirDevolucion;
  final Value<String> estado;
  final Value<DateTime?> actualizado;
  const JuegosCompanion({
    this.idProgramacionJuego = const Value.absent(),
    this.idJuego = const Value.absent(),
    this.tipoJuego = const Value.absent(),
    this.fechaProgramada = const Value.absent(),
    this.moduloCartones = const Value.absent(),
    this.moneda = const Value.absent(),
    this.valorCarton = const Value.absent(),
    this.totalCartones = const Value.absent(),
    this.valorModulo = const Value.absent(),
    this.totalModulos = const Value.absent(),
    this.totalPremios = const Value.absent(),
    this.serie = const Value.absent(),
    this.cartonInicial = const Value.absent(),
    this.cartonFinal = const Value.absent(),
    this.hojaInicial = const Value.absent(),
    this.hojaFinal = const Value.absent(),
    this.horaCierre = const Value.absent(),
    this.previoCierre = const Value.absent(),
    this.permitirDevolucion = const Value.absent(),
    this.estado = const Value.absent(),
    this.actualizado = const Value.absent(),
  });
  JuegosCompanion.insert({
    this.idProgramacionJuego = const Value.absent(),
    this.idJuego = const Value.absent(),
    required String tipoJuego,
    required DateTime fechaProgramada,
    required int moduloCartones,
    required String moneda,
    required double valorCarton,
    required int totalCartones,
    required double valorModulo,
    required int totalModulos,
    required double totalPremios,
    required String serie,
    required int cartonInicial,
    required int cartonFinal,
    required int hojaInicial,
    required int hojaFinal,
    required DateTime horaCierre,
    required int previoCierre,
    required String permitirDevolucion,
    required String estado,
    this.actualizado = const Value.absent(),
  })  : tipoJuego = Value(tipoJuego),
        fechaProgramada = Value(fechaProgramada),
        moduloCartones = Value(moduloCartones),
        moneda = Value(moneda),
        valorCarton = Value(valorCarton),
        totalCartones = Value(totalCartones),
        valorModulo = Value(valorModulo),
        totalModulos = Value(totalModulos),
        totalPremios = Value(totalPremios),
        serie = Value(serie),
        cartonInicial = Value(cartonInicial),
        cartonFinal = Value(cartonFinal),
        hojaInicial = Value(hojaInicial),
        hojaFinal = Value(hojaFinal),
        horaCierre = Value(horaCierre),
        previoCierre = Value(previoCierre),
        permitirDevolucion = Value(permitirDevolucion),
        estado = Value(estado);
  static Insertable<Juego> custom({
    Expression<int>? idProgramacionJuego,
    Expression<int?>? idJuego,
    Expression<String>? tipoJuego,
    Expression<DateTime>? fechaProgramada,
    Expression<int>? moduloCartones,
    Expression<String>? moneda,
    Expression<double>? valorCarton,
    Expression<int>? totalCartones,
    Expression<double>? valorModulo,
    Expression<int>? totalModulos,
    Expression<double>? totalPremios,
    Expression<String>? serie,
    Expression<int>? cartonInicial,
    Expression<int>? cartonFinal,
    Expression<int>? hojaInicial,
    Expression<int>? hojaFinal,
    Expression<DateTime>? horaCierre,
    Expression<int>? previoCierre,
    Expression<String>? permitirDevolucion,
    Expression<String>? estado,
    Expression<DateTime?>? actualizado,
  }) {
    return RawValuesInsertable({
      if (idProgramacionJuego != null)
        'id_programacion_juego': idProgramacionJuego,
      if (idJuego != null) 'id_juego': idJuego,
      if (tipoJuego != null) 'tipo_juego': tipoJuego,
      if (fechaProgramada != null) 'fecha_programada': fechaProgramada,
      if (moduloCartones != null) 'modulo_cartones': moduloCartones,
      if (moneda != null) 'moneda': moneda,
      if (valorCarton != null) 'valor_carton': valorCarton,
      if (totalCartones != null) 'total_cartones': totalCartones,
      if (valorModulo != null) 'valor_modulo': valorModulo,
      if (totalModulos != null) 'total_modulos': totalModulos,
      if (totalPremios != null) 'total_premios': totalPremios,
      if (serie != null) 'serie': serie,
      if (cartonInicial != null) 'carton_inicial': cartonInicial,
      if (cartonFinal != null) 'carton_final': cartonFinal,
      if (hojaInicial != null) 'hoja_inicial': hojaInicial,
      if (hojaFinal != null) 'hoja_final': hojaFinal,
      if (horaCierre != null) 'hora_cierre': horaCierre,
      if (previoCierre != null) 'previo_cierre': previoCierre,
      if (permitirDevolucion != null) 'permitir_devolucion': permitirDevolucion,
      if (estado != null) 'estado': estado,
      if (actualizado != null) 'actualizado': actualizado,
    });
  }

  JuegosCompanion copyWith(
      {Value<int>? idProgramacionJuego,
      Value<int?>? idJuego,
      Value<String>? tipoJuego,
      Value<DateTime>? fechaProgramada,
      Value<int>? moduloCartones,
      Value<String>? moneda,
      Value<double>? valorCarton,
      Value<int>? totalCartones,
      Value<double>? valorModulo,
      Value<int>? totalModulos,
      Value<double>? totalPremios,
      Value<String>? serie,
      Value<int>? cartonInicial,
      Value<int>? cartonFinal,
      Value<int>? hojaInicial,
      Value<int>? hojaFinal,
      Value<DateTime>? horaCierre,
      Value<int>? previoCierre,
      Value<String>? permitirDevolucion,
      Value<String>? estado,
      Value<DateTime?>? actualizado}) {
    return JuegosCompanion(
      idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
      idJuego: idJuego ?? this.idJuego,
      tipoJuego: tipoJuego ?? this.tipoJuego,
      fechaProgramada: fechaProgramada ?? this.fechaProgramada,
      moduloCartones: moduloCartones ?? this.moduloCartones,
      moneda: moneda ?? this.moneda,
      valorCarton: valorCarton ?? this.valorCarton,
      totalCartones: totalCartones ?? this.totalCartones,
      valorModulo: valorModulo ?? this.valorModulo,
      totalModulos: totalModulos ?? this.totalModulos,
      totalPremios: totalPremios ?? this.totalPremios,
      serie: serie ?? this.serie,
      cartonInicial: cartonInicial ?? this.cartonInicial,
      cartonFinal: cartonFinal ?? this.cartonFinal,
      hojaInicial: hojaInicial ?? this.hojaInicial,
      hojaFinal: hojaFinal ?? this.hojaFinal,
      horaCierre: horaCierre ?? this.horaCierre,
      previoCierre: previoCierre ?? this.previoCierre,
      permitirDevolucion: permitirDevolucion ?? this.permitirDevolucion,
      estado: estado ?? this.estado,
      actualizado: actualizado ?? this.actualizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idProgramacionJuego.present) {
      map['id_programacion_juego'] = Variable<int>(idProgramacionJuego.value);
    }
    if (idJuego.present) {
      map['id_juego'] = Variable<int?>(idJuego.value);
    }
    if (tipoJuego.present) {
      map['tipo_juego'] = Variable<String>(tipoJuego.value);
    }
    if (fechaProgramada.present) {
      map['fecha_programada'] = Variable<DateTime>(fechaProgramada.value);
    }
    if (moduloCartones.present) {
      map['modulo_cartones'] = Variable<int>(moduloCartones.value);
    }
    if (moneda.present) {
      map['moneda'] = Variable<String>(moneda.value);
    }
    if (valorCarton.present) {
      map['valor_carton'] = Variable<double>(valorCarton.value);
    }
    if (totalCartones.present) {
      map['total_cartones'] = Variable<int>(totalCartones.value);
    }
    if (valorModulo.present) {
      map['valor_modulo'] = Variable<double>(valorModulo.value);
    }
    if (totalModulos.present) {
      map['total_modulos'] = Variable<int>(totalModulos.value);
    }
    if (totalPremios.present) {
      map['total_premios'] = Variable<double>(totalPremios.value);
    }
    if (serie.present) {
      map['serie'] = Variable<String>(serie.value);
    }
    if (cartonInicial.present) {
      map['carton_inicial'] = Variable<int>(cartonInicial.value);
    }
    if (cartonFinal.present) {
      map['carton_final'] = Variable<int>(cartonFinal.value);
    }
    if (hojaInicial.present) {
      map['hoja_inicial'] = Variable<int>(hojaInicial.value);
    }
    if (hojaFinal.present) {
      map['hoja_final'] = Variable<int>(hojaFinal.value);
    }
    if (horaCierre.present) {
      map['hora_cierre'] = Variable<DateTime>(horaCierre.value);
    }
    if (previoCierre.present) {
      map['previo_cierre'] = Variable<int>(previoCierre.value);
    }
    if (permitirDevolucion.present) {
      map['permitir_devolucion'] = Variable<String>(permitirDevolucion.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (actualizado.present) {
      map['actualizado'] = Variable<DateTime?>(actualizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JuegosCompanion(')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('idJuego: $idJuego, ')
          ..write('tipoJuego: $tipoJuego, ')
          ..write('fechaProgramada: $fechaProgramada, ')
          ..write('moduloCartones: $moduloCartones, ')
          ..write('moneda: $moneda, ')
          ..write('valorCarton: $valorCarton, ')
          ..write('totalCartones: $totalCartones, ')
          ..write('valorModulo: $valorModulo, ')
          ..write('totalModulos: $totalModulos, ')
          ..write('totalPremios: $totalPremios, ')
          ..write('serie: $serie, ')
          ..write('cartonInicial: $cartonInicial, ')
          ..write('cartonFinal: $cartonFinal, ')
          ..write('hojaInicial: $hojaInicial, ')
          ..write('hojaFinal: $hojaFinal, ')
          ..write('horaCierre: $horaCierre, ')
          ..write('previoCierre: $previoCierre, ')
          ..write('permitirDevolucion: $permitirDevolucion, ')
          ..write('estado: $estado, ')
          ..write('actualizado: $actualizado')
          ..write(')'))
        .toString();
  }
}

class $JuegosTable extends Juegos with TableInfo<$JuegosTable, Juego> {
  final GeneratedDatabase _db;
  final String? _alias;
  $JuegosTable(this._db, [this._alias]);
  final VerificationMeta _idProgramacionJuegoMeta =
      const VerificationMeta('idProgramacionJuego');
  late final GeneratedColumn<int?> idProgramacionJuego = GeneratedColumn<int?>(
      'id_programacion_juego', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idJuegoMeta = const VerificationMeta('idJuego');
  late final GeneratedColumn<int?> idJuego = GeneratedColumn<int?>(
      'id_juego', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _tipoJuegoMeta = const VerificationMeta('tipoJuego');
  late final GeneratedColumn<String?> tipoJuego = GeneratedColumn<String?>(
      'tipo_juego', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _fechaProgramadaMeta =
      const VerificationMeta('fechaProgramada');
  late final GeneratedColumn<DateTime?> fechaProgramada =
      GeneratedColumn<DateTime?>('fecha_programada', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _moduloCartonesMeta =
      const VerificationMeta('moduloCartones');
  late final GeneratedColumn<int?> moduloCartones = GeneratedColumn<int?>(
      'modulo_cartones', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _monedaMeta = const VerificationMeta('moneda');
  late final GeneratedColumn<String?> moneda = GeneratedColumn<String?>(
      'moneda', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _valorCartonMeta =
      const VerificationMeta('valorCarton');
  late final GeneratedColumn<double?> valorCarton = GeneratedColumn<double?>(
      'valor_carton', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _totalCartonesMeta =
      const VerificationMeta('totalCartones');
  late final GeneratedColumn<int?> totalCartones = GeneratedColumn<int?>(
      'total_cartones', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _valorModuloMeta =
      const VerificationMeta('valorModulo');
  late final GeneratedColumn<double?> valorModulo = GeneratedColumn<double?>(
      'valor_modulo', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _totalModulosMeta =
      const VerificationMeta('totalModulos');
  late final GeneratedColumn<int?> totalModulos = GeneratedColumn<int?>(
      'total_modulos', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _totalPremiosMeta =
      const VerificationMeta('totalPremios');
  late final GeneratedColumn<double?> totalPremios = GeneratedColumn<double?>(
      'total_premios', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _serieMeta = const VerificationMeta('serie');
  late final GeneratedColumn<String?> serie = GeneratedColumn<String?>(
      'serie', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _cartonInicialMeta =
      const VerificationMeta('cartonInicial');
  late final GeneratedColumn<int?> cartonInicial = GeneratedColumn<int?>(
      'carton_inicial', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _cartonFinalMeta =
      const VerificationMeta('cartonFinal');
  late final GeneratedColumn<int?> cartonFinal = GeneratedColumn<int?>(
      'carton_final', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _hojaInicialMeta =
      const VerificationMeta('hojaInicial');
  late final GeneratedColumn<int?> hojaInicial = GeneratedColumn<int?>(
      'hoja_inicial', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _hojaFinalMeta = const VerificationMeta('hojaFinal');
  late final GeneratedColumn<int?> hojaFinal = GeneratedColumn<int?>(
      'hoja_final', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _horaCierreMeta = const VerificationMeta('horaCierre');
  late final GeneratedColumn<DateTime?> horaCierre = GeneratedColumn<DateTime?>(
      'hora_cierre', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _previoCierreMeta =
      const VerificationMeta('previoCierre');
  late final GeneratedColumn<int?> previoCierre = GeneratedColumn<int?>(
      'previo_cierre', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _permitirDevolucionMeta =
      const VerificationMeta('permitirDevolucion');
  late final GeneratedColumn<String?> permitirDevolucion =
      GeneratedColumn<String?>('permitir_devolucion', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  late final GeneratedColumn<String?> estado = GeneratedColumn<String?>(
      'estado', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _actualizadoMeta =
      const VerificationMeta('actualizado');
  late final GeneratedColumn<DateTime?> actualizado =
      GeneratedColumn<DateTime?>('actualizado', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idProgramacionJuego,
        idJuego,
        tipoJuego,
        fechaProgramada,
        moduloCartones,
        moneda,
        valorCarton,
        totalCartones,
        valorModulo,
        totalModulos,
        totalPremios,
        serie,
        cartonInicial,
        cartonFinal,
        hojaInicial,
        hojaFinal,
        horaCierre,
        previoCierre,
        permitirDevolucion,
        estado,
        actualizado
      ];
  @override
  String get aliasedName => _alias ?? 'juegos';
  @override
  String get actualTableName => 'juegos';
  @override
  VerificationContext validateIntegrity(Insertable<Juego> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_programacion_juego')) {
      context.handle(
          _idProgramacionJuegoMeta,
          idProgramacionJuego.isAcceptableOrUnknown(
              data['id_programacion_juego']!, _idProgramacionJuegoMeta));
    }
    if (data.containsKey('id_juego')) {
      context.handle(_idJuegoMeta,
          idJuego.isAcceptableOrUnknown(data['id_juego']!, _idJuegoMeta));
    }
    if (data.containsKey('tipo_juego')) {
      context.handle(_tipoJuegoMeta,
          tipoJuego.isAcceptableOrUnknown(data['tipo_juego']!, _tipoJuegoMeta));
    } else if (isInserting) {
      context.missing(_tipoJuegoMeta);
    }
    if (data.containsKey('fecha_programada')) {
      context.handle(
          _fechaProgramadaMeta,
          fechaProgramada.isAcceptableOrUnknown(
              data['fecha_programada']!, _fechaProgramadaMeta));
    } else if (isInserting) {
      context.missing(_fechaProgramadaMeta);
    }
    if (data.containsKey('modulo_cartones')) {
      context.handle(
          _moduloCartonesMeta,
          moduloCartones.isAcceptableOrUnknown(
              data['modulo_cartones']!, _moduloCartonesMeta));
    } else if (isInserting) {
      context.missing(_moduloCartonesMeta);
    }
    if (data.containsKey('moneda')) {
      context.handle(_monedaMeta,
          moneda.isAcceptableOrUnknown(data['moneda']!, _monedaMeta));
    } else if (isInserting) {
      context.missing(_monedaMeta);
    }
    if (data.containsKey('valor_carton')) {
      context.handle(
          _valorCartonMeta,
          valorCarton.isAcceptableOrUnknown(
              data['valor_carton']!, _valorCartonMeta));
    } else if (isInserting) {
      context.missing(_valorCartonMeta);
    }
    if (data.containsKey('total_cartones')) {
      context.handle(
          _totalCartonesMeta,
          totalCartones.isAcceptableOrUnknown(
              data['total_cartones']!, _totalCartonesMeta));
    } else if (isInserting) {
      context.missing(_totalCartonesMeta);
    }
    if (data.containsKey('valor_modulo')) {
      context.handle(
          _valorModuloMeta,
          valorModulo.isAcceptableOrUnknown(
              data['valor_modulo']!, _valorModuloMeta));
    } else if (isInserting) {
      context.missing(_valorModuloMeta);
    }
    if (data.containsKey('total_modulos')) {
      context.handle(
          _totalModulosMeta,
          totalModulos.isAcceptableOrUnknown(
              data['total_modulos']!, _totalModulosMeta));
    } else if (isInserting) {
      context.missing(_totalModulosMeta);
    }
    if (data.containsKey('total_premios')) {
      context.handle(
          _totalPremiosMeta,
          totalPremios.isAcceptableOrUnknown(
              data['total_premios']!, _totalPremiosMeta));
    } else if (isInserting) {
      context.missing(_totalPremiosMeta);
    }
    if (data.containsKey('serie')) {
      context.handle(
          _serieMeta, serie.isAcceptableOrUnknown(data['serie']!, _serieMeta));
    } else if (isInserting) {
      context.missing(_serieMeta);
    }
    if (data.containsKey('carton_inicial')) {
      context.handle(
          _cartonInicialMeta,
          cartonInicial.isAcceptableOrUnknown(
              data['carton_inicial']!, _cartonInicialMeta));
    } else if (isInserting) {
      context.missing(_cartonInicialMeta);
    }
    if (data.containsKey('carton_final')) {
      context.handle(
          _cartonFinalMeta,
          cartonFinal.isAcceptableOrUnknown(
              data['carton_final']!, _cartonFinalMeta));
    } else if (isInserting) {
      context.missing(_cartonFinalMeta);
    }
    if (data.containsKey('hoja_inicial')) {
      context.handle(
          _hojaInicialMeta,
          hojaInicial.isAcceptableOrUnknown(
              data['hoja_inicial']!, _hojaInicialMeta));
    } else if (isInserting) {
      context.missing(_hojaInicialMeta);
    }
    if (data.containsKey('hoja_final')) {
      context.handle(_hojaFinalMeta,
          hojaFinal.isAcceptableOrUnknown(data['hoja_final']!, _hojaFinalMeta));
    } else if (isInserting) {
      context.missing(_hojaFinalMeta);
    }
    if (data.containsKey('hora_cierre')) {
      context.handle(
          _horaCierreMeta,
          horaCierre.isAcceptableOrUnknown(
              data['hora_cierre']!, _horaCierreMeta));
    } else if (isInserting) {
      context.missing(_horaCierreMeta);
    }
    if (data.containsKey('previo_cierre')) {
      context.handle(
          _previoCierreMeta,
          previoCierre.isAcceptableOrUnknown(
              data['previo_cierre']!, _previoCierreMeta));
    } else if (isInserting) {
      context.missing(_previoCierreMeta);
    }
    if (data.containsKey('permitir_devolucion')) {
      context.handle(
          _permitirDevolucionMeta,
          permitirDevolucion.isAcceptableOrUnknown(
              data['permitir_devolucion']!, _permitirDevolucionMeta));
    } else if (isInserting) {
      context.missing(_permitirDevolucionMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
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
  Set<GeneratedColumn> get $primaryKey => {idProgramacionJuego};
  @override
  Juego map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Juego.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $JuegosTable createAlias(String alias) {
    return $JuegosTable(_db, alias);
  }
}

class JuegoPromocion extends DataClass implements Insertable<JuegoPromocion> {
  final int idJuegoPromocion;
  final int idProgramacionJuego;
  final int idPromocion;
  final String nombrePromocion;
  final double? valorPromocion;
  final int nroCartones;
  final String? estado;
  final DateTime? actualizado;
  JuegoPromocion(
      {required this.idJuegoPromocion,
      required this.idProgramacionJuego,
      required this.idPromocion,
      required this.nombrePromocion,
      this.valorPromocion,
      required this.nroCartones,
      this.estado,
      this.actualizado});
  factory JuegoPromocion.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return JuegoPromocion(
      idJuegoPromocion: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_juego_promocion'])!,
      idProgramacionJuego: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_programacion_juego'])!,
      idPromocion: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_promocion'])!,
      nombrePromocion: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre_promocion'])!,
      valorPromocion: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor_promocion']),
      nroCartones: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nro_cartones'])!,
      estado: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado']),
      actualizado: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}actualizado']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_juego_promocion'] = Variable<int>(idJuegoPromocion);
    map['id_programacion_juego'] = Variable<int>(idProgramacionJuego);
    map['id_promocion'] = Variable<int>(idPromocion);
    map['nombre_promocion'] = Variable<String>(nombrePromocion);
    if (!nullToAbsent || valorPromocion != null) {
      map['valor_promocion'] = Variable<double?>(valorPromocion);
    }
    map['nro_cartones'] = Variable<int>(nroCartones);
    if (!nullToAbsent || estado != null) {
      map['estado'] = Variable<String?>(estado);
    }
    if (!nullToAbsent || actualizado != null) {
      map['actualizado'] = Variable<DateTime?>(actualizado);
    }
    return map;
  }

  JuegosPromocionesCompanion toCompanion(bool nullToAbsent) {
    return JuegosPromocionesCompanion(
      idJuegoPromocion: Value(idJuegoPromocion),
      idProgramacionJuego: Value(idProgramacionJuego),
      idPromocion: Value(idPromocion),
      nombrePromocion: Value(nombrePromocion),
      valorPromocion: valorPromocion == null && nullToAbsent
          ? const Value.absent()
          : Value(valorPromocion),
      nroCartones: Value(nroCartones),
      estado:
          estado == null && nullToAbsent ? const Value.absent() : Value(estado),
      actualizado: actualizado == null && nullToAbsent
          ? const Value.absent()
          : Value(actualizado),
    );
  }

  factory JuegoPromocion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JuegoPromocion(
      idJuegoPromocion: serializer.fromJson<int>(json['idJuegoPromocion']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idPromocion: serializer.fromJson<int>(json['idPromocion']),
      nombrePromocion: serializer.fromJson<String>(json['nombrePromocion']),
      valorPromocion: serializer.fromJson<double?>(json['valorPromocion']),
      nroCartones: serializer.fromJson<int>(json['nroCartones']),
      estado: serializer.fromJson<String?>(json['estado']),
      actualizado: serializer.fromJson<DateTime?>(json['actualizado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idJuegoPromocion': serializer.toJson<int>(idJuegoPromocion),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'idPromocion': serializer.toJson<int>(idPromocion),
      'nombrePromocion': serializer.toJson<String>(nombrePromocion),
      'valorPromocion': serializer.toJson<double?>(valorPromocion),
      'nroCartones': serializer.toJson<int>(nroCartones),
      'estado': serializer.toJson<String?>(estado),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
    };
  }

  JuegoPromocion copyWith(
          {int? idJuegoPromocion,
          int? idProgramacionJuego,
          int? idPromocion,
          String? nombrePromocion,
          double? valorPromocion,
          int? nroCartones,
          String? estado,
          DateTime? actualizado}) =>
      JuegoPromocion(
        idJuegoPromocion: idJuegoPromocion ?? this.idJuegoPromocion,
        idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
        idPromocion: idPromocion ?? this.idPromocion,
        nombrePromocion: nombrePromocion ?? this.nombrePromocion,
        valorPromocion: valorPromocion ?? this.valorPromocion,
        nroCartones: nroCartones ?? this.nroCartones,
        estado: estado ?? this.estado,
        actualizado: actualizado ?? this.actualizado,
      );
  @override
  String toString() {
    return (StringBuffer('JuegoPromocion(')
          ..write('idJuegoPromocion: $idJuegoPromocion, ')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('idPromocion: $idPromocion, ')
          ..write('nombrePromocion: $nombrePromocion, ')
          ..write('valorPromocion: $valorPromocion, ')
          ..write('nroCartones: $nroCartones, ')
          ..write('estado: $estado, ')
          ..write('actualizado: $actualizado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idJuegoPromocion,
      idProgramacionJuego,
      idPromocion,
      nombrePromocion,
      valorPromocion,
      nroCartones,
      estado,
      actualizado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JuegoPromocion &&
          other.idJuegoPromocion == this.idJuegoPromocion &&
          other.idProgramacionJuego == this.idProgramacionJuego &&
          other.idPromocion == this.idPromocion &&
          other.nombrePromocion == this.nombrePromocion &&
          other.valorPromocion == this.valorPromocion &&
          other.nroCartones == this.nroCartones &&
          other.estado == this.estado &&
          other.actualizado == this.actualizado);
}

class JuegosPromocionesCompanion extends UpdateCompanion<JuegoPromocion> {
  final Value<int> idJuegoPromocion;
  final Value<int> idProgramacionJuego;
  final Value<int> idPromocion;
  final Value<String> nombrePromocion;
  final Value<double?> valorPromocion;
  final Value<int> nroCartones;
  final Value<String?> estado;
  final Value<DateTime?> actualizado;
  const JuegosPromocionesCompanion({
    this.idJuegoPromocion = const Value.absent(),
    this.idProgramacionJuego = const Value.absent(),
    this.idPromocion = const Value.absent(),
    this.nombrePromocion = const Value.absent(),
    this.valorPromocion = const Value.absent(),
    this.nroCartones = const Value.absent(),
    this.estado = const Value.absent(),
    this.actualizado = const Value.absent(),
  });
  JuegosPromocionesCompanion.insert({
    this.idJuegoPromocion = const Value.absent(),
    required int idProgramacionJuego,
    required int idPromocion,
    required String nombrePromocion,
    this.valorPromocion = const Value.absent(),
    required int nroCartones,
    this.estado = const Value.absent(),
    this.actualizado = const Value.absent(),
  })  : idProgramacionJuego = Value(idProgramacionJuego),
        idPromocion = Value(idPromocion),
        nombrePromocion = Value(nombrePromocion),
        nroCartones = Value(nroCartones);
  static Insertable<JuegoPromocion> custom({
    Expression<int>? idJuegoPromocion,
    Expression<int>? idProgramacionJuego,
    Expression<int>? idPromocion,
    Expression<String>? nombrePromocion,
    Expression<double?>? valorPromocion,
    Expression<int>? nroCartones,
    Expression<String?>? estado,
    Expression<DateTime?>? actualizado,
  }) {
    return RawValuesInsertable({
      if (idJuegoPromocion != null) 'id_juego_promocion': idJuegoPromocion,
      if (idProgramacionJuego != null)
        'id_programacion_juego': idProgramacionJuego,
      if (idPromocion != null) 'id_promocion': idPromocion,
      if (nombrePromocion != null) 'nombre_promocion': nombrePromocion,
      if (valorPromocion != null) 'valor_promocion': valorPromocion,
      if (nroCartones != null) 'nro_cartones': nroCartones,
      if (estado != null) 'estado': estado,
      if (actualizado != null) 'actualizado': actualizado,
    });
  }

  JuegosPromocionesCompanion copyWith(
      {Value<int>? idJuegoPromocion,
      Value<int>? idProgramacionJuego,
      Value<int>? idPromocion,
      Value<String>? nombrePromocion,
      Value<double?>? valorPromocion,
      Value<int>? nroCartones,
      Value<String?>? estado,
      Value<DateTime?>? actualizado}) {
    return JuegosPromocionesCompanion(
      idJuegoPromocion: idJuegoPromocion ?? this.idJuegoPromocion,
      idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
      idPromocion: idPromocion ?? this.idPromocion,
      nombrePromocion: nombrePromocion ?? this.nombrePromocion,
      valorPromocion: valorPromocion ?? this.valorPromocion,
      nroCartones: nroCartones ?? this.nroCartones,
      estado: estado ?? this.estado,
      actualizado: actualizado ?? this.actualizado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idJuegoPromocion.present) {
      map['id_juego_promocion'] = Variable<int>(idJuegoPromocion.value);
    }
    if (idProgramacionJuego.present) {
      map['id_programacion_juego'] = Variable<int>(idProgramacionJuego.value);
    }
    if (idPromocion.present) {
      map['id_promocion'] = Variable<int>(idPromocion.value);
    }
    if (nombrePromocion.present) {
      map['nombre_promocion'] = Variable<String>(nombrePromocion.value);
    }
    if (valorPromocion.present) {
      map['valor_promocion'] = Variable<double?>(valorPromocion.value);
    }
    if (nroCartones.present) {
      map['nro_cartones'] = Variable<int>(nroCartones.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String?>(estado.value);
    }
    if (actualizado.present) {
      map['actualizado'] = Variable<DateTime?>(actualizado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JuegosPromocionesCompanion(')
          ..write('idJuegoPromocion: $idJuegoPromocion, ')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('idPromocion: $idPromocion, ')
          ..write('nombrePromocion: $nombrePromocion, ')
          ..write('valorPromocion: $valorPromocion, ')
          ..write('nroCartones: $nroCartones, ')
          ..write('estado: $estado, ')
          ..write('actualizado: $actualizado')
          ..write(')'))
        .toString();
  }
}

class $JuegosPromocionesTable extends JuegosPromociones
    with TableInfo<$JuegosPromocionesTable, JuegoPromocion> {
  final GeneratedDatabase _db;
  final String? _alias;
  $JuegosPromocionesTable(this._db, [this._alias]);
  final VerificationMeta _idJuegoPromocionMeta =
      const VerificationMeta('idJuegoPromocion');
  late final GeneratedColumn<int?> idJuegoPromocion = GeneratedColumn<int?>(
      'id_juego_promocion', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idProgramacionJuegoMeta =
      const VerificationMeta('idProgramacionJuego');
  late final GeneratedColumn<int?> idProgramacionJuego = GeneratedColumn<int?>(
      'id_programacion_juego', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _idPromocionMeta =
      const VerificationMeta('idPromocion');
  late final GeneratedColumn<int?> idPromocion = GeneratedColumn<int?>(
      'id_promocion', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nombrePromocionMeta =
      const VerificationMeta('nombrePromocion');
  late final GeneratedColumn<String?> nombrePromocion =
      GeneratedColumn<String?>('nombre_promocion', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _valorPromocionMeta =
      const VerificationMeta('valorPromocion');
  late final GeneratedColumn<double?> valorPromocion = GeneratedColumn<double?>(
      'valor_promocion', aliasedName, true,
      typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _nroCartonesMeta =
      const VerificationMeta('nroCartones');
  late final GeneratedColumn<int?> nroCartones = GeneratedColumn<int?>(
      'nro_cartones', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  late final GeneratedColumn<String?> estado = GeneratedColumn<String?>(
      'estado', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _actualizadoMeta =
      const VerificationMeta('actualizado');
  late final GeneratedColumn<DateTime?> actualizado =
      GeneratedColumn<DateTime?>('actualizado', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idJuegoPromocion,
        idProgramacionJuego,
        idPromocion,
        nombrePromocion,
        valorPromocion,
        nroCartones,
        estado,
        actualizado
      ];
  @override
  String get aliasedName => _alias ?? 'juegos_promociones';
  @override
  String get actualTableName => 'juegos_promociones';
  @override
  VerificationContext validateIntegrity(Insertable<JuegoPromocion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_juego_promocion')) {
      context.handle(
          _idJuegoPromocionMeta,
          idJuegoPromocion.isAcceptableOrUnknown(
              data['id_juego_promocion']!, _idJuegoPromocionMeta));
    }
    if (data.containsKey('id_programacion_juego')) {
      context.handle(
          _idProgramacionJuegoMeta,
          idProgramacionJuego.isAcceptableOrUnknown(
              data['id_programacion_juego']!, _idProgramacionJuegoMeta));
    } else if (isInserting) {
      context.missing(_idProgramacionJuegoMeta);
    }
    if (data.containsKey('id_promocion')) {
      context.handle(
          _idPromocionMeta,
          idPromocion.isAcceptableOrUnknown(
              data['id_promocion']!, _idPromocionMeta));
    } else if (isInserting) {
      context.missing(_idPromocionMeta);
    }
    if (data.containsKey('nombre_promocion')) {
      context.handle(
          _nombrePromocionMeta,
          nombrePromocion.isAcceptableOrUnknown(
              data['nombre_promocion']!, _nombrePromocionMeta));
    } else if (isInserting) {
      context.missing(_nombrePromocionMeta);
    }
    if (data.containsKey('valor_promocion')) {
      context.handle(
          _valorPromocionMeta,
          valorPromocion.isAcceptableOrUnknown(
              data['valor_promocion']!, _valorPromocionMeta));
    }
    if (data.containsKey('nro_cartones')) {
      context.handle(
          _nroCartonesMeta,
          nroCartones.isAcceptableOrUnknown(
              data['nro_cartones']!, _nroCartonesMeta));
    } else if (isInserting) {
      context.missing(_nroCartonesMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
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
  Set<GeneratedColumn> get $primaryKey => {idJuegoPromocion};
  @override
  JuegoPromocion map(Map<String, dynamic> data, {String? tablePrefix}) {
    return JuegoPromocion.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $JuegosPromocionesTable createAlias(String alias) {
    return $JuegosPromocionesTable(_db, alias);
  }
}

class Sincronizado extends DataClass implements Insertable<Sincronizado> {
  final int idSincronizado;
  final DateTime fechaSincronizado;
  final bool isSync;
  final String tabla;
  final String estado;
  Sincronizado(
      {required this.idSincronizado,
      required this.fechaSincronizado,
      required this.isSync,
      required this.tabla,
      required this.estado});
  factory Sincronizado.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Sincronizado(
      idSincronizado: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_sincronizado'])!,
      fechaSincronizado: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}fecha_sincronizado'])!,
      isSync: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_sync'])!,
      tabla: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}tabla'])!,
      estado: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_sincronizado'] = Variable<int>(idSincronizado);
    map['fecha_sincronizado'] = Variable<DateTime>(fechaSincronizado);
    map['is_sync'] = Variable<bool>(isSync);
    map['tabla'] = Variable<String>(tabla);
    map['estado'] = Variable<String>(estado);
    return map;
  }

  SincronizadosCompanion toCompanion(bool nullToAbsent) {
    return SincronizadosCompanion(
      idSincronizado: Value(idSincronizado),
      fechaSincronizado: Value(fechaSincronizado),
      isSync: Value(isSync),
      tabla: Value(tabla),
      estado: Value(estado),
    );
  }

  factory Sincronizado.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Sincronizado(
      idSincronizado: serializer.fromJson<int>(json['idSincronizado']),
      fechaSincronizado:
          serializer.fromJson<DateTime>(json['fechaSincronizado']),
      isSync: serializer.fromJson<bool>(json['isSync']),
      tabla: serializer.fromJson<String>(json['tabla']),
      estado: serializer.fromJson<String>(json['estado']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idSincronizado': serializer.toJson<int>(idSincronizado),
      'fechaSincronizado': serializer.toJson<DateTime>(fechaSincronizado),
      'isSync': serializer.toJson<bool>(isSync),
      'tabla': serializer.toJson<String>(tabla),
      'estado': serializer.toJson<String>(estado),
    };
  }

  Sincronizado copyWith(
          {int? idSincronizado,
          DateTime? fechaSincronizado,
          bool? isSync,
          String? tabla,
          String? estado}) =>
      Sincronizado(
        idSincronizado: idSincronizado ?? this.idSincronizado,
        fechaSincronizado: fechaSincronizado ?? this.fechaSincronizado,
        isSync: isSync ?? this.isSync,
        tabla: tabla ?? this.tabla,
        estado: estado ?? this.estado,
      );
  @override
  String toString() {
    return (StringBuffer('Sincronizado(')
          ..write('idSincronizado: $idSincronizado, ')
          ..write('fechaSincronizado: $fechaSincronizado, ')
          ..write('isSync: $isSync, ')
          ..write('tabla: $tabla, ')
          ..write('estado: $estado')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idSincronizado, fechaSincronizado, isSync, tabla, estado);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Sincronizado &&
          other.idSincronizado == this.idSincronizado &&
          other.fechaSincronizado == this.fechaSincronizado &&
          other.isSync == this.isSync &&
          other.tabla == this.tabla &&
          other.estado == this.estado);
}

class SincronizadosCompanion extends UpdateCompanion<Sincronizado> {
  final Value<int> idSincronizado;
  final Value<DateTime> fechaSincronizado;
  final Value<bool> isSync;
  final Value<String> tabla;
  final Value<String> estado;
  const SincronizadosCompanion({
    this.idSincronizado = const Value.absent(),
    this.fechaSincronizado = const Value.absent(),
    this.isSync = const Value.absent(),
    this.tabla = const Value.absent(),
    this.estado = const Value.absent(),
  });
  SincronizadosCompanion.insert({
    this.idSincronizado = const Value.absent(),
    required DateTime fechaSincronizado,
    this.isSync = const Value.absent(),
    required String tabla,
    required String estado,
  })  : fechaSincronizado = Value(fechaSincronizado),
        tabla = Value(tabla),
        estado = Value(estado);
  static Insertable<Sincronizado> custom({
    Expression<int>? idSincronizado,
    Expression<DateTime>? fechaSincronizado,
    Expression<bool>? isSync,
    Expression<String>? tabla,
    Expression<String>? estado,
  }) {
    return RawValuesInsertable({
      if (idSincronizado != null) 'id_sincronizado': idSincronizado,
      if (fechaSincronizado != null) 'fecha_sincronizado': fechaSincronizado,
      if (isSync != null) 'is_sync': isSync,
      if (tabla != null) 'tabla': tabla,
      if (estado != null) 'estado': estado,
    });
  }

  SincronizadosCompanion copyWith(
      {Value<int>? idSincronizado,
      Value<DateTime>? fechaSincronizado,
      Value<bool>? isSync,
      Value<String>? tabla,
      Value<String>? estado}) {
    return SincronizadosCompanion(
      idSincronizado: idSincronizado ?? this.idSincronizado,
      fechaSincronizado: fechaSincronizado ?? this.fechaSincronizado,
      isSync: isSync ?? this.isSync,
      tabla: tabla ?? this.tabla,
      estado: estado ?? this.estado,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idSincronizado.present) {
      map['id_sincronizado'] = Variable<int>(idSincronizado.value);
    }
    if (fechaSincronizado.present) {
      map['fecha_sincronizado'] = Variable<DateTime>(fechaSincronizado.value);
    }
    if (isSync.present) {
      map['is_sync'] = Variable<bool>(isSync.value);
    }
    if (tabla.present) {
      map['tabla'] = Variable<String>(tabla.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SincronizadosCompanion(')
          ..write('idSincronizado: $idSincronizado, ')
          ..write('fechaSincronizado: $fechaSincronizado, ')
          ..write('isSync: $isSync, ')
          ..write('tabla: $tabla, ')
          ..write('estado: $estado')
          ..write(')'))
        .toString();
  }
}

class $SincronizadosTable extends Sincronizados
    with TableInfo<$SincronizadosTable, Sincronizado> {
  final GeneratedDatabase _db;
  final String? _alias;
  $SincronizadosTable(this._db, [this._alias]);
  final VerificationMeta _idSincronizadoMeta =
      const VerificationMeta('idSincronizado');
  late final GeneratedColumn<int?> idSincronizado = GeneratedColumn<int?>(
      'id_sincronizado', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _fechaSincronizadoMeta =
      const VerificationMeta('fechaSincronizado');
  late final GeneratedColumn<DateTime?> fechaSincronizado =
      GeneratedColumn<DateTime?>('fecha_sincronizado', aliasedName, false,
          typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _isSyncMeta = const VerificationMeta('isSync');
  late final GeneratedColumn<bool?> isSync = GeneratedColumn<bool?>(
      'is_sync', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_sync IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _tablaMeta = const VerificationMeta('tabla');
  late final GeneratedColumn<String?> tabla = GeneratedColumn<String?>(
      'tabla', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  late final GeneratedColumn<String?> estado = GeneratedColumn<String?>(
      'estado', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [idSincronizado, fechaSincronizado, isSync, tabla, estado];
  @override
  String get aliasedName => _alias ?? 'sincronizados';
  @override
  String get actualTableName => 'sincronizados';
  @override
  VerificationContext validateIntegrity(Insertable<Sincronizado> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_sincronizado')) {
      context.handle(
          _idSincronizadoMeta,
          idSincronizado.isAcceptableOrUnknown(
              data['id_sincronizado']!, _idSincronizadoMeta));
    }
    if (data.containsKey('fecha_sincronizado')) {
      context.handle(
          _fechaSincronizadoMeta,
          fechaSincronizado.isAcceptableOrUnknown(
              data['fecha_sincronizado']!, _fechaSincronizadoMeta));
    } else if (isInserting) {
      context.missing(_fechaSincronizadoMeta);
    }
    if (data.containsKey('is_sync')) {
      context.handle(_isSyncMeta,
          isSync.isAcceptableOrUnknown(data['is_sync']!, _isSyncMeta));
    }
    if (data.containsKey('tabla')) {
      context.handle(
          _tablaMeta, tabla.isAcceptableOrUnknown(data['tabla']!, _tablaMeta));
    } else if (isInserting) {
      context.missing(_tablaMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    } else if (isInserting) {
      context.missing(_estadoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idSincronizado};
  @override
  Sincronizado map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Sincronizado.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SincronizadosTable createAlias(String alias) {
    return $SincronizadosTable(_db, alias);
  }
}

class Configuracion extends DataClass implements Insertable<Configuracion> {
  final int idConfiguracion;
  final int idProgramacionJuego;
  final int carton;
  final String? serie;
  final int balotas;
  final DateTime? fechaRegistro;
  final int idUsuario;
  final String? estado;
  final DateTime? fechaModificacion;
  final bool reconfigurado;
  final String? clienteDefecto;
  final int cartonDual;
  Configuracion(
      {required this.idConfiguracion,
      required this.idProgramacionJuego,
      required this.carton,
      this.serie,
      required this.balotas,
      this.fechaRegistro,
      required this.idUsuario,
      this.estado,
      this.fechaModificacion,
      required this.reconfigurado,
      this.clienteDefecto,
      required this.cartonDual});
  factory Configuracion.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Configuracion(
      idConfiguracion: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_configuracion'])!,
      idProgramacionJuego: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_programacion_juego'])!,
      carton: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carton'])!,
      serie: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}serie']),
      balotas: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}balotas'])!,
      fechaRegistro: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_registro']),
      idUsuario: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_usuario'])!,
      estado: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado']),
      fechaModificacion: const DateTimeType().mapFromDatabaseResponse(
          data['${effectivePrefix}fecha_modificacion']),
      reconfigurado: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}reconfigurado'])!,
      clienteDefecto: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}cliente_defecto']),
      cartonDual: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carton_dual'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_configuracion'] = Variable<int>(idConfiguracion);
    map['id_programacion_juego'] = Variable<int>(idProgramacionJuego);
    map['carton'] = Variable<int>(carton);
    if (!nullToAbsent || serie != null) {
      map['serie'] = Variable<String?>(serie);
    }
    map['balotas'] = Variable<int>(balotas);
    if (!nullToAbsent || fechaRegistro != null) {
      map['fecha_registro'] = Variable<DateTime?>(fechaRegistro);
    }
    map['id_usuario'] = Variable<int>(idUsuario);
    if (!nullToAbsent || estado != null) {
      map['estado'] = Variable<String?>(estado);
    }
    if (!nullToAbsent || fechaModificacion != null) {
      map['fecha_modificacion'] = Variable<DateTime?>(fechaModificacion);
    }
    map['reconfigurado'] = Variable<bool>(reconfigurado);
    if (!nullToAbsent || clienteDefecto != null) {
      map['cliente_defecto'] = Variable<String?>(clienteDefecto);
    }
    map['carton_dual'] = Variable<int>(cartonDual);
    return map;
  }

  ConfiguracionesCompanion toCompanion(bool nullToAbsent) {
    return ConfiguracionesCompanion(
      idConfiguracion: Value(idConfiguracion),
      idProgramacionJuego: Value(idProgramacionJuego),
      carton: Value(carton),
      serie:
          serie == null && nullToAbsent ? const Value.absent() : Value(serie),
      balotas: Value(balotas),
      fechaRegistro: fechaRegistro == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaRegistro),
      idUsuario: Value(idUsuario),
      estado:
          estado == null && nullToAbsent ? const Value.absent() : Value(estado),
      fechaModificacion: fechaModificacion == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaModificacion),
      reconfigurado: Value(reconfigurado),
      clienteDefecto: clienteDefecto == null && nullToAbsent
          ? const Value.absent()
          : Value(clienteDefecto),
      cartonDual: Value(cartonDual),
    );
  }

  factory Configuracion.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Configuracion(
      idConfiguracion: serializer.fromJson<int>(json['idConfiguracion']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      carton: serializer.fromJson<int>(json['carton']),
      serie: serializer.fromJson<String?>(json['serie']),
      balotas: serializer.fromJson<int>(json['balotas']),
      fechaRegistro: serializer.fromJson<DateTime?>(json['fechaRegistro']),
      idUsuario: serializer.fromJson<int>(json['idUsuario']),
      estado: serializer.fromJson<String?>(json['estado']),
      fechaModificacion:
          serializer.fromJson<DateTime?>(json['fechaModificacion']),
      reconfigurado: serializer.fromJson<bool>(json['reconfigurado']),
      clienteDefecto: serializer.fromJson<String?>(json['clienteDefecto']),
      cartonDual: serializer.fromJson<int>(json['cartonDual']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idConfiguracion': serializer.toJson<int>(idConfiguracion),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'carton': serializer.toJson<int>(carton),
      'serie': serializer.toJson<String?>(serie),
      'balotas': serializer.toJson<int>(balotas),
      'fechaRegistro': serializer.toJson<DateTime?>(fechaRegistro),
      'idUsuario': serializer.toJson<int>(idUsuario),
      'estado': serializer.toJson<String?>(estado),
      'fechaModificacion': serializer.toJson<DateTime?>(fechaModificacion),
      'reconfigurado': serializer.toJson<bool>(reconfigurado),
      'clienteDefecto': serializer.toJson<String?>(clienteDefecto),
      'cartonDual': serializer.toJson<int>(cartonDual),
    };
  }

  Configuracion copyWith(
          {int? idConfiguracion,
          int? idProgramacionJuego,
          int? carton,
          String? serie,
          int? balotas,
          DateTime? fechaRegistro,
          int? idUsuario,
          String? estado,
          DateTime? fechaModificacion,
          bool? reconfigurado,
          String? clienteDefecto,
          int? cartonDual}) =>
      Configuracion(
        idConfiguracion: idConfiguracion ?? this.idConfiguracion,
        idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
        carton: carton ?? this.carton,
        serie: serie ?? this.serie,
        balotas: balotas ?? this.balotas,
        fechaRegistro: fechaRegistro ?? this.fechaRegistro,
        idUsuario: idUsuario ?? this.idUsuario,
        estado: estado ?? this.estado,
        fechaModificacion: fechaModificacion ?? this.fechaModificacion,
        reconfigurado: reconfigurado ?? this.reconfigurado,
        clienteDefecto: clienteDefecto ?? this.clienteDefecto,
        cartonDual: cartonDual ?? this.cartonDual,
      );
  @override
  String toString() {
    return (StringBuffer('Configuracion(')
          ..write('idConfiguracion: $idConfiguracion, ')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('carton: $carton, ')
          ..write('serie: $serie, ')
          ..write('balotas: $balotas, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('idUsuario: $idUsuario, ')
          ..write('estado: $estado, ')
          ..write('fechaModificacion: $fechaModificacion, ')
          ..write('reconfigurado: $reconfigurado, ')
          ..write('clienteDefecto: $clienteDefecto, ')
          ..write('cartonDual: $cartonDual')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idConfiguracion,
      idProgramacionJuego,
      carton,
      serie,
      balotas,
      fechaRegistro,
      idUsuario,
      estado,
      fechaModificacion,
      reconfigurado,
      clienteDefecto,
      cartonDual);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Configuracion &&
          other.idConfiguracion == this.idConfiguracion &&
          other.idProgramacionJuego == this.idProgramacionJuego &&
          other.carton == this.carton &&
          other.serie == this.serie &&
          other.balotas == this.balotas &&
          other.fechaRegistro == this.fechaRegistro &&
          other.idUsuario == this.idUsuario &&
          other.estado == this.estado &&
          other.fechaModificacion == this.fechaModificacion &&
          other.reconfigurado == this.reconfigurado &&
          other.clienteDefecto == this.clienteDefecto &&
          other.cartonDual == this.cartonDual);
}

class ConfiguracionesCompanion extends UpdateCompanion<Configuracion> {
  final Value<int> idConfiguracion;
  final Value<int> idProgramacionJuego;
  final Value<int> carton;
  final Value<String?> serie;
  final Value<int> balotas;
  final Value<DateTime?> fechaRegistro;
  final Value<int> idUsuario;
  final Value<String?> estado;
  final Value<DateTime?> fechaModificacion;
  final Value<bool> reconfigurado;
  final Value<String?> clienteDefecto;
  final Value<int> cartonDual;
  const ConfiguracionesCompanion({
    this.idConfiguracion = const Value.absent(),
    this.idProgramacionJuego = const Value.absent(),
    this.carton = const Value.absent(),
    this.serie = const Value.absent(),
    this.balotas = const Value.absent(),
    this.fechaRegistro = const Value.absent(),
    this.idUsuario = const Value.absent(),
    this.estado = const Value.absent(),
    this.fechaModificacion = const Value.absent(),
    this.reconfigurado = const Value.absent(),
    this.clienteDefecto = const Value.absent(),
    this.cartonDual = const Value.absent(),
  });
  ConfiguracionesCompanion.insert({
    this.idConfiguracion = const Value.absent(),
    required int idProgramacionJuego,
    required int carton,
    this.serie = const Value.absent(),
    required int balotas,
    this.fechaRegistro = const Value.absent(),
    required int idUsuario,
    this.estado = const Value.absent(),
    this.fechaModificacion = const Value.absent(),
    required bool reconfigurado,
    this.clienteDefecto = const Value.absent(),
    this.cartonDual = const Value.absent(),
  })  : idProgramacionJuego = Value(idProgramacionJuego),
        carton = Value(carton),
        balotas = Value(balotas),
        idUsuario = Value(idUsuario),
        reconfigurado = Value(reconfigurado);
  static Insertable<Configuracion> custom({
    Expression<int>? idConfiguracion,
    Expression<int>? idProgramacionJuego,
    Expression<int>? carton,
    Expression<String?>? serie,
    Expression<int>? balotas,
    Expression<DateTime?>? fechaRegistro,
    Expression<int>? idUsuario,
    Expression<String?>? estado,
    Expression<DateTime?>? fechaModificacion,
    Expression<bool>? reconfigurado,
    Expression<String?>? clienteDefecto,
    Expression<int>? cartonDual,
  }) {
    return RawValuesInsertable({
      if (idConfiguracion != null) 'id_configuracion': idConfiguracion,
      if (idProgramacionJuego != null)
        'id_programacion_juego': idProgramacionJuego,
      if (carton != null) 'carton': carton,
      if (serie != null) 'serie': serie,
      if (balotas != null) 'balotas': balotas,
      if (fechaRegistro != null) 'fecha_registro': fechaRegistro,
      if (idUsuario != null) 'id_usuario': idUsuario,
      if (estado != null) 'estado': estado,
      if (fechaModificacion != null) 'fecha_modificacion': fechaModificacion,
      if (reconfigurado != null) 'reconfigurado': reconfigurado,
      if (clienteDefecto != null) 'cliente_defecto': clienteDefecto,
      if (cartonDual != null) 'carton_dual': cartonDual,
    });
  }

  ConfiguracionesCompanion copyWith(
      {Value<int>? idConfiguracion,
      Value<int>? idProgramacionJuego,
      Value<int>? carton,
      Value<String?>? serie,
      Value<int>? balotas,
      Value<DateTime?>? fechaRegistro,
      Value<int>? idUsuario,
      Value<String?>? estado,
      Value<DateTime?>? fechaModificacion,
      Value<bool>? reconfigurado,
      Value<String?>? clienteDefecto,
      Value<int>? cartonDual}) {
    return ConfiguracionesCompanion(
      idConfiguracion: idConfiguracion ?? this.idConfiguracion,
      idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
      carton: carton ?? this.carton,
      serie: serie ?? this.serie,
      balotas: balotas ?? this.balotas,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      idUsuario: idUsuario ?? this.idUsuario,
      estado: estado ?? this.estado,
      fechaModificacion: fechaModificacion ?? this.fechaModificacion,
      reconfigurado: reconfigurado ?? this.reconfigurado,
      clienteDefecto: clienteDefecto ?? this.clienteDefecto,
      cartonDual: cartonDual ?? this.cartonDual,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idConfiguracion.present) {
      map['id_configuracion'] = Variable<int>(idConfiguracion.value);
    }
    if (idProgramacionJuego.present) {
      map['id_programacion_juego'] = Variable<int>(idProgramacionJuego.value);
    }
    if (carton.present) {
      map['carton'] = Variable<int>(carton.value);
    }
    if (serie.present) {
      map['serie'] = Variable<String?>(serie.value);
    }
    if (balotas.present) {
      map['balotas'] = Variable<int>(balotas.value);
    }
    if (fechaRegistro.present) {
      map['fecha_registro'] = Variable<DateTime?>(fechaRegistro.value);
    }
    if (idUsuario.present) {
      map['id_usuario'] = Variable<int>(idUsuario.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String?>(estado.value);
    }
    if (fechaModificacion.present) {
      map['fecha_modificacion'] = Variable<DateTime?>(fechaModificacion.value);
    }
    if (reconfigurado.present) {
      map['reconfigurado'] = Variable<bool>(reconfigurado.value);
    }
    if (clienteDefecto.present) {
      map['cliente_defecto'] = Variable<String?>(clienteDefecto.value);
    }
    if (cartonDual.present) {
      map['carton_dual'] = Variable<int>(cartonDual.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConfiguracionesCompanion(')
          ..write('idConfiguracion: $idConfiguracion, ')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('carton: $carton, ')
          ..write('serie: $serie, ')
          ..write('balotas: $balotas, ')
          ..write('fechaRegistro: $fechaRegistro, ')
          ..write('idUsuario: $idUsuario, ')
          ..write('estado: $estado, ')
          ..write('fechaModificacion: $fechaModificacion, ')
          ..write('reconfigurado: $reconfigurado, ')
          ..write('clienteDefecto: $clienteDefecto, ')
          ..write('cartonDual: $cartonDual')
          ..write(')'))
        .toString();
  }
}

class $ConfiguracionesTable extends Configuraciones
    with TableInfo<$ConfiguracionesTable, Configuracion> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ConfiguracionesTable(this._db, [this._alias]);
  final VerificationMeta _idConfiguracionMeta =
      const VerificationMeta('idConfiguracion');
  late final GeneratedColumn<int?> idConfiguracion = GeneratedColumn<int?>(
      'id_configuracion', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idProgramacionJuegoMeta =
      const VerificationMeta('idProgramacionJuego');
  late final GeneratedColumn<int?> idProgramacionJuego = GeneratedColumn<int?>(
      'id_programacion_juego', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _cartonMeta = const VerificationMeta('carton');
  late final GeneratedColumn<int?> carton = GeneratedColumn<int?>(
      'carton', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _serieMeta = const VerificationMeta('serie');
  late final GeneratedColumn<String?> serie = GeneratedColumn<String?>(
      'serie', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _balotasMeta = const VerificationMeta('balotas');
  late final GeneratedColumn<int?> balotas = GeneratedColumn<int?>(
      'balotas', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaRegistroMeta =
      const VerificationMeta('fechaRegistro');
  late final GeneratedColumn<DateTime?> fechaRegistro =
      GeneratedColumn<DateTime?>('fecha_registro', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _idUsuarioMeta = const VerificationMeta('idUsuario');
  late final GeneratedColumn<int?> idUsuario = GeneratedColumn<int?>(
      'id_usuario', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  late final GeneratedColumn<String?> estado = GeneratedColumn<String?>(
      'estado', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _fechaModificacionMeta =
      const VerificationMeta('fechaModificacion');
  late final GeneratedColumn<DateTime?> fechaModificacion =
      GeneratedColumn<DateTime?>('fecha_modificacion', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _reconfiguradoMeta =
      const VerificationMeta('reconfigurado');
  late final GeneratedColumn<bool?> reconfigurado = GeneratedColumn<bool?>(
      'reconfigurado', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (reconfigurado IN (0, 1))');
  final VerificationMeta _clienteDefectoMeta =
      const VerificationMeta('clienteDefecto');
  late final GeneratedColumn<String?> clienteDefecto = GeneratedColumn<String?>(
      'cliente_defecto', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _cartonDualMeta = const VerificationMeta('cartonDual');
  late final GeneratedColumn<int?> cartonDual = GeneratedColumn<int?>(
      'carton_dual', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        idConfiguracion,
        idProgramacionJuego,
        carton,
        serie,
        balotas,
        fechaRegistro,
        idUsuario,
        estado,
        fechaModificacion,
        reconfigurado,
        clienteDefecto,
        cartonDual
      ];
  @override
  String get aliasedName => _alias ?? 'configuraciones';
  @override
  String get actualTableName => 'configuraciones';
  @override
  VerificationContext validateIntegrity(Insertable<Configuracion> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_configuracion')) {
      context.handle(
          _idConfiguracionMeta,
          idConfiguracion.isAcceptableOrUnknown(
              data['id_configuracion']!, _idConfiguracionMeta));
    }
    if (data.containsKey('id_programacion_juego')) {
      context.handle(
          _idProgramacionJuegoMeta,
          idProgramacionJuego.isAcceptableOrUnknown(
              data['id_programacion_juego']!, _idProgramacionJuegoMeta));
    } else if (isInserting) {
      context.missing(_idProgramacionJuegoMeta);
    }
    if (data.containsKey('carton')) {
      context.handle(_cartonMeta,
          carton.isAcceptableOrUnknown(data['carton']!, _cartonMeta));
    } else if (isInserting) {
      context.missing(_cartonMeta);
    }
    if (data.containsKey('serie')) {
      context.handle(
          _serieMeta, serie.isAcceptableOrUnknown(data['serie']!, _serieMeta));
    }
    if (data.containsKey('balotas')) {
      context.handle(_balotasMeta,
          balotas.isAcceptableOrUnknown(data['balotas']!, _balotasMeta));
    } else if (isInserting) {
      context.missing(_balotasMeta);
    }
    if (data.containsKey('fecha_registro')) {
      context.handle(
          _fechaRegistroMeta,
          fechaRegistro.isAcceptableOrUnknown(
              data['fecha_registro']!, _fechaRegistroMeta));
    }
    if (data.containsKey('id_usuario')) {
      context.handle(_idUsuarioMeta,
          idUsuario.isAcceptableOrUnknown(data['id_usuario']!, _idUsuarioMeta));
    } else if (isInserting) {
      context.missing(_idUsuarioMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    }
    if (data.containsKey('fecha_modificacion')) {
      context.handle(
          _fechaModificacionMeta,
          fechaModificacion.isAcceptableOrUnknown(
              data['fecha_modificacion']!, _fechaModificacionMeta));
    }
    if (data.containsKey('reconfigurado')) {
      context.handle(
          _reconfiguradoMeta,
          reconfigurado.isAcceptableOrUnknown(
              data['reconfigurado']!, _reconfiguradoMeta));
    } else if (isInserting) {
      context.missing(_reconfiguradoMeta);
    }
    if (data.containsKey('cliente_defecto')) {
      context.handle(
          _clienteDefectoMeta,
          clienteDefecto.isAcceptableOrUnknown(
              data['cliente_defecto']!, _clienteDefectoMeta));
    }
    if (data.containsKey('carton_dual')) {
      context.handle(
          _cartonDualMeta,
          cartonDual.isAcceptableOrUnknown(
              data['carton_dual']!, _cartonDualMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idConfiguracion};
  @override
  Configuracion map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Configuracion.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ConfiguracionesTable createAlias(String alias) {
    return $ConfiguracionesTable(_db, alias);
  }
}

class Figura extends DataClass implements Insertable<Figura> {
  final int idFigura;
  final int idProgramacionJuego;
  final int idPlenoAutomatico;
  final String nombre;
  final String posiciones;
  final String estado;
  final double valorPremio;
  final DateTime? actualizado;
  final String? acumula;
  final String? multiple;
  final int carton;
  final DateTime? fechaAjuste;
  final int? idUsuario;
  Figura(
      {required this.idFigura,
      required this.idProgramacionJuego,
      required this.idPlenoAutomatico,
      required this.nombre,
      required this.posiciones,
      required this.estado,
      required this.valorPremio,
      this.actualizado,
      this.acumula,
      this.multiple,
      required this.carton,
      this.fechaAjuste,
      this.idUsuario});
  factory Figura.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Figura(
      idFigura: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_figura'])!,
      idProgramacionJuego: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_programacion_juego'])!,
      idPlenoAutomatico: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}id_pleno_automatico'])!,
      nombre: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nombre'])!,
      posiciones: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}posiciones'])!,
      estado: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}estado'])!,
      valorPremio: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}valor_premio'])!,
      actualizado: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}actualizado']),
      acumula: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}acumula']),
      multiple: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}multiple']),
      carton: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}carton'])!,
      fechaAjuste: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}fecha_ajuste']),
      idUsuario: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id_usuario']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_figura'] = Variable<int>(idFigura);
    map['id_programacion_juego'] = Variable<int>(idProgramacionJuego);
    map['id_pleno_automatico'] = Variable<int>(idPlenoAutomatico);
    map['nombre'] = Variable<String>(nombre);
    map['posiciones'] = Variable<String>(posiciones);
    map['estado'] = Variable<String>(estado);
    map['valor_premio'] = Variable<double>(valorPremio);
    if (!nullToAbsent || actualizado != null) {
      map['actualizado'] = Variable<DateTime?>(actualizado);
    }
    if (!nullToAbsent || acumula != null) {
      map['acumula'] = Variable<String?>(acumula);
    }
    if (!nullToAbsent || multiple != null) {
      map['multiple'] = Variable<String?>(multiple);
    }
    map['carton'] = Variable<int>(carton);
    if (!nullToAbsent || fechaAjuste != null) {
      map['fecha_ajuste'] = Variable<DateTime?>(fechaAjuste);
    }
    if (!nullToAbsent || idUsuario != null) {
      map['id_usuario'] = Variable<int?>(idUsuario);
    }
    return map;
  }

  FigurasCompanion toCompanion(bool nullToAbsent) {
    return FigurasCompanion(
      idFigura: Value(idFigura),
      idProgramacionJuego: Value(idProgramacionJuego),
      idPlenoAutomatico: Value(idPlenoAutomatico),
      nombre: Value(nombre),
      posiciones: Value(posiciones),
      estado: Value(estado),
      valorPremio: Value(valorPremio),
      actualizado: actualizado == null && nullToAbsent
          ? const Value.absent()
          : Value(actualizado),
      acumula: acumula == null && nullToAbsent
          ? const Value.absent()
          : Value(acumula),
      multiple: multiple == null && nullToAbsent
          ? const Value.absent()
          : Value(multiple),
      carton: Value(carton),
      fechaAjuste: fechaAjuste == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaAjuste),
      idUsuario: idUsuario == null && nullToAbsent
          ? const Value.absent()
          : Value(idUsuario),
    );
  }

  factory Figura.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Figura(
      idFigura: serializer.fromJson<int>(json['idFigura']),
      idProgramacionJuego:
          serializer.fromJson<int>(json['idProgramacionJuego']),
      idPlenoAutomatico: serializer.fromJson<int>(json['idPlenoAutomatico']),
      nombre: serializer.fromJson<String>(json['nombre']),
      posiciones: serializer.fromJson<String>(json['posiciones']),
      estado: serializer.fromJson<String>(json['estado']),
      valorPremio: serializer.fromJson<double>(json['valorPremio']),
      actualizado: serializer.fromJson<DateTime?>(json['actualizado']),
      acumula: serializer.fromJson<String?>(json['acumula']),
      multiple: serializer.fromJson<String?>(json['multiple']),
      carton: serializer.fromJson<int>(json['carton']),
      fechaAjuste: serializer.fromJson<DateTime?>(json['fechaAjuste']),
      idUsuario: serializer.fromJson<int?>(json['idUsuario']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idFigura': serializer.toJson<int>(idFigura),
      'idProgramacionJuego': serializer.toJson<int>(idProgramacionJuego),
      'idPlenoAutomatico': serializer.toJson<int>(idPlenoAutomatico),
      'nombre': serializer.toJson<String>(nombre),
      'posiciones': serializer.toJson<String>(posiciones),
      'estado': serializer.toJson<String>(estado),
      'valorPremio': serializer.toJson<double>(valorPremio),
      'actualizado': serializer.toJson<DateTime?>(actualizado),
      'acumula': serializer.toJson<String?>(acumula),
      'multiple': serializer.toJson<String?>(multiple),
      'carton': serializer.toJson<int>(carton),
      'fechaAjuste': serializer.toJson<DateTime?>(fechaAjuste),
      'idUsuario': serializer.toJson<int?>(idUsuario),
    };
  }

  Figura copyWith(
          {int? idFigura,
          int? idProgramacionJuego,
          int? idPlenoAutomatico,
          String? nombre,
          String? posiciones,
          String? estado,
          double? valorPremio,
          DateTime? actualizado,
          String? acumula,
          String? multiple,
          int? carton,
          DateTime? fechaAjuste,
          int? idUsuario}) =>
      Figura(
        idFigura: idFigura ?? this.idFigura,
        idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
        idPlenoAutomatico: idPlenoAutomatico ?? this.idPlenoAutomatico,
        nombre: nombre ?? this.nombre,
        posiciones: posiciones ?? this.posiciones,
        estado: estado ?? this.estado,
        valorPremio: valorPremio ?? this.valorPremio,
        actualizado: actualizado ?? this.actualizado,
        acumula: acumula ?? this.acumula,
        multiple: multiple ?? this.multiple,
        carton: carton ?? this.carton,
        fechaAjuste: fechaAjuste ?? this.fechaAjuste,
        idUsuario: idUsuario ?? this.idUsuario,
      );
  @override
  String toString() {
    return (StringBuffer('Figura(')
          ..write('idFigura: $idFigura, ')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('idPlenoAutomatico: $idPlenoAutomatico, ')
          ..write('nombre: $nombre, ')
          ..write('posiciones: $posiciones, ')
          ..write('estado: $estado, ')
          ..write('valorPremio: $valorPremio, ')
          ..write('actualizado: $actualizado, ')
          ..write('acumula: $acumula, ')
          ..write('multiple: $multiple, ')
          ..write('carton: $carton, ')
          ..write('fechaAjuste: $fechaAjuste, ')
          ..write('idUsuario: $idUsuario')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      idFigura,
      idProgramacionJuego,
      idPlenoAutomatico,
      nombre,
      posiciones,
      estado,
      valorPremio,
      actualizado,
      acumula,
      multiple,
      carton,
      fechaAjuste,
      idUsuario);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Figura &&
          other.idFigura == this.idFigura &&
          other.idProgramacionJuego == this.idProgramacionJuego &&
          other.idPlenoAutomatico == this.idPlenoAutomatico &&
          other.nombre == this.nombre &&
          other.posiciones == this.posiciones &&
          other.estado == this.estado &&
          other.valorPremio == this.valorPremio &&
          other.actualizado == this.actualizado &&
          other.acumula == this.acumula &&
          other.multiple == this.multiple &&
          other.carton == this.carton &&
          other.fechaAjuste == this.fechaAjuste &&
          other.idUsuario == this.idUsuario);
}

class FigurasCompanion extends UpdateCompanion<Figura> {
  final Value<int> idFigura;
  final Value<int> idProgramacionJuego;
  final Value<int> idPlenoAutomatico;
  final Value<String> nombre;
  final Value<String> posiciones;
  final Value<String> estado;
  final Value<double> valorPremio;
  final Value<DateTime?> actualizado;
  final Value<String?> acumula;
  final Value<String?> multiple;
  final Value<int> carton;
  final Value<DateTime?> fechaAjuste;
  final Value<int?> idUsuario;
  const FigurasCompanion({
    this.idFigura = const Value.absent(),
    this.idProgramacionJuego = const Value.absent(),
    this.idPlenoAutomatico = const Value.absent(),
    this.nombre = const Value.absent(),
    this.posiciones = const Value.absent(),
    this.estado = const Value.absent(),
    this.valorPremio = const Value.absent(),
    this.actualizado = const Value.absent(),
    this.acumula = const Value.absent(),
    this.multiple = const Value.absent(),
    this.carton = const Value.absent(),
    this.fechaAjuste = const Value.absent(),
    this.idUsuario = const Value.absent(),
  });
  FigurasCompanion.insert({
    this.idFigura = const Value.absent(),
    required int idProgramacionJuego,
    required int idPlenoAutomatico,
    required String nombre,
    required String posiciones,
    this.estado = const Value.absent(),
    required double valorPremio,
    this.actualizado = const Value.absent(),
    this.acumula = const Value.absent(),
    this.multiple = const Value.absent(),
    required int carton,
    this.fechaAjuste = const Value.absent(),
    this.idUsuario = const Value.absent(),
  })  : idProgramacionJuego = Value(idProgramacionJuego),
        idPlenoAutomatico = Value(idPlenoAutomatico),
        nombre = Value(nombre),
        posiciones = Value(posiciones),
        valorPremio = Value(valorPremio),
        carton = Value(carton);
  static Insertable<Figura> custom({
    Expression<int>? idFigura,
    Expression<int>? idProgramacionJuego,
    Expression<int>? idPlenoAutomatico,
    Expression<String>? nombre,
    Expression<String>? posiciones,
    Expression<String>? estado,
    Expression<double>? valorPremio,
    Expression<DateTime?>? actualizado,
    Expression<String?>? acumula,
    Expression<String?>? multiple,
    Expression<int>? carton,
    Expression<DateTime?>? fechaAjuste,
    Expression<int?>? idUsuario,
  }) {
    return RawValuesInsertable({
      if (idFigura != null) 'id_figura': idFigura,
      if (idProgramacionJuego != null)
        'id_programacion_juego': idProgramacionJuego,
      if (idPlenoAutomatico != null) 'id_pleno_automatico': idPlenoAutomatico,
      if (nombre != null) 'nombre': nombre,
      if (posiciones != null) 'posiciones': posiciones,
      if (estado != null) 'estado': estado,
      if (valorPremio != null) 'valor_premio': valorPremio,
      if (actualizado != null) 'actualizado': actualizado,
      if (acumula != null) 'acumula': acumula,
      if (multiple != null) 'multiple': multiple,
      if (carton != null) 'carton': carton,
      if (fechaAjuste != null) 'fecha_ajuste': fechaAjuste,
      if (idUsuario != null) 'id_usuario': idUsuario,
    });
  }

  FigurasCompanion copyWith(
      {Value<int>? idFigura,
      Value<int>? idProgramacionJuego,
      Value<int>? idPlenoAutomatico,
      Value<String>? nombre,
      Value<String>? posiciones,
      Value<String>? estado,
      Value<double>? valorPremio,
      Value<DateTime?>? actualizado,
      Value<String?>? acumula,
      Value<String?>? multiple,
      Value<int>? carton,
      Value<DateTime?>? fechaAjuste,
      Value<int?>? idUsuario}) {
    return FigurasCompanion(
      idFigura: idFigura ?? this.idFigura,
      idProgramacionJuego: idProgramacionJuego ?? this.idProgramacionJuego,
      idPlenoAutomatico: idPlenoAutomatico ?? this.idPlenoAutomatico,
      nombre: nombre ?? this.nombre,
      posiciones: posiciones ?? this.posiciones,
      estado: estado ?? this.estado,
      valorPremio: valorPremio ?? this.valorPremio,
      actualizado: actualizado ?? this.actualizado,
      acumula: acumula ?? this.acumula,
      multiple: multiple ?? this.multiple,
      carton: carton ?? this.carton,
      fechaAjuste: fechaAjuste ?? this.fechaAjuste,
      idUsuario: idUsuario ?? this.idUsuario,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idFigura.present) {
      map['id_figura'] = Variable<int>(idFigura.value);
    }
    if (idProgramacionJuego.present) {
      map['id_programacion_juego'] = Variable<int>(idProgramacionJuego.value);
    }
    if (idPlenoAutomatico.present) {
      map['id_pleno_automatico'] = Variable<int>(idPlenoAutomatico.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (posiciones.present) {
      map['posiciones'] = Variable<String>(posiciones.value);
    }
    if (estado.present) {
      map['estado'] = Variable<String>(estado.value);
    }
    if (valorPremio.present) {
      map['valor_premio'] = Variable<double>(valorPremio.value);
    }
    if (actualizado.present) {
      map['actualizado'] = Variable<DateTime?>(actualizado.value);
    }
    if (acumula.present) {
      map['acumula'] = Variable<String?>(acumula.value);
    }
    if (multiple.present) {
      map['multiple'] = Variable<String?>(multiple.value);
    }
    if (carton.present) {
      map['carton'] = Variable<int>(carton.value);
    }
    if (fechaAjuste.present) {
      map['fecha_ajuste'] = Variable<DateTime?>(fechaAjuste.value);
    }
    if (idUsuario.present) {
      map['id_usuario'] = Variable<int?>(idUsuario.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FigurasCompanion(')
          ..write('idFigura: $idFigura, ')
          ..write('idProgramacionJuego: $idProgramacionJuego, ')
          ..write('idPlenoAutomatico: $idPlenoAutomatico, ')
          ..write('nombre: $nombre, ')
          ..write('posiciones: $posiciones, ')
          ..write('estado: $estado, ')
          ..write('valorPremio: $valorPremio, ')
          ..write('actualizado: $actualizado, ')
          ..write('acumula: $acumula, ')
          ..write('multiple: $multiple, ')
          ..write('carton: $carton, ')
          ..write('fechaAjuste: $fechaAjuste, ')
          ..write('idUsuario: $idUsuario')
          ..write(')'))
        .toString();
  }
}

class $FigurasTable extends Figuras with TableInfo<$FigurasTable, Figura> {
  final GeneratedDatabase _db;
  final String? _alias;
  $FigurasTable(this._db, [this._alias]);
  final VerificationMeta _idFiguraMeta = const VerificationMeta('idFigura');
  late final GeneratedColumn<int?> idFigura = GeneratedColumn<int?>(
      'id_figura', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idProgramacionJuegoMeta =
      const VerificationMeta('idProgramacionJuego');
  late final GeneratedColumn<int?> idProgramacionJuego = GeneratedColumn<int?>(
      'id_programacion_juego', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _idPlenoAutomaticoMeta =
      const VerificationMeta('idPlenoAutomatico');
  late final GeneratedColumn<int?> idPlenoAutomatico = GeneratedColumn<int?>(
      'id_pleno_automatico', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  late final GeneratedColumn<String?> nombre = GeneratedColumn<String?>(
      'nombre', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _posicionesMeta = const VerificationMeta('posiciones');
  late final GeneratedColumn<String?> posiciones = GeneratedColumn<String?>(
      'posiciones', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 20, maxTextLength: 25),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _estadoMeta = const VerificationMeta('estado');
  late final GeneratedColumn<String?> estado = GeneratedColumn<String?>(
      'estado', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      defaultValue: const Constant('A'));
  final VerificationMeta _valorPremioMeta =
      const VerificationMeta('valorPremio');
  late final GeneratedColumn<double?> valorPremio = GeneratedColumn<double?>(
      'valor_premio', aliasedName, false,
      typeName: 'REAL', requiredDuringInsert: true);
  final VerificationMeta _actualizadoMeta =
      const VerificationMeta('actualizado');
  late final GeneratedColumn<DateTime?> actualizado =
      GeneratedColumn<DateTime?>('actualizado', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _acumulaMeta = const VerificationMeta('acumula');
  late final GeneratedColumn<String?> acumula = GeneratedColumn<String?>(
      'acumula', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _multipleMeta = const VerificationMeta('multiple');
  late final GeneratedColumn<String?> multiple = GeneratedColumn<String?>(
      'multiple', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _cartonMeta = const VerificationMeta('carton');
  late final GeneratedColumn<int?> carton = GeneratedColumn<int?>(
      'carton', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _fechaAjusteMeta =
      const VerificationMeta('fechaAjuste');
  late final GeneratedColumn<DateTime?> fechaAjuste =
      GeneratedColumn<DateTime?>('fecha_ajuste', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _idUsuarioMeta = const VerificationMeta('idUsuario');
  late final GeneratedColumn<int?> idUsuario = GeneratedColumn<int?>(
      'id_usuario', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        idFigura,
        idProgramacionJuego,
        idPlenoAutomatico,
        nombre,
        posiciones,
        estado,
        valorPremio,
        actualizado,
        acumula,
        multiple,
        carton,
        fechaAjuste,
        idUsuario
      ];
  @override
  String get aliasedName => _alias ?? 'figuras';
  @override
  String get actualTableName => 'figuras';
  @override
  VerificationContext validateIntegrity(Insertable<Figura> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_figura')) {
      context.handle(_idFiguraMeta,
          idFigura.isAcceptableOrUnknown(data['id_figura']!, _idFiguraMeta));
    }
    if (data.containsKey('id_programacion_juego')) {
      context.handle(
          _idProgramacionJuegoMeta,
          idProgramacionJuego.isAcceptableOrUnknown(
              data['id_programacion_juego']!, _idProgramacionJuegoMeta));
    } else if (isInserting) {
      context.missing(_idProgramacionJuegoMeta);
    }
    if (data.containsKey('id_pleno_automatico')) {
      context.handle(
          _idPlenoAutomaticoMeta,
          idPlenoAutomatico.isAcceptableOrUnknown(
              data['id_pleno_automatico']!, _idPlenoAutomaticoMeta));
    } else if (isInserting) {
      context.missing(_idPlenoAutomaticoMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('posiciones')) {
      context.handle(
          _posicionesMeta,
          posiciones.isAcceptableOrUnknown(
              data['posiciones']!, _posicionesMeta));
    } else if (isInserting) {
      context.missing(_posicionesMeta);
    }
    if (data.containsKey('estado')) {
      context.handle(_estadoMeta,
          estado.isAcceptableOrUnknown(data['estado']!, _estadoMeta));
    }
    if (data.containsKey('valor_premio')) {
      context.handle(
          _valorPremioMeta,
          valorPremio.isAcceptableOrUnknown(
              data['valor_premio']!, _valorPremioMeta));
    } else if (isInserting) {
      context.missing(_valorPremioMeta);
    }
    if (data.containsKey('actualizado')) {
      context.handle(
          _actualizadoMeta,
          actualizado.isAcceptableOrUnknown(
              data['actualizado']!, _actualizadoMeta));
    }
    if (data.containsKey('acumula')) {
      context.handle(_acumulaMeta,
          acumula.isAcceptableOrUnknown(data['acumula']!, _acumulaMeta));
    }
    if (data.containsKey('multiple')) {
      context.handle(_multipleMeta,
          multiple.isAcceptableOrUnknown(data['multiple']!, _multipleMeta));
    }
    if (data.containsKey('carton')) {
      context.handle(_cartonMeta,
          carton.isAcceptableOrUnknown(data['carton']!, _cartonMeta));
    } else if (isInserting) {
      context.missing(_cartonMeta);
    }
    if (data.containsKey('fecha_ajuste')) {
      context.handle(
          _fechaAjusteMeta,
          fechaAjuste.isAcceptableOrUnknown(
              data['fecha_ajuste']!, _fechaAjusteMeta));
    }
    if (data.containsKey('id_usuario')) {
      context.handle(_idUsuarioMeta,
          idUsuario.isAcceptableOrUnknown(data['id_usuario']!, _idUsuarioMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idFigura};
  @override
  Figura map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Figura.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $FigurasTable createAlias(String alias) {
    return $FigurasTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UsuariosTable usuarios = $UsuariosTable(this);
  late final $JuegosTable juegos = $JuegosTable(this);
  late final $JuegosPromocionesTable juegosPromociones =
      $JuegosPromocionesTable(this);
  late final $SincronizadosTable sincronizados = $SincronizadosTable(this);
  late final $ConfiguracionesTable configuraciones =
      $ConfiguracionesTable(this);
  late final $FigurasTable figuras = $FigurasTable(this);
  late final ConfiguracionesDao configuracionesDao =
      ConfiguracionesDao(this as AppDatabase);
  late final JuegosDao juegosDao = JuegosDao(this as AppDatabase);
  late final JuegosPromocionesDao juegosPromocionesDao =
      JuegosPromocionesDao(this as AppDatabase);
  late final SincronizadosDao sincronizadosDao =
      SincronizadosDao(this as AppDatabase);
  late final UsuariosDao usuariosDao = UsuariosDao(this as AppDatabase);
  late final FigurasDao figurasDao = FigurasDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        usuarios,
        juegos,
        juegosPromociones,
        sincronizados,
        configuraciones,
        figuras
      ];
}
