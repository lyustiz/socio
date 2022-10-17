import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/auth/auth_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/utils/format/format_data.dart' as Fd;

class CuentaScreen extends StatelessWidget {
  const CuentaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, authState) {
        return AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: "Cuenta",
            leading: IconButton(
                onPressed: () => navigateTo(context, 'home'),
                icon: const Icon(Icons.chevron_left)),
            helpScreen: 'Cuenta',
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(top: 10, left: 14, right: 14),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 55,
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 90,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                      padding: const EdgeInsets.only(top: 10),
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).colorScheme.secondaryVariant
                          ],
                        ),
                      ),
                      child: (authState is AuthLogged)
                          ? ListView(
                              children: [
                                ListTile(
                                    leading: const Icon(Icons.account_box,
                                        size: 30, color: Colors.white),
                                    title: const Text('Nombre'),
                                    subtitle: Text(authState.usuario.nombres)),
                                ListTile(
                                    leading: const Icon(Icons.calendar_today,
                                        size: 30, color: Colors.white),
                                    title: const Text('Fecha Creacion'),
                                    subtitle: Text(Fd.formatDateTime(
                                        authState.usuario.fechaCreacion))),
                                ListTile(
                                    leading: const Icon(
                                        Icons.admin_panel_settings,
                                        size: 30,
                                        color: Colors.white),
                                    title: const Text('Es Administrador'),
                                    subtitle: Text(
                                        authState.usuario.isAdmin == 'S'
                                            ? 'Si'
                                            : 'No')),
                              ],
                            )
                          : const CircularProgressIndicator()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
