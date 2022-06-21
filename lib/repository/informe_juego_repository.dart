import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/informe_juego_dto.dart';

class InformeJuegoRepository {
  Api api = Api();

  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<InformeJuegoDto?> getInformeJuego({required int idJuego}) async {
    var params = {'idJuego ': '$idJuego'};

    try {
      result = await api.getData('informejuego/$idJuego', params);
    } catch (e) {
      return null;
    }

    InformeJuegoDto? informeJuegoDto;

    if (result['isSuccess']) {
      informeJuegoDto = InformeJuegoDto.fromJson(result['data']);
    }

    return informeJuegoDto;
  }
}
