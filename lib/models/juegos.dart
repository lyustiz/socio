import 'package:drift/drift.dart';

part 'juegos.g.dart';

@DataClassName("Juego")
class Juegos extends Table {
  IntColumn get idProgramacionJuego => integer().autoIncrement()();
  IntColumn get idJuego => integer().nullable()();
  TextColumn get tipoJuego => text()();
  DateTimeColumn get fechaProgramada => dateTime()();
  IntColumn get moduloCartones => integer()();
  TextColumn get moneda => text()();
  RealColumn get valorCarton => real()();
  IntColumn get totalCartones => integer()();
  RealColumn get valorModulo => real()();
  IntColumn get totalModulos => integer()();
  RealColumn get totalPremios => real()();
  TextColumn get serie => text()();
  IntColumn get cartonInicial => integer()();
  IntColumn get cartonFinal => integer()();
  IntColumn get hojaInicial => integer()();
  IntColumn get hojaFinal => integer()();
  DateTimeColumn get horaCierre => dateTime()();
  IntColumn get previoCierre => integer()();
  TextColumn get permitirDevolucion => text()();
  TextColumn get estado => text()();
  DateTimeColumn get actualizado => dateTime().nullable()();
  TextColumn get cartonesAleatorios => text()();
  TextColumn get cartonesEnJuego => text()();

  String getNroJuego() {
    return '$idProgramacionJuego'.padLeft(3, '0');
  }
}

@DriftDatabase(tables: [Juegos])
class AppDatabase {}
