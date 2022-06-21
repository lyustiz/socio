// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juegos_promociones.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $JuegosPromocionesTable juegosPromociones =
      $JuegosPromocionesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [juegosPromociones];
}
