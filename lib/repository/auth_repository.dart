import 'package:socio/providers/result.dart';
import 'package:socio/repository/sincronizar_repository.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/utils/db/json_serializer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socio/utils/crypt_helper.dart' as crypt;
import 'package:socio/utils/db/db_init.dart';

class AuthRepository {
  SincronizarRepository syncRep = SincronizarRepository();

  Future<Result> login(
      {required String celular, required String password}) async {
    // inicializa db
    final Usuario? usuario =
        await db<AppDatabase>().usuariosDao.selectUsuario();
    final DateTime today =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    // no existe data de usuario
    if (usuario is! Usuario) {
      var apilogin = await apiLogin(celular: celular, password: password);
      return Result(
          isLogged: apilogin.isLogged,
          isSync: false,
          message: apilogin.message,
          usuario: apilogin.usuario);
    }

    // usuario diferente al almacenado en la APP
    if (usuario.celular != celular) {
      var apilogin = await apiLogin(celular: celular, password: password);
      if (apilogin.isLogged) {
        await db<AppDatabase>().clearDatabase();
      }
      return Result(
          isLogged: apilogin.isLogged,
          isSync: false,
          message: apilogin.message,
          usuario: apilogin.usuario);
    }

    // logueado un dia anterior
    if (usuario.fechaIngreso.isAfter(today)) {
      var apilogin = await apiLogin(celular: celular, password: password);
      return Result(
          isLogged: apilogin.isLogged,
          isSync: false,
          message: apilogin.message,
          usuario: apilogin.usuario);
    }

    // login standart
    if ((usuario.celular == celular) & (usuario.password == password)) {
      return Result(isLogged: true, isSync: true, usuario: usuario);
    }

    return Result(
        isLogged: false, isSync: false, message: 'Usuario o password Invalido');
  }

  Future<Result> apiLogin(
      {required String celular,
      required String password,
      bool usuarioExiste = false,
      String tipoUsuario = 'S'}) async {
    Api api = Api();

    var params = {
      'usuario': celular,
      'password': crypt.encryp(password),
      'tipoUsuario': tipoUsuario
    };

    var result =
        await api.postData('login/authenticate', params: params, isAuth: true);

    if (result['isSuccess']) {
      Map<String, dynamic> userdata = result['data'];
      userdata['celular'] = '0';
      userdata['password'] = password;
      userdata['fechaIngreso'] = userdata['actualizado'];
      userdata['apellidos'] = '';
      userdata['documento'] = '0';

      Usuario usuario =
          Usuario.fromJson(userdata, serializer: const JsonSerializer());

      await db<AppDatabase>().usuariosDao.upsertUsuario(usuario);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('idUsuario', usuario.idUsuario);
      await prefs.setString(
          'nombre', '${usuario.nombres} ${usuario.apellidos}');
      return Result(isLogged: true, isSync: false, usuario: usuario);
    }

    return Result(
        isLogged: false,
        isSync: false,
        message:
            (result['data'] == null) ? 'error' : result['data']["message"]);
  }
}

Future<bool> logout() async {
  return true;
}
