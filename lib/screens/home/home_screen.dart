import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/auth/auth_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar.dart';
import './home_menu.dart';
import './witgets/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemsBloc, ItemsState>(
      builder: (context, state) {
        ItemsBloc itemsBloc = context.read<ItemsBloc>();
        AuthState authState = context.read<AuthBloc>().state;
        String userName = 'Socio';

        if (authState is AuthLogged) {
          userName = authState.usuario.nombres;
        }

        return AppScaffold(
          titleBar: AppTitleBar(
            title: userName,
            helpScreen: 'inicio',
          ),
          drawer: const HomeMenu(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Seleccione Opcion:',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                HomeButton(
                  icon: Icons.settings,
                  title: 'Configurar Juego',
                  color: Theme.of(context).colorScheme.primary,
                  onTap: () {
                    itemsBloc.add(
                        const SelectItem(tipoItem: 'terminado', item: 'N'));
                    navigateTo(context, 'juego_list');
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                            color: Colors.primaries.first, fontSize: 26),
                      ),
                    ],
                  ),
                ),
                HomeButton(
                  icon: Icons.query_stats,
                  title: 'Informe de Juegos',
                  color: Theme.of(context).colorScheme.secondary,
                  onTap: () {
                    itemsBloc.add(
                        const SelectItem(tipoItem: 'terminado', item: 'N'));
                    navigateTo(context, 'juego_list_alt');
                  },
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                            color: Colors.primaries.first, fontSize: 26),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
