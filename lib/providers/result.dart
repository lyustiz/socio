import 'package:socio/utils/db/db_manager.dart';

class Result {
  final bool isLogged;
  final bool isSync;
  final String? message;
  final Usuario? usuario;
  Result(
      {required this.isLogged,
      required this.isSync,
      this.message,
      this.usuario});
}
