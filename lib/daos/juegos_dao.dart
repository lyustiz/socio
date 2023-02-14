import 'package:socio/utils/db/db_manager.dart';
import 'package:drift/drift.dart';
import 'package:socio/models/juegos.dart'
    hide $JuegosTable, Juego, AppDatabase, JuegosCompanion;

part 'juegos_dao.g.dart';

@DriftAccessor(tables: [Juegos])
class JuegosDao extends DatabaseAccessor<AppDatabase> with _$JuegosDaoMixin {
  JuegosDao(AppDatabase db) : super(db);

  Future<Juego> selectJuego(Juego juego) async {
    return (select(juegos)
          ..where(
              (t) => t.idProgramacionJuego.equals(juego.idProgramacionJuego)))
        .getSingle();
  }

  Future<List<Juego>> allJuegos(String estado) async {
    estado = (['A', 'C'].contains(estado)) ? estado : '%';
    return (select(juegos)
          ..where((t) => t.estado.like('%$estado%'))
          ..orderBy([
            (t) => OrderingTerm(
                expression: t.idProgramacionJuego, mode: OrderingMode.desc)
          ]))
        .get();
  }

  Future<int> insertJuego(Juego juego) async {
    Juego insJuego = juego.copyWith(idProgramacionJuego: null);
    return into(juegos).insert(insJuego);
  }

  Future<bool> upateJuego(Juego juego) async {
    return update(juegos).replace(juego);
  }

  Future<int> upsertJuego(Juego juego) async {
    return into(juegos).insertOnConflictUpdate(juego);
  }

  Future cancelarJuegos(List<int> juegosIds) async {
    return (update(juegos)
          ..where((t) => t.idProgramacionJuego.isNotIn(juegosIds)))
        .write(JuegosCompanion(estado: Value('C')));
  }

  Future eliminarJuegos(List<int> juegosIds) async {
    return delete(juegos);
  }

  Future<int> deleteJuego(Juego juego) async {
    return delete(juegos).delete(juego);
  }
}
