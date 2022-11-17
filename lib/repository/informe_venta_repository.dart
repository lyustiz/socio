import 'package:socio/providers/api.dart';
import 'package:socio/providers/dto/informe_promedio_ventas_dto.dart';

class InformeVentaRepository {
  Api api = Api();

  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<InformePromedioVentasDto?> getInformeVentas(
      {required String fechaI, required String fechaF}) async {
    var params = {'FechaI': fechaI, 'FechaF': fechaF};

    InformePromedioVentasDto? informeDto;

    try {
      result = await api.getData('informepromedioventas', params);
    } catch (e) {
      return informeDto;
    }

    if (result['isSuccess']) {
      informeDto = InformePromedioVentasDto.fromJson(result['data']);
    }

    return informeDto;
  }
}
