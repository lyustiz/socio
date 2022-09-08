import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';
// models
import 'package:socio/models/usuarios.dart';
import 'package:socio/models/juegos.dart';
import 'package:socio/models/configuraciones.dart';
import 'package:socio/models/juegos_promociones.dart';
import 'package:socio/models/sincronizados.dart';
import 'package:socio/models/figuras.dart';
// daos
import 'package:socio/daos/configuraciones_dao.dart';
import 'package:socio/daos/juegos_dao.dart';
import 'package:socio/daos/juegos_promociones_dao.dart';
import 'package:socio/daos/sincronizados_dao.dart';
import 'package:socio/daos/usuarios_dao.dart';
import 'package:socio/daos/figuras_dao.dart';

part 'db_manager.g.dart';

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file, logStatements: true);
  });
}

@DriftDatabase(tables: [
  Usuarios,
  Juegos,
  JuegosPromociones,
  Sincronizados,
  Configuraciones,
  Figuras
], daos: [
  ConfiguracionesDao,
  JuegosDao,
  JuegosPromocionesDao,
  SincronizadosDao,
  UsuariosDao,
  FigurasDao
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(onCreate: (m) async {
        await m.createAll();
        final fechaInit = DateTime.parse("2021-12-01");
        await batch((batch) {
          batch.insertAll(sincronizados, [
            SincronizadosCompanion.insert(
                fechaSincronizado: fechaInit, tabla: 'juegos', estado: 'A'),
            SincronizadosCompanion.insert(
                fechaSincronizado: fechaInit, tabla: 'figuras', estado: 'A'),
            SincronizadosCompanion.insert(
                fechaSincronizado: fechaInit,
                tabla: 'configuracion',
                estado: 'A'),
          ]);
        });
      });

  Future<bool> clearDatabase() async {
    try {
      await delete(figuras).go();
      await delete(juegosPromociones).go();
      await delete(juegos).go();
      await delete(usuarios).go();
    } catch (e) {
      return false;
    }
    return true;
  }

  Future<List<JuegosWithPremios>> allJuegosWithPremios(String estado) async {
    estado = (['S', 'N'].contains(estado)) ? estado : '%';
    List rows = await (select(juegos)
          ..where((t) => t.estado.like('%$estado%'))
          ..orderBy(
            ([
              (t) => OrderingTerm(
                  expression: t.idProgramacionJuego, mode: OrderingMode.desc),
            ]),
          ))
        .join(
      [
        leftOuterJoin(figuras,
            figuras.idProgramacionJuego.equalsExp(juegos.idProgramacionJuego)),
      ],
    ).get();

    var result = rows.map((_) {
      final groupedFig = <Juego, List<Figura>>{};
      for (final row in rows) {
        final juego = row.readTable(juegos);
        final juegoFig = row.readTableOrNull(figuras);
        final listPrem = groupedFig.putIfAbsent(juego, () => []);
        if (juegoFig != null) listPrem.add(juegoFig);
      }
      return [
        for (final entry in groupedFig.entries)
          JuegosWithPremios(
            juego: entry.key,
            juegoPremio: entry.value,
          )
      ];
    });

    return (result.isNotEmpty) ? result.first.toList() : [];
  }

  Future<List<JuegosWithConfiguracion>> allJuegosWithConfiguracion(
      String estado) async {
    estado = (['S', 'N'].contains(estado)) ? estado : '%';
    List rows = await (select(juegos)
          ..where((t) => t.estado.like('%$estado%'))
          ..orderBy(
            ([
              (t) => OrderingTerm(
                  expression: t.idProgramacionJuego, mode: OrderingMode.desc),
            ]),
          ))
        .join(
      [
        leftOuterJoin(
            configuraciones,
            configuraciones.idProgramacionJuego
                .equalsExp(juegos.idProgramacionJuego)),
      ],
    ).get();

    var result = rows.map((_) {
      return [
        for (final row in rows)
          JuegosWithConfiguracion(
            juego: row.readTable(juegos),
            configuracion: row.readTableOrNull(configuraciones),
          )
      ];
    });

    return (result.isNotEmpty) ? result.first.toList() : [];
  }
}

class JuegosWithPremios {
  final Juego juego;
  final List<Figura> juegoPremio;

  JuegosWithPremios({
    required this.juego,
    required this.juegoPremio,
  });

  @override
  String toString() {
    return 'JuegosWithPremios $juego $juegoPremio';
  }
}

class JuegosWithConfiguracion {
  final Juego juego;
  final Configuracion? configuracion;

  JuegosWithConfiguracion({required this.juego, this.configuracion});

  JuegosWithConfiguracion copyWith(
          {Juego? juego, Configuracion? configuracion}) =>
      JuegosWithConfiguracion(
          juego: juego ?? this.juego,
          configuracion: configuracion ?? this.configuracion);

  @override
  String toString() {
    return 'JuegosWithPremios $juego $configuracion';
  }
}

class JuegosWithDetalles {
  final Juego juego;
  final int totalCartones;
  final int cartonesAsignados;
  final int cartonesVendidos;
  final int totalModulos;
  final int modulosAsignados;
  final int modulosVendidos;
  final int numeroVendedores;
  final List<Figura> premios;
  final Configuracion? configuracion;
  final List<ProgramacionJuego> programacionJuego;

  JuegosWithDetalles(
      {required this.juego,
      required this.totalCartones,
      required this.cartonesAsignados,
      required this.cartonesVendidos,
      required this.totalModulos,
      required this.modulosAsignados,
      required this.modulosVendidos,
      required this.numeroVendedores,
      required this.premios,
      this.configuracion,
      required this.programacionJuego});

  @override
  String toString() {
    return 'JuegosDetalles $juego $premios';
  }
}

class ProgramacionJuego {
  final int idProgramacionJuego;
  final String fechaProgramada;
  final int valorCarton;
  final int totalCartones;
  final int valorModulo;
  final int totalModulos;
  final int totalPremios;
  final int idSerie;
  final int cartonInicial;
  final int cartonFinal;
  final int hojaInicial;
  final int hojaFinal;
  final int resultadoFinal;
  final String estado;

  ProgramacionJuego(
      {required this.idProgramacionJuego,
      required this.fechaProgramada,
      required this.valorCarton,
      required this.totalCartones,
      required this.valorModulo,
      required this.totalModulos,
      required this.totalPremios,
      required this.idSerie,
      required this.cartonInicial,
      required this.cartonFinal,
      required this.hojaInicial,
      required this.hojaFinal,
      required this.resultadoFinal,
      required this.estado});
}

class Estadistica {
  final int idJuego;
  final int valorCarton;
  final int valorModulo;
  final int ventaCartones;
  final int totalCartones;
  final int totalVentaCartones;
  final int ventaModulos;
  final int totalModulos;
  final int totalVentaModulos;
  final int ventaPromocion;
  final int totalMontoVenta;

  Estadistica({
    required this.idJuego,
    required this.valorCarton,
    required this.valorModulo,
    required this.ventaCartones,
    required this.totalCartones,
    required this.totalVentaCartones,
    required this.ventaModulos,
    required this.totalModulos,
    required this.totalVentaModulos,
    required this.ventaPromocion,
    required this.totalMontoVenta,
  });

  @override
  String toString() {
    return 'Estadistica $Estadistica';
  }
}

class HelpItem {
  final String icono;
  final String tipo;
  final String titulo;
  final String texto;

  HelpItem({
    required this.icono,
    required this.tipo,
    required this.titulo,
    required this.texto,
  });

  factory HelpItem.fromJson(Map json) {
    return HelpItem(
        icono: json['icono'],
        tipo: json['tipo'],
        titulo: json['titulo'],
        texto: json['texto']);
  }
}

class Help {
  final String pantalla;
  final String texto;
  final List<HelpItem> items;

  Help({
    required this.pantalla,
    required this.texto,
    required this.items,
  });

  factory Help.fromJson(Map json) {
    List<HelpItem> items = [];
    List jsonItems = json['items'];

    for (var jsonItem in jsonItems) {
      items.add(HelpItem.fromJson(jsonItem));
    }

    return Help(pantalla: json['pantalla'], texto: json['texto'], items: items);
  }

  @override
  String toString() {
    return 'pantalla: $pantalla, texto: $texto, items: $items';
  }
}
