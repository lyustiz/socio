import 'package:socio/utils/db/db_manager.dart';
import 'package:drift/drift.dart';
import 'package:socio/models/figuras.dart'
    hide $FigurasTable, Figura, AppDatabase, FigurasCompanion;

part 'figuras_dao.g.dart';

@DriftAccessor(tables: [Figuras])
class FigurasDao extends DatabaseAccessor<AppDatabase> with _$FigurasDaoMixin {
  FigurasDao(AppDatabase db) : super(db);

  Future<Figura> selectFigura(int idFigura) async {
    return (select(figuras)..where((t) => t.idFigura.equals(idFigura)))
        .getSingle();
  }

  Future<List<Figura>> selectFiguras(int idProgramacionJuego) async {
    return (select(figuras)
          ..where((t) => t.idProgramacionJuego.equals(idProgramacionJuego)))
        .get();
  }

  Future<int> insertFigura(Figura figura) async {
    return into(figuras).insert(figura);
  }

  Future<int> upsertFigura(Figura figura) async {
    return into(figuras).insertOnConflictUpdate(figura);
  }

  Future deleteFigurasInactivas(
      List<int> idsPremiosActivos, int idProgramacionJuego) async {
    delete(figuras).where((t) =>
        t.idFigura.isNotIn(idsPremiosActivos) &
        t.idProgramacionJuego.equals(idProgramacionJuego));
  }
}
