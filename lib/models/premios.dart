/*class Premiosd extends Table {
  IntColumn get idPremio => integer().autoIncrement()();
  IntColumn get idProgramacionJuego => integer()();
  IntColumn get idPlenoAutomatico => integer()();
  TextColumn get nombre => text()();
  TextColumn get posiciones => text().withLength(min: 20, max: 25)();
  TextColumn get estado => text().withDefault(const Constant('A'))();
  RealColumn get valorPremio => real()();
  DateTimeColumn get actualizado => dateTime().nullable()();
  TextColumn get acumula => text().nullable()();
  DateTimeColumn get fechaAjuste => dateTime().nullable()();
  IntColumn get idUsuario => integer().nullable()();
}
*/
