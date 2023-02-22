import 'package:drift/drift.dart';

part 'figuras.g.dart';

@DataClassName("Figura")
class Figuras extends Table {
  IntColumn get idFigura => integer().autoIncrement()();
  IntColumn get idProgramacionJuego => integer()();
  IntColumn get idPlenoAutomatico => integer()();
  TextColumn get nombre => text()();
  TextColumn get posiciones => text().withLength(min: 20, max: 25)();
  TextColumn get estado => text().withDefault(const Constant('A'))();
  RealColumn get valorPremio => real()();
  DateTimeColumn get actualizado => dateTime().nullable()();
  TextColumn get acumula => text().nullable()();
  TextColumn get multiple => text().nullable()();
  IntColumn get carton => integer()();
  DateTimeColumn get fechaAjuste => dateTime().nullable()();
  IntColumn get idUsuario => integer().nullable()();
}

@DriftDatabase(tables: [Figuras])
class AppDatabase {}
