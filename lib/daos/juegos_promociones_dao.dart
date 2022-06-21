import 'package:socio/utils/db/db_manager.dart';
import 'package:drift/drift.dart';
import 'package:socio/models/juegos_promociones.dart'
    hide
        $JuegosPromocionesTable,
        JuegoPromocion,
        AppDatabase,
        JuegosPromocionesCompanion;

part 'juegos_promociones_dao.g.dart';

@DriftAccessor(tables: [JuegosPromociones])
class JuegosPromocionesDao extends DatabaseAccessor<AppDatabase>
    with _$JuegosPromocionesDaoMixin {
  JuegosPromocionesDao(AppDatabase db) : super(db);

  Future<JuegoPromocion> selectJuegoPromocion(JuegoPromocion promocion) async {
    return (select(juegosPromociones)
          ..where((t) => t.idJuegoPromocion.equals(promocion.idJuegoPromocion)))
        .getSingle();
  }

  Stream<JuegoPromocion> watchJuegoPromocion(JuegoPromocion promocion) {
    return (select(juegosPromociones)
          ..where((t) => t.idJuegoPromocion.equals(promocion.idJuegoPromocion)))
        .watchSingle();
  }

  Future<List<JuegoPromocion>> allJuegoPromocion(
      int idProgramacionJuego) async {
    return (select(juegosPromociones)
          ..where((t) => t.idProgramacionJuego.equals(idProgramacionJuego)))
        .get();
  }

  Future<int> insertJuegoPromocion(JuegoPromocion promocion) async {
    return into(juegosPromociones).insert(promocion);
  }

  Future<bool> updateJuegoPromocion(JuegoPromocion promocion) async {
    return update(juegosPromociones).replace(promocion);
  }

  Future<int> upsertJuegoPromocion(JuegoPromocion juegoPromocion) async {
    return into(juegosPromociones).insert(
      juegoPromocion,
      onConflict: DoUpdate((old) => juegoPromocion,
          target: [juegosPromociones.idPromocion]),
    );
  }
}
