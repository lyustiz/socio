import 'package:socio/utils/db/db_manager.dart';
import 'package:drift/drift.dart';
import 'package:socio/models/sincronizados.dart'
    hide $SincronizadosTable, Sincronizado, AppDatabase, SincronizadosCompanion;

part 'sincronizados_dao.g.dart';

@DriftAccessor(tables: [Sincronizados])
class SincronizadosDao extends DatabaseAccessor<AppDatabase>
    with _$SincronizadosDaoMixin {
  SincronizadosDao(AppDatabase db) : super(db);

  Future<List<Sincronizado>> allSincronizados() async {
    return select(sincronizados).get();
  }

  Future<int> setSincronizado(String tabla, DateTime actualizado) async {
    return (update(sincronizados)..where((t) => t.tabla.equals(tabla))).write(
        SincronizadosCompanion(
            fechaSincronizado: Value(actualizado), isSync: Value(true)));
  }

  Future<int> setNoSincronizado(String tabla, DateTime actualizado) async {
    return (update(sincronizados)..where((t) => t.tabla.equals(tabla))).write(
        SincronizadosCompanion(
            fechaSincronizado: Value(actualizado), isSync: Value(false)));
  }

  Future<int> inicializarSincronizacion() async {
    DateTime actualizado = DateTime.now();
    return (update(sincronizados)
          ..where((t) => t.estado.equals('A'))
          ..where((t) => t.tabla.isNotIn(['usuario'])))
        .write(SincronizadosCompanion(
            fechaSincronizado: Value(actualizado), isSync: Value(false)));
  }
}
