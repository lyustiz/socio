// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sincronizados.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $SincronizadosTable sincronizados = $SincronizadosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [sincronizados];
}
