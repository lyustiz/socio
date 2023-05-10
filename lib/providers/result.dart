import 'package:socio/utils/db/db_manager.dart';

class Result {
  final bool isOk;
  final bool isLogged;
  final bool isSync;
  final String? message;
  final Usuario? usuario;
  const Result(
      {required this.isOk,
      required this.isLogged,
      required this.isSync,
      this.message,
      this.usuario});
}
