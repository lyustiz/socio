import 'package:drift/drift.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/models/configuraciones.dart'
    hide
        $ConfiguracionesTable,
        Configuracion,
        AppDatabase,
        ConfiguracionesCompanion;

part 'configuraciones_dao.g.dart';

@DriftAccessor(tables: [Configuraciones])
class ConfiguracionesDao extends DatabaseAccessor<AppDatabase>
    with _$ConfiguracionesDaoMixin {
  ConfiguracionesDao(AppDatabase db) : super(db);

  Future<Configuracion> selectConfiguracion(Configuracion configuracion) async {
    return (select(configuraciones)
          ..where(
              (t) => t.idConfiguracion.equals(configuracion.idConfiguracion)))
        .getSingle();
  }

  Future<int> insertConfiguracion(Configuracion configuracion) async {
    return await into(configuraciones).insert(configuracion);
  }

  Future<bool> updateConfiguracion(Configuracion configuracion) async {
    return await update(configuraciones).replace(configuracion);
  }

  Future<int> upsertConfiguracion(Configuracion configuracion) async {
    return await into(configuraciones).insertOnConflictUpdate(configuracion);
  }

  Future<int> deleteConfiguracion(Configuracion configuracion) async {
    return delete(configuraciones).delete(configuracion);
  }
}
