import 'package:flutter/material.dart';
import 'package:socio/blocs/juego/juego_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/utils/format/format_data.dart' as Fd;
import 'package:socio/widgets/layout/app_dialog.dart' as Dlg;
import 'package:socio/widgets/layout/app_message.dart' as Msg;

class CartonesJuegoScreen extends StatelessWidget {
  const CartonesJuegoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final juegoConf = context.read<ItemsBloc>().state.juegoSelected;
    final Juego juego = juegoConf.juego;

    return BlocProvider(
      create: (context) => JuegoBloc(),
      child: BlocBuilder<JuegoBloc, JuegoState>(
        buildWhen: (previous, current) {
          if (current is JuegoExito) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'success', current.mensaje));
            navigateTo(context, 'juego_list');
          }
          if (current is JuegoError) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'error', current.mensaje));
            navigateTo(context, 'juego_list');
          }
          return true;
        },
        builder: (context, stateJuego) {
          if (stateJuego is JuegoInitial) {
            context.read<JuegoBloc>().add(SetJuego(juegoConf));
          }
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Juego ${Fd.numeroJuego(juego.idProgramacionJuego)}',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'juego_list'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'informe',
            ),
            drawer: const JuegoMenu(),
            child: (stateJuego is JuegoLoading ||
                    stateJuego is JuegoExito ||
                    stateJuego is JuegoError)
                ? const LinearProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        AppContainer(
                          variant: 'primary',
                          borderRadius: 14,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          padding: const EdgeInsets.all(2),
                          child: Column(children: [
                            const ListTile(
                              title: Text('Configurar Cartones en Juego'),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: options(
                                  context,
                                  juego,
                                  context.read<ItemsBloc>(),
                                  context.read<JuegoBloc>()),
                            ),
                            const SizedBox(height: 16),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              child: Text(
                                "Indique el grupo de cartones que van a jugarse",
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                            ),
                            const SizedBox(height: 50)
                          ]),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  Widget options(BuildContext context, Juego juego, ItemsBloc itemsBloc,
      JuegoBloc juegoBloc) {
    List<DropdownMenuItem<String>> options = [
      const DropdownMenuItem<String>(value: 'A', child: Text('Asignados')),
      const DropdownMenuItem<String>(value: 'V', child: Text('Vendidos')),
      const DropdownMenuItem<String>(
          value: 'T', child: Text('Todos (Rango Completo)')),
    ];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
          colors: [
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.secondaryVariant,
          ],
        ),
      ),
      padding: const EdgeInsets.only(left: 10),
      child: DropdownButton<String>(
        value: juego.cartonesEnJuego,
        underline: const SizedBox(),
        elevation: 16,
        onChanged: (String? option) {
          confirm(context, juego, itemsBloc, juegoBloc, option!);
        },
        items: options,
        iconSize: 34,
        isExpanded: true,
      ),
    );
  }

  void confirm(BuildContext context, Juego juego, ItemsBloc itemsBloc,
      JuegoBloc juegoBloc, String option) async {
    Map<String, String> options = {
      'A': 'Cartones Asignados',
      'V': 'Cartones Vendidos',
      'T': 'Todos los Cartones (Rango Completo)'
    };

    String mensaje = '${options[option]}';

    List<Widget> content = [
      const SizedBox(height: 20),
      Text('Desea configurar para el juego ${juego.idProgramacionJuego}:'),
      const SizedBox(height: 20),
      Text(mensaje, style: const TextStyle(color: Colors.amber)),
      const SizedBox(height: 20)
    ];

    bool? isConfirm = await Dlg.appDialog(
        context, 'Cartones en juego?', content,
        action: 'Confirmar');

    if (isConfirm == true) {
      juegoBloc.add(UpdateCartonesJuego(juego.idProgramacionJuego, option));
    }
  }
}
