import 'package:socio/utils/db/db_manager.dart';

class UsuarioRepository extends AppDatabase {
  Future<Usuario> selectUsuario() async {
    return select(usuarios).getSingle();
  }

  Future<bool> upateUsuario(Usuario usuario) async {
    return update(usuarios).replace(usuario);
  }

  Future<int> insertUsuario(Usuario usuario) async {
    return into(usuarios).insert(usuario);
  }
}
