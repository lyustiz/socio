import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/db/db_init.dart';

class PromocionRepository {
  Future<JuegoPromocion> selectJuegoPromocion(JuegoPromocion promocion) async {
    return db<AppDatabase>()
        .juegosPromocionesDao
        .selectJuegoPromocion(promocion);
  }

  Stream<JuegoPromocion> watchJuegoPromocion(JuegoPromocion promocion) {
    return db<AppDatabase>()
        .juegosPromocionesDao
        .watchJuegoPromocion(promocion);
  }

  Future<List<JuegoPromocion>> allJuegoPromocion(
      int idProgramacionJuego) async {
    return db<AppDatabase>()
        .juegosPromocionesDao
        .allJuegoPromocion(idProgramacionJuego);
  }

  Future<int> insertJuegoPromocion(JuegoPromocion promocion) async {
    return db<AppDatabase>()
        .juegosPromocionesDao
        .insertJuegoPromocion(promocion);
  }

  Future<bool> updateJuegoPromocion(JuegoPromocion promocion) async {
    return db<AppDatabase>()
        .juegosPromocionesDao
        .updateJuegoPromocion(promocion);
  }
}
