// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'figuras.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
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
  late final $FigurasTable figuras = $FigurasTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [figuras];
}
