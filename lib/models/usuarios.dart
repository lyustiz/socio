import 'package:drift/drift.dart';

part 'usuarios.g.dart';

@DataClassName("Usuario")
class Usuarios extends Table {
  IntColumn get idUsuario => integer().autoIncrement()();
  IntColumn get codigo => integer()();
  TextColumn get nombres => text()();
  TextColumn get apellidos => text()();
  TextColumn get documento => text()();
  TextColumn get celular => text()();
  TextColumn get password => text().nullable()();
  TextColumn get isAdmin => text()();
  TextColumn get estado => text()();
  DateTimeColumn get fechaCreacion => dateTime()();
  DateTimeColumn get fechaIngreso => dateTime().withDefault(currentDate)();
  DateTimeColumn get actualizado => dateTime().nullable()();
}

@DriftDatabase(tables: [Usuarios])
class AppDatabase {}
