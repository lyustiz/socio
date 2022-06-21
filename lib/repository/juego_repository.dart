import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/db_init.dart';

class JuegoRepository {
  Future<Juego> selectJuego(Juego juego) async {
    return db<AppDatabase>().juegosDao.selectJuego(juego);
  }

  Future<List<Juego>> allJuegos(String terminado) async {
    return db<AppDatabase>().juegosDao.allJuegos(terminado);
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
}
