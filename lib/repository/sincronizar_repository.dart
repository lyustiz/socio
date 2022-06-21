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

      for (var juego in dataJuegos) {
        juegosIds.add(juego['idProgramacionJuego']);
        juego['actualizado'] = actualizado.toString();
        juegosList
            .add(Juego.fromJson(juego, serializer: const JsonSerializer()));

        if (juego['configuracion'] != null) {
          sincronizarConfiguracion(juego['configuracion'],
              juego['idProgramacionJuego'], actualizado);
        }

        if ((juego['premios'] as List).isNotEmpty) {
          sincronizarPremios(
              juego['premios'], juego['idProgramacionJuego'], actualizado);
        }
      }

      for (var juego in juegosList) {
        db<AppDatabase>().juegosDao.upsertJuego(juego);
      }

      // terminar los juegos que no esten en los datos -- pendiente eliminar
      db<AppDatabase>().juegosDao.cancelarJuegos(juegosIds);

      if (juegosList.isNotEmpty) {
        await updateSincronizados('juegos', actualizado: actualizado);
      }
    }

    return data['isSuccess'];
  }

  Future<bool> sincronizarPremios(List juegosPremiosJson,
      int idProgramacionJuego, DateTime actualizado) async {
    List<Premio> juegosPremiosList = [];
    List<int> idPremiosActivos = [];

    for (var juegoPremio in juegosPremiosJson) {
      juegoPremio['idPremio'] = juegoPremio['idFigura'];
      juegoPremio['idProgramacionJuego'] = idProgramacionJuego;
      juegoPremio['actualizado'] = actualizado.toString();
      juegosPremiosList
          .add(Premio.fromJson(juegoPremio, serializer: JsonSerializer()));
    }

    for (var premio in juegosPremiosList) {
      idPremiosActivos.add(premio.idPremio);
      db<AppDatabase>().premiosDao.upsertPremio(premio);
    }

    if (juegosPremiosList.isNotEmpty) {
      await updateSincronizados('premios', actualizado: actualizado);

      await db<AppDatabase>()
          .premiosDao
          .deletePremiosInactivos(idPremiosActivos, idProgramacionJuego);
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
}
