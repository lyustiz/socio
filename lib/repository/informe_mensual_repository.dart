import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/informe_mensual_dto.dart';

class InformeMensualRepository {
  Api api = Api();

  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<InformeMensualDto?> getInformeMensual(
      {required int anio, required int mes}) async {
    var params = {'Anio ': '$anio', 'Mes ': '$mes'};

    try {
      result = await api.getData('informemensualcaja', params);
    } catch (e) {
      return null;
    }

    InformeMensualDto? informeDto;

    if (result['isSuccess']) {
      informeDto = InformeMensualDto.fromJson(result['data']);
    }

    return informeDto;
  }
}
