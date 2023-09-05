import 'package:socio/blocs/juego/juego_bloc.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/json_serializer.dart';
import 'package:socio/utils/db/db_init.dart';

class JuegoRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  Map<String, dynamic> result = {'isSuccess': false, 'data': null};
  Map<String, dynamic> respond = {'': ''};

  Future<List<JuegosWithConfiguracion>> getAllJuegos(String terminado) async {
    try {
      data = await api.getData('juegosconfiguracion', {});
    } catch (e) {
      return [];
    }

    DateTime actualizado = DateTime.now();
    List<JuegosWithConfiguracion> juegosList = [];

    if (data['isSuccess']) {
      List dataJuegos = data['data'];
      for (var juegoJ in dataJuegos) {
        Juego juego;
        Configuracion? configuracion;

        juegoJ['actualizado'] = actualizado.toString();
        juego = Juego.fromJson(juegoJ, serializer: const JsonSerializer());

        if (juegoJ['configuracion'] != null) {
          if (juegoJ['configuracion']['idConfiguracion'] != 0) {
            configuracion = await getConfiguracion(
              juegoJ['configuracion'],
              juegoJ['idProgramacionJuego'],
              actualizado,
            );
          }
        }

        juegosList.add(JuegosWithConfiguracion(
          juego: juego,
          configuracion: configuracion,
        ));
      }
    }
    return juegosList;
  }

  Future<JuegosWithConfiguracion> selectJuego(Juego juego, int IdJuego) async {
    // return db<AppDatabase>().juegosDao.selectJuego(juego);

    data = await api.getData('juegosconfiguracion/$IdJuego', {});
    DateTime actualizado = DateTime.now();

    if (data['isSuccess']) {
      Map<String, dynamic> dataJuego = data['data'];

      Juego juego;
      Configuracion? configuracion;

      dataJuego['actualizado'] = actualizado.toString();
      juego = Juego.fromJson(dataJuego, serializer: const JsonSerializer());

      if (dataJuego['configuracion'] != null) {
        if (dataJuego['configuracion']['idConfiguracion'] != 0) {
          configuracion = await getConfiguracion(
            dataJuego['configuracion'],
            dataJuego['idProgramacionJuego'],
            actualizado,
          );
        }
      }

      return JuegosWithConfiguracion(
        juego: juego,
        configuracion: configuracion,
      );
    }

    Juego juegoIni = Juego(
        idProgramacionJuego: 0,
        tipoJuego: '',
        fechaProgramada: DateTime.now(),
        moduloCartones: 0,
        moneda: '',
        valorCarton: 0,
        totalCartones: 0,
        valorModulo: 0,
        totalModulos: 0,
        totalPremios: 0,
        serie: '',
        cartonInicial: 0,
        cartonFinal: 0,
        hojaInicial: 0,
        hojaFinal: 0,
        horaCierre: DateTime.now(),
        previoCierre: 1,
        permitirDevolucion: '',
        estado: '',
        cartonesAleatorios: '',
        cartonesEnJuego: '');
    return JuegosWithConfiguracion(
      juego: juegoIni,
      configuracion: null,
    );
  }

  Future<Configuracion> getConfiguracion(
    Map<String, dynamic> configuracionJson,
    int idProgramacionJuego,
    DateTime actualizado,
  ) async {
    configuracionJson['idProgramacionJuego'] = idProgramacionJuego;
    configuracionJson['idUsuario'] = configuracionJson['idUsuario'] ?? 0;
    configuracionJson['actualizado'] = actualizado.toString();
    return Configuracion.fromJson(configuracionJson,
        serializer: const JsonSerializer());
  }

  Future<List<Juego>> allJuegos(String terminado) async {
    var juegos = await db<AppDatabase>().juegosDao.allJuegos(terminado);
    return juegos;
  }

  Future<bool> upateJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.upateJuego(juego);
  }

  Future<int> insertJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.insertJuego(juego);
  }

  Future<int> deleteJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.deleteJuego(juego);
  }

  Future<ResultApi> updateCartonesEnJuego(
      int idProgramacionJuego, String cartonesEnJuego) async {
    var paramsq = {
      'IdJuego': '$idProgramacionJuego',
      'CartonesEnJuego': cartonesEnJuego
    };

    try {
      data = await api.putData('juegos/cartonesenjuego', {}, paramsq: paramsq);
    } catch (e) {
      return ResultApi(
          success: false, message: 'Error al actualizar Crtones en Juego');
    }

    respond = data['data'];
    if (data['isSuccess']) {
      return ResultApi(success: true, message: respond['message']);
    } else {
      return ResultApi(success: false, message: respond['message']);
    }
  }
}
