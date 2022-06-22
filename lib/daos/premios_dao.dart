/*import 'package:socio/utils/db/db_manager.dart';
import 'package:drift/drift.dart';
import 'package:socio/models/premios.dart'
    hide $PremiosTable, Premio, AppDatabase, PremiosCompanion;

part 'premios_dao.g.dart';

@DriftAccessor(tables: [Premios])
class PremiosDao extends DatabaseAccessor<AppDatabase> with _$PremiosDaoMixin {
  PremiosDao(AppDatabase db) : super(db);

  Future<Premio> selectPremio(int idPremio) async {
    return (select(premios)..where((t) => t.idPremio.equals(idPremio)))
        .getSingle();
  }

  Future<int> upsertPremio(Premio premio) async {
    return into(premios).insertOnConflictUpdate(premio);
  }

  Future deletePremiosInactivos(
      List<int> idsPremiosActivos, int idProgramacionJuego) async {
    delete(premios).where((t) =>
        t.idPremio.isNotIn(idsPremiosActivos) &
        t.idProgramacionJuego.equals(idProgramacionJuego));
  }
}
*/