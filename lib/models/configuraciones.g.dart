// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuraciones.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
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
      required this.reconfigurado});
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
          bool? reconfigurado}) =>
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
          ..write('reconfigurado: $reconfigurado')
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
      reconfigurado);
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
          other.reconfigurado == this.reconfigurado);
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
      Value<bool>? reconfigurado}) {
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
          ..write('reconfigurado: $reconfigurado')
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
        reconfigurado
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ConfiguracionesTable configuraciones =
      $ConfiguracionesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [configuraciones];
}
