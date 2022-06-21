import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/juego_detalle_dto.dart';

class JuegoDetalleRepository {
  Api api = Api();

  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<JuegosWithDetalles?> getJuegoWithDetalles(
      {required int idJuego}) async {
    var params = {'idJuego': '$idJuego'};

    try {
      result = await api.getData('juegodetalle/$idJuego', params);
    } catch (e) {
      return null;
    }

    JuegosWithDetalles? juegosWithDetalles;

    if (result['isSuccess']) {
      JuegoDetalleDto juegoDTO = JuegoDetalleDto.fromJson(result['data']);
      juegosWithDetalles = JuegoDetalleDto.toJuegosWithDetalles(juegoDTO);
    }

    return juegosWithDetalles;
  }
}
