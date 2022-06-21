import 'package:drift/drift.dart';

part 'sincronizados.g.dart';

@DataClassName("Sincronizado")
class Sincronizados extends Table {
  IntColumn get idSincronizado => integer().autoIncrement()();
  DateTimeColumn get fechaSincronizado => dateTime()();
  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
  TextColumn get tabla => text()();
  TextColumn get estado => text()();
}

@DriftDatabase(tables: [Sincronizados])
class AppDatabase {}
