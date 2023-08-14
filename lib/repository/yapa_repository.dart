import 'package:socio/providers/dto/Yapa_dto.dart';
import 'package:socio/providers/api.dart';

class YapaRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  Map<String, dynamic> result = {'isSuccess': false, 'data': null};
  Map<String, dynamic> respond = {'': ''};
  Future<List<YapaDto>> getYapas({required int idProgramacionJuego}) async {
    var params = {'idProgramacionJuego': '$idProgramacionJuego'};

    try {
      result = await api.getData('yapa', params);
    } catch (e) {
      return [];
    }

    List<YapaDto> listYapas = [];

    if (result['isSuccess']) {
      for (var jsonfig in result['data']) {
        listYapas.add(YapaDto.fromJson(jsonfig));
      }
    }

    return listYapas;
  }

  Future<ResultApi> insertYapa(YapaDto yapaDto) async {
    try {
      data = await api.postData('yapa', params: yapaDto.toJson());
    } catch (e) {
      return ResultApi(success: false, message: 'Error al insertar yapa');
    }
    respond = data['data'];
    if (data['isSuccess']) {
      return ResultApi(success: true, message: respond['message']);
    } else {
      return ResultApi(success: false, message: respond['message']);
    }
  }

  Future<ResultApi> updateYapa(YapaDto yapaDto) async {
    try {
      data = await api.putData('yapa', yapaDto.toJson());
    } catch (e) {
      return ResultApi(success: false, message: 'Error al actulizar yapa');
    }

    respond = data['data'];
    if (data['isSuccess']) {
      return ResultApi(success: true, message: respond['message']);
    } else {
      return ResultApi(success: false, message: 'Error al crear yapa');
    }
  }

  Future<ResultApi> deleteYapa(YapaDto yapaDto) async {
    try {
      data = await api.deleteData('yapa', yapaDto.toJson());
    } catch (e) {
      return ResultApi(success: false, message: 'Error al eliminar yapa');
    }

    if (data['isSuccess']) {
      respond = data['data'];
      return ResultApi(success: true, message: respond['message']);
    } else {
      return ResultApi(success: false, message: 'Error al eliminar yapa');
    }
  }
}
