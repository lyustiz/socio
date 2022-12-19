import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/json_serializer.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/utils/db/db_init.dart';

class SincronizarRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};

  Future<bool> sincronizarJuego() async {
    data = await api.getData('juegosconfiguracion', {});
    DateTime actualizado = DateTime.now();

    if (data['isSuccess']) {
      List dataJuegos = data['data'];
      List<Juego> juegosList = [];
      List<int> juegosIds = [];
      List<int> configuracionIds = [];

      for (var juego in dataJuegos) {
        juegosIds.add(juego['idProgramacionJuego']);
        juego['actualizado'] = actualizado.toString();
        juegosList
            .add(Juego.fromJson(juego, serializer: const JsonSerializer()));

        if (juego['configuracion'] != null) {
          bool confUpd = await sincronizarConfiguracion(juego['configuracion'],
              juego['idProgramacionJuego'], actualizado);
          if (confUpd) {
            configuracionIds.add(juego['configuracion']['idConfiguracion']);
          }
        }

        /* if ((juego['premios'] as List).isNotEmpty) {
          sincronizarFiguras(
              juego['premios'], juego['idProgramacionJuego'], actualizado);
        }*/
      }

      for (var juego in juegosList) {
        db<AppDatabase>().juegosDao.upsertJuego(juego);
      }

      // terminar los juegos que no esten en los datos -- pendiente eliminar
      db<AppDatabase>().juegosDao.eliminarJuegos(juegosIds);
      db<AppDatabase>()
          .configuracionesDao
          .cancelarConfiguraciones(configuracionIds);

      if (juegosList.isNotEmpty) {
        await updateSincronizados('juegos', actualizado: actualizado);
      }
    }

    return data['isSuccess'];
  }

  Future<bool> sincronizarFiguras(List juegosFiguraJson,
      int idProgramacionJuego, DateTime actualizado) async {
    List<Figura> juegosFigurasList = [];
    List<int> idFigurasActivas = [];

    for (var juegoFigura in juegosFiguraJson) {
      juegoFigura['idFigura'] = juegoFigura['idFigura'];
      juegoFigura['idProgramacionJuego'] = idProgramacionJuego;
      juegoFigura['actualizado'] = actualizado.toString();
      juegosFigurasList
          .add(Figura.fromJson(juegoFigura, serializer: JsonSerializer()));
    }

    for (var figura in juegosFigurasList) {
      idFigurasActivas.add(figura.idFigura);
      db<AppDatabase>().figurasDao.upsertFigura(figura);
    }

    if (juegosFigurasList.isNotEmpty) {
      await updateSincronizados('figuras', actualizado: actualizado);

      await db<AppDatabase>()
          .figurasDao
          .deleteFigurasInactivas(idFigurasActivas, idProgramacionJuego);
    }

    return true;
  }

  Future<bool> sincronizarConfiguracion(Map<String, dynamic> configuracionJson,
      int idProgramacionJuego, DateTime actualizado) async {
    if (configuracionJson['idConfiguracion'] == 0) {
      return false;
    }
    configuracionJson['idProgramacionJuego'] = idProgramacionJuego;
    configuracionJson['idUsuario'] = configuracionJson['idUsuario'] ?? 0;
    configuracionJson['actualizado'] = actualizado.toString();
    db<AppDatabase>().configuracionesDao.upsertConfiguracion(
        Configuracion.fromJson(configuracionJson,
            serializer: const JsonSerializer()));

    // todo single update
    if (configuracionJson.isNotEmpty) {
      await updateSincronizados('configuracion', actualizado: actualizado);
    }

    return true;
  }

  Future<bool> sincronizarPromociones(
      List juegosPromocionesJson, int idJuego, DateTime actualizado) async {
    List<JuegoPromocion> juegosPromocionList = [];

    for (var juegoPromocion in juegosPromocionesJson) {
      juegoPromocion['actualizado'] = actualizado.toString();
      juegosPromocionList.add(JuegoPromocion.fromJson(juegoPromocion,
          serializer: JsonSerializer()));
    }

    for (var juegoPromocionC in juegosPromocionList) {
      db<AppDatabase>()
          .juegosPromocionesDao
          .upsertJuegoPromocion(juegoPromocionC);
    }

    if (juegosPromocionList.isNotEmpty) {
      await updateSincronizados('promociones', actualizado: actualizado);
    }
    return true;
  }

  Future<List<Sincronizado>> getAllSincronizados() async {
    return db<AppDatabase>().sincronizadosDao.allSincronizados();
  }

  Future<int> updateSincronizados(String tabla, {DateTime? actualizado}) async {
    actualizado = (actualizado == null) ? DateTime.now() : actualizado;
    return db<AppDatabase>()
        .sincronizadosDao
        .setSincronizado(tabla, actualizado);
  }

  Future<int> inicializarSincronizacion() async {
    return db<AppDatabase>().sincronizadosDao.inicializarSincronizacion();
  }
}
