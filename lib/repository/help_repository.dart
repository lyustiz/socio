import 'package:socio/utils/db/db_manager.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;

class HelpRepository extends AppDatabase {
  Future<List> getHelpFile() async {
    String response = await rootBundle.loadString('assets/json/ayuda.json');
    return await convert.jsonDecode(response);
  }

  Future<Help> selectHelp(String screen) async {
    List json = await getHelpFile();
    Map helpJson = json.firstWhere((hlp) => hlp['pantalla'] == screen) ?? Map;
    return Help.fromJson(helpJson);
  }
}
