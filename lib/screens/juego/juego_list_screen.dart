import 'package:flutter/material.dart';
import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/screens/configuracion/configuracion_screen.dart';
import 'package:socio/screens/juego/juego_screen.dart';
import 'package:socio/screens/juego/witgets/juego_icon.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'juego_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/juego/juego_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/format/format_data.dart' as Fd;
import 'package:socio/widgets/layout/app_message.dart' as Msg;

// repository
import 'package:socio/repository/preferences_repository.dart';

class JuegoListScreen extends StatelessWidget {
  JuegoListScreen({Key? key}) : super(key: key);

  late JuegoBloc juegoBlock;

  @override
  Widget build(BuildContext context) {
    juegoBlock = context.read<JuegoBloc>();
    juegoBlock.add(GetAllJuego(''));

    return BlocBuilder<JuegoBloc, JuegoState>(
      builder: (context, state) {
        return AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: 'Configurar Juegos',
            leading: IconButton(
                onPressed: () => navigateTo(context, 'home'),
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                )),
            helpScreen: 'juegos',
          ),
          drawer: const JuegoMenu(),
          child: Container(
              child: (state is JuegosLoaded)
                  ? ListView.builder(
                      padding: const EdgeInsets.only(top: 4),
                      itemCount: state.juegos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return itemsJuegos(context, context.read<ItemsBloc>(),
                            state.juegos[index]);
                      })
                  : const LinearProgressIndicator()),
        );
      },
    );
  }

  Widget itemsJuegos(context, itemsBloc, JuegosWithConfiguracion juegoC) {
    bool isClose = (juegoC.juego.idJuego != null);

    var action = PopupMenuButton(
        elevation: 7,
        onSelected: (tipo) {
          if (isClose) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'error', 'El Juego ya ha sido Jugado'));
          } else {
            itemsBloc.add(SelectItem(tipoItem: 'juego', item: juegoC));
            switch (tipo) {
              case 'configurar_juego':
                setConfiguracion(context);
                break;
              case 'configurar_figuras':
                navigateTo(context, 'figura');
                break;
              default:
            }
          }
        },
        color: Theme.of(context).colorScheme.secondary,
        itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'configurar_juego',
                child: Text('Configurar Juego'),
              ),
              const PopupMenuItem(
                value: 'configurar_figuras',
                child: Text('Configurar Figuras'),
              )
            ],
        icon: const Icon(Icons.settings),
        iconSize: 40);

    return itemJuegoContainer(context, juegoC.juego, isClose, action);
  }

  Container itemJuegoContainer(
      context, Juego juego, bool isClose, Widget action) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryVariant
          ],
        ),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ListTile(
              leading: const SizedBox(
                width: 50,
              ),
              title: Text('Juego ${Fd.numeroJuego(juego.idProgramacionJuego)}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold)),
              subtitle: Text(
                Fd.formatDateTime(juego.fechaProgramada),
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              trailing: action),
          Positioned(
            left: -2.5,
            top: -2.5,
            child: Container(
              width: 77,
              height: 77,
              padding: const EdgeInsets.all(10),
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
              child: JuegoIcon(juego: juego),
            ),
          ),
        ],
      ),
    );
  }

  void getJuegoDetalle(BuildContext context) async {
    bool isUpdated = await pushScreenData(context, JuegoScreen()) ?? true;

    if (isUpdated) {
      juegoBlock.add(GetAllJuego(''));
    }
  }

  void setConfiguracion(BuildContext context) async {
    bool isUpdated =
        await pushScreenData(context, ConfiguracionScreen()) ?? true;

    if (isUpdated) {
      juegoBlock.add(GetAllJuego(''));
    }
  }
}
