import 'package:drift/drift.dart';

part 'juegos_promociones.g.dart';

@DataClassName("JuegoPromocion")
class JuegosPromociones extends Table {
  IntColumn get idJuegoPromocion => integer().autoIncrement()();
  IntColumn get idProgramacionJuego => integer()();
  IntColumn get idPromocion => integer()();
  TextColumn get nombrePromocion => text()();
  RealColumn get valorPromocion => real().nullable()();
  IntColumn get nroCartones => integer()();
  TextColumn get estado => text().nullable()();
  DateTimeColumn get actualizado => dateTime().nullable()();
}

@DriftDatabase(tables: [JuegosPromociones])
class AppDatabase {}
