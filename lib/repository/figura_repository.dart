import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/providers/DTO/figura_dto.dart';
import 'package:socio/providers/api.dart';
import 'package:socio/utils/db/db_init.dart';

class FiguraRepository {
  final Api api = Api();
  Map<String, dynamic> data = {};

  Future<Figura> selectfigura(Figura figura) async {
    return db<AppDatabase>().figurasDao.selectFigura(figura.idFigura);
  }

  Future<List<Figura>> selectfiguras(int idProgramacionJuego) async {
    return db<AppDatabase>().figurasDao.selectFiguras(idProgramacionJuego);
  }

  Future<int> insertFigura(Figura figura, int idProgramacionJuego) async {
    FiguraDto figuraDto = FiguraDto.fromFigura(figura);

    data = await api.postData('juegosfigura', params: figuraDto.toJson());

    if (data['isSuccess']) {
      FiguraDto newFiguraDto = FiguraDto.fromJson(data['data']);
      Figura newFigura = newFiguraDto.toFigura(idProgramacionJuego);
      await db<AppDatabase>().figurasDao.insertFigura(newFigura);
      return newFigura.idFigura;
    }
    return 0;
  }

  Future<bool> updateFigura(Figura figura) async {
    FiguraDto figuraDto = FiguraDto.fromFigura(figura);

    try {
      data = await api.putData('figurasplenoautomatico', figuraDto.toJson());
    } catch (e) {
      return false;
    }
    if (data['isSuccess']) {
      await db<AppDatabase>().figurasDao.upsertFigura(figura);
    } else {
      return false;
    }
    return true;
  }
}
