import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/providers/dto/figura_dto.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/utils/db/db_init.dart';

class FiguraRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};
  Map<String, dynamic> result = {'isSuccess': false, 'data': null};

  Future<Figura> selectfigura(FiguraDto figura) async {
    return db<AppDatabase>().figurasDao.selectFigura(figura.idFigura);
  }

  Future<List<FiguraDto>> selectfiguras(int idProgramacionJuego) async {
    var params = {'IdProgramacionJuego': '$idProgramacionJuego'};

    try {
      result = await api.getData('figurasplenoautomatico', params);
    } catch (e) {
      return [];
    }

    List<FiguraDto> listFiguras = [];

    if (result['isSuccess'] && result['data'] != null) {
      for (var jsonfig in result['data']) {
        listFiguras.add(FiguraDto.fromJson(jsonfig));
      }
    }
    return listFiguras.where((figura) => figura.nombre != 'Lleno').toList();
  }

  Future<ResultApi> updateFigura(FiguraDto figura) async {
    FiguraDto figuraDto = figura;

    try {
      data = await api.putData('figurasplenoautomatico', figuraDto.toJson());
    } catch (e) {
      return ResultApi(success: false, message: 'Error al actulizar figura');
    }
    bool isSuccess = data['isSuccess'];
    Map<String, dynamic> respond = data['data'];
    if (isSuccess) {
    } else {
      return ResultApi(success: false, message: respond['message']);
    }
    return ResultApi(success: true, message: respond['message']);
  }
}
