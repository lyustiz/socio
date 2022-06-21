import 'package:get_it/get_it.dart';
import 'package:socio/utils/db/db_manager.dart';

GetIt db = GetIt.instance;

Future dbLocator() async {
  db.registerSingleton<AppDatabase>(AppDatabase());
  return true;
}
