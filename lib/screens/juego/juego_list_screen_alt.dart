import 'package:flutter/material.dart';
import 'package:socio/screens/configuracion/configuracion_screen.dart';
import 'package:socio/screens/informe_juego/informe_juego_screen.dart';
import 'package:socio/screens/juego/juego_screen.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'juego_menu.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/juego/juego_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/utils/format/format_data.dart' as Fd;

class JuegoListScreenAlt extends StatelessWidget {
  JuegoListScreenAlt({Key? key}) : super(key: key);

  late JuegoBloc juegoBlock;

  final mensaje = SnackBar(
      duration: const Duration(milliseconds: 700),
      content: Row(children: [
        const Icon(
          Icons.warning,
          color: Colors.white,
        ),
        Container(
          margin: const EdgeInsets.only(left: 6),
          child: const Text(
            'Juego Terminado',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]),
      backgroundColor: Colors.amber,
      action: SnackBarAction(
        label: 'Aceptar',
        onPressed: () => 1,
      ));

  @override
  Widget build(BuildContext context) {
    juegoBlock = context.read<JuegoBloc>();
    juegoBlock.add(GetAllJuego(''));

    return BlocBuilder<JuegoBloc, JuegoState>(
      builder: (context, state) {
        return AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: 'Ver Informe Juegos',
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

  Widget itemsJuegos(
      context, itemsBloc, JuegosWithConfiguracion juegosWithConfiguracion) {
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
            title: Text(
                'Juego ${juegosWithConfiguracion.juego.idProgramacionJuego.toString().padLeft(3, '0')}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            subtitle: Text(
              '${Fd.formatDateTime(juegosWithConfiguracion.juego.fechaProgramada)}',
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            trailing: PopupMenuButton(
                elevation: 7,
                onSelected: (tipo) {
                  if (juegosWithConfiguracion.juego.estado == 'C') {
                    ScaffoldMessenger.of(context).showSnackBar(mensaje);
                  } else {
                    itemsBloc.add(SelectItem(
                        tipoItem: 'juego', item: juegosWithConfiguracion));
                    pushScreen(context, 'juego');
                    switch (tipo) {
                      case 'estadistica':
                        break;
                      case 'informe':
                        pushScreen(context, 'informe_juego');
                        break;
                      default:
                    }
                  }
                },
                color: Theme.of(context).colorScheme.secondary,
                itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'estadistica',
                        child: const Text('Estadisticas'),
                      ),
                      PopupMenuItem(
                        value: 'informe',
                        child: const Text('Informe General'),
                      )
                    ],
                icon: const Icon(Icons.settings),
                iconSize: 40),
          ),
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
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(30),
                    color: (juegosWithConfiguracion.juego.estado == 'C')
                        ? Colors.redAccent
                        : Colors.lightGreen),
                child: const Icon(
                  Icons.power_settings_new_sharp,
                  color: Colors.white,
                  size: 45,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getReporte(BuildContext context, ItemsBloc itemsBloc,
      JuegosWithConfiguracion juegoConfiguracion, String tipo) {
    if (juegoConfiguracion.juego.estado == 'C') {
      ScaffoldMessenger.of(context).showSnackBar(mensaje);
    } else {
      itemsBloc.add(SelectItem(tipoItem: 'juego', item: juegoConfiguracion));
      navigateTo(context, 'juego');
      switch (tipo) {
        case 'estadistica':
          break;
        case 'informe':
          navigateTo(context, 'informe_juego');
          break;
        default:
      }
    }
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
