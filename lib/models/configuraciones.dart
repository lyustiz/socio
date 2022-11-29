import 'package:drift/drift.dart';

part 'configuraciones.g.dart';

@DataClassName("Configuracion")
class Configuraciones extends Table {
  IntColumn get idConfiguracion => integer().autoIncrement()();
  IntColumn get idProgramacionJuego => integer()();
  IntColumn get carton => integer()();
  TextColumn get serie => text().nullable()();
  IntColumn get balotas => integer()();
  DateTimeColumn get fechaRegistro => dateTime().nullable()();
  IntColumn get idUsuario => integer()();
  TextColumn get estado => text().nullable()();
  DateTimeColumn get fechaModificacion => dateTime().nullable()();
  BoolColumn get reconfigurado => boolean()();
  TextColumn get clienteDefecto => text().nullable()();
}

@DriftDatabase(tables: [Configuraciones])
class AppDatabase {}
