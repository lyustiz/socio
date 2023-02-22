import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socio/providers/custom_exeption.dart';
import 'package:socio/repository/preferences_repository_impl.dart';
import 'package:socio/utils/db/json_serializer.dart';

class Api {
  final String prefix;

  late String baseUrl;
  late Uri url;
  http.Response? response;
  bool isSucess = false;
  var data;
  int timeOut = 30;

  Map<String, String> headers = {
    'Authorization': '',
    "Content-type": "application/json"
  };

  Api(
      {this.baseUrl = 'apidesarrollo.sistemasyayudas.online',
      this.prefix = '/api/v1/'});

  Future<Map<String, dynamic>> getData(
      String endPoint, Map<String, dynamic>? params) async {
    baseUrl = await getBaseUrl();
    url = Uri.https(baseUrl, prefix + endPoint, params);

    headers['Authorization'] = '${await getToken()}';

    response = await http
        .get(url, headers: headers)
        .timeout(Duration(seconds: timeOut))
        .catchError((e) {
      errorHandler(e);
    });

    return decodeResponse(response);
  }

  Future<Map<String, dynamic>> postData(String endPoint,
      {Map<String, dynamic>? params, bool isAuth = false}) async {
    baseUrl = await getBaseUrl();
    url = Uri.https(baseUrl, prefix + endPoint);
    if (!isAuth) {
      headers['Authorization'] = '${await getToken()}';
    }

    var body = convert.jsonEncode(params);

    response = await http
        .post(url, body: body, headers: headers)
        .timeout(Duration(seconds: timeOut))
        .catchError((e) {
      errorHandler(e);
    });

    await setToken(response, isAuth);

    return decodeResponse(response);
  }

  Future<Map<String, dynamic>> putData(
      String endPoint, Map<String, dynamic> params) async {
    baseUrl = await getBaseUrl();
    url = Uri.https(baseUrl, prefix + endPoint);

    headers['Authorization'] = '${await getToken()}';

    var body = convert.jsonEncode(params);

    response = await http
        .put(url, body: body, headers: headers)
        .timeout(Duration(seconds: timeOut))
        .catchError((e) {
      errorHandler(e);
    });

    return decodeResponse(response);
  }

  Future<Map<String, dynamic>> deleteData(
      String endPoint, Map<String, dynamic> params) async {
    baseUrl = await getBaseUrl();
    url = Uri.https(baseUrl, endPoint);

    headers['Authorization'] = '${await getToken()}';

    response = await http
        .delete(url, headers: headers)
        .timeout(Duration(seconds: timeOut))
        .catchError((e) {
      errorHandler(e);
    });

    return decodeResponse(response);
  }

  Map<String, dynamic> decodeResponse(http.Response? response) {
    if (response is http.Response) {
      if (response.statusCode == 200) {
        data = convert.jsonDecode(response.body);
        isSucess = true;
      } else {
        isSucess = false;
        data = {
          'code': response.statusCode,
          'message': errorMessage(response.statusCode, response.body),
          'body':
              (response.body == '') ? null : convert.jsonDecode(response.body)
        };
      }
    }

    return {'isSuccess': isSucess, 'data': data};
  }

  String errorMessage(int codeError, String body) {
    Map<int, String> messages = {
      401: 'Credenciales Invalidas',
      403: 'No autorizado',
      404: 'No encontrado',
      500: 'Problemas en el servidor'
    };

    if (codeError == 409) {
      var data = convert.jsonDecode(body);
      return data['message'] ?? data['mensaje'];
    }

    return messages[codeError] ?? 'Error $codeError';
  }

  void errorHandler(var e) {
    if (e is StateError) throw Exception(StateError);
    if (e is SocketException) {
      throw Exception(e.osError);
      //  FetchDataException('Sin Conexion a Internet');
    }
    if (e is TimeoutException) {
      throw FetchDataException('Tiempo de conexion excedido');
    }
    throw FetchDataException('Error en conexion');
  }

  Future<bool> setToken(http.Response? response, bool isAuth) async {
    if (response is http.Response) {
      if ((response.statusCode == 200) & (isAuth)) {
        String token = 'Bearer ${response.headers['authorization']}';
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
      }
    }

    return true;
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final String? token = await prefs.getString('token');
    return token;
  }

  Future<String> getBaseUrl() async {
    PreferenceRepositoryImpl rep = PreferenceRepositoryImpl();
    return await rep.getEndPoint();
  }

  Future<bool> checkConnect() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}

class ResultApi {
  final bool success;
  final String message;
  ResultApi({required this.success, this.message = '0'});
}
