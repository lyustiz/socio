// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juegos.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
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
  final String cartonesAleatorios;
  final String cartonesEnJuego;
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
      this.actualizado,
      required this.cartonesAleatorios,
      required this.cartonesEnJuego});
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
      cartonesAleatorios: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}cartones_aleatorios'])!,
      cartonesEnJuego: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}cartones_en_juego'])!,
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
    map['cartones_aleatorios'] = Variable<String>(cartonesAleatorios);
    map['cartones_en_juego'] = Variable<String>(cartonesEnJuego);
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
      cartonesAleatorios: Value(cartonesAleatorios),
      cartonesEnJuego: Value(cartonesEnJuego),
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
      cartonesAleatorios:
          serializer.fromJson<String>(json['cartonesAleatorios']),
      cartonesEnJuego: serializer.fromJson<String>(json['cartonesEnJuego']),
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
      'cartonesAleatorios': serializer.toJson<String>(cartonesAleatorios),
      'cartonesEnJuego': serializer.toJson<String>(cartonesEnJuego),
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
          DateTime? actualizado,
          String? cartonesAleatorios,
          String? cartonesEnJuego}) =>
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
        cartonesAleatorios: cartonesAleatorios ?? this.cartonesAleatorios,
        cartonesEnJuego: cartonesEnJuego ?? this.cartonesEnJuego,
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
          ..write('actualizado: $actualizado, ')
          ..write('cartonesAleatorios: $cartonesAleatorios, ')
          ..write('cartonesEnJuego: $cartonesEnJuego')
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
        actualizado,
        cartonesAleatorios,
        cartonesEnJuego
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
          other.actualizado == this.actualizado &&
          other.cartonesAleatorios == this.cartonesAleatorios &&
          other.cartonesEnJuego == this.cartonesEnJuego);
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
  final Value<String> cartonesAleatorios;
  final Value<String> cartonesEnJuego;
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
    this.cartonesAleatorios = const Value.absent(),
    this.cartonesEnJuego = const Value.absent(),
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
    required String cartonesAleatorios,
    required String cartonesEnJuego,
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
        estado = Value(estado),
        cartonesAleatorios = Value(cartonesAleatorios),
        cartonesEnJuego = Value(cartonesEnJuego);
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
    Expression<String>? cartonesAleatorios,
    Expression<String>? cartonesEnJuego,
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
      if (cartonesAleatorios != null) 'cartones_aleatorios': cartonesAleatorios,
      if (cartonesEnJuego != null) 'cartones_en_juego': cartonesEnJuego,
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
      Value<DateTime?>? actualizado,
      Value<String>? cartonesAleatorios,
      Value<String>? cartonesEnJuego}) {
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
      cartonesAleatorios: cartonesAleatorios ?? this.cartonesAleatorios,
      cartonesEnJuego: cartonesEnJuego ?? this.cartonesEnJuego,
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
    if (cartonesAleatorios.present) {
      map['cartones_aleatorios'] = Variable<String>(cartonesAleatorios.value);
    }
    if (cartonesEnJuego.present) {
      map['cartones_en_juego'] = Variable<String>(cartonesEnJuego.value);
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
          ..write('actualizado: $actualizado, ')
          ..write('cartonesAleatorios: $cartonesAleatorios, ')
          ..write('cartonesEnJuego: $cartonesEnJuego')
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
  final VerificationMeta _cartonesAleatoriosMeta =
      const VerificationMeta('cartonesAleatorios');
  late final GeneratedColumn<String?> cartonesAleatorios =
      GeneratedColumn<String?>('cartones_aleatorios', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _cartonesEnJuegoMeta =
      const VerificationMeta('cartonesEnJuego');
  late final GeneratedColumn<String?> cartonesEnJuego =
      GeneratedColumn<String?>('cartones_en_juego', aliasedName, false,
          typeName: 'TEXT', requiredDuringInsert: true);
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
        actualizado,
        cartonesAleatorios,
        cartonesEnJuego
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
    if (data.containsKey('cartones_aleatorios')) {
      context.handle(
          _cartonesAleatoriosMeta,
          cartonesAleatorios.isAcceptableOrUnknown(
              data['cartones_aleatorios']!, _cartonesAleatoriosMeta));
    } else if (isInserting) {
      context.missing(_cartonesAleatoriosMeta);
    }
    if (data.containsKey('cartones_en_juego')) {
      context.handle(
          _cartonesEnJuegoMeta,
          cartonesEnJuego.isAcceptableOrUnknown(
              data['cartones_en_juego']!, _cartonesEnJuegoMeta));
    } else if (isInserting) {
      context.missing(_cartonesEnJuegoMeta);
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $JuegosTable juegos = $JuegosTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [juegos];
}
