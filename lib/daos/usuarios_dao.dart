import 'package:socio/utils/db/db_manager.dart';
import 'package:drift/drift.dart';
import 'package:socio/models/usuarios.dart'
    hide $UsuariosTable, Usuario, UsuariosCompanion, AppDatabase;

part 'usuarios_dao.g.dart';

@DriftAccessor(tables: [Usuarios])
class UsuariosDao extends DatabaseAccessor<AppDatabase>
    with _$UsuariosDaoMixin {
  UsuariosDao(AppDatabase db) : super(db);

  Future<Usuario?> selectUsuario() async {
    return (select(usuarios)..where((t) => t.idUsuario.equals(1)))
        .getSingleOrNull();
  }

  Future<bool> upateUsuario(Usuario usuario) async {
    usuario = usuario.copyWith(idUsuario: 1);
    return update(usuarios).replace(usuario);
  }

  Future<int> insertUsuario(Usuario usuario) async {
    usuario = usuario.copyWith(idUsuario: 1);
    return into(usuarios).insert(usuario);
  }

  Future<int> upsertUsuario(Usuario usuario) async {
    usuario = usuario.copyWith(idUsuario: 1);
    return into(usuarios).insertOnConflictUpdate(usuario);
  }
}
