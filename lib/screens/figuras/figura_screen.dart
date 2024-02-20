import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/blocs/figura/figura_bloc.dart';
import 'package:socio/providers/dto/figura_dto.dart';
import 'package:socio/screens/figuras/widgets/figura_icon.dart';
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

import 'figura_form.dart';

class FiguraScreen extends StatelessWidget {
  const FiguraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final juegoDetalles = context.read<ItemsBloc>().state.juegoSelected;
    final Juego juego = juegoDetalles.juego;

    return BlocProvider(
      create: (context) => FiguraBloc(),
      child: BlocBuilder<FiguraBloc, FiguraState>(
        buildWhen: (previous, current) {
          if (current is FiguraExito) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'success', current.mensaje));
            return true;
          }
          if (current is FiguraError) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'error', current.mensaje));
          }
          return true;
        },
        builder: (context, stateFigura) {
          if (stateFigura is FiguraInitial) {
            context
                .read<FiguraBloc>()
                .add(GetAllFiguras(juego.idProgramacionJuego));
          }
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title:
                  'Figuras Juego ${Fd.numeroJuego(juego.idProgramacionJuego)}',
              leading: IconButton(
                  onPressed: () => navigateTo(context, 'juego_list'),
                  icon: const Icon(Icons.chevron_left)),
              helpScreen: 'informe',
            ),
            drawer: const JuegoMenu(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppContainer(
                    variant: 'primary',
                    borderRadius: 14,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    padding: const EdgeInsets.all(15),
                    child: Column(
                        children: (stateFigura is FigurasLoaded)
                            ? listFiguras(context, juego, stateFigura.figuras,
                                context.read<FiguraBloc>())
                            : showEstatus(context, stateFigura)),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => context
                  .read<FiguraBloc>()
                  .add(GetAllFiguras(juego.idProgramacionJuego)),
              child: const Icon(Icons.refresh),
            ),
          );
        },
      ),
    );
  }

  List<Widget> showEstatus(BuildContext context, FiguraState stateFigura) {
    return [const LinearProgressIndicator()];
  }

  List<Widget> listFiguras(BuildContext context, Juego juego,
      List<FiguraDto> figuras, FiguraBloc figuraBlock) {
    List<Widget> itemsFiguras = [];

    itemsFiguras.add(Container(
        margin: const EdgeInsets.only(bottom: 2),
        child: const Text(
          'Acumular Figuras',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )));

    for (var figura in figuras) {
      var item = Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ListTile(
              isThreeLine: true,
              dense: true,
              leading: const SizedBox(width: 50),
              title: Text(figura.nombre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis)),
              subtitle: Column(
                children: [
                  Text(
                    Fd.formatNumber(figura.valorPremio),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 14),
                  ),
                  Text(
                    'Carton: ' + figura.carton.toString(),
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondaryVariant,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    'Mult: ' +
                        figura.multiple +
                        '  Dual: ' +
                        (figura.cartonDual == null ? 'N' : 'S'),
                    style: TextStyle(
                        color:
                            figura.multiple == 'S' || figura.cartonDual != null
                                ? Colors.redAccent
                                : Theme.of(context).colorScheme.secondary,
                        fontSize: 12),
                  ),
                ],
              ),
              trailing: Switch(
                value: figura.acumula == 'S' || figura.multiple == 'S',
                onChanged: (value) {
                  confirm(context, juego, figura, value, figuraBlock);
                },
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveTrackColor: Colors.blue[50],
              ),
            ),
            Positioned(
              left: -6,
              top: -3,
              child: Container(
                width: 77,
                height: 79,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.secondaryVariant
                    ],
                  ),
                ),
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(5),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child:
                        FiguraIcon(figura: figura, tipoJuego: juego.tipoJuego)),
              ),
            ),
          ],
        ),
      );

      itemsFiguras.add(item);
    }

    return itemsFiguras;
  }

  Future<bool> advertencia(
      BuildContext context, FiguraDto figura, bool active) async {
    int nroPosiciones = 0;
    for (var rune in figura.posiciones.runes) {
      var posicion = String.fromCharCode(rune);
      nroPosiciones = (posicion == "1") ? nroPosiciones + 1 : nroPosiciones;
      if (nroPosiciones > 4) {
        return true;
      }
    }

    List<Widget> content = [
      const SizedBox(height: 20),
      RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text:
              'NO se recomienda configurar figuras con solo 4 balota, ya que es probable que ganen cartones antes del configurado. Figura: ',
          children: <TextSpan>[
            TextSpan(
                text: figura.nombre.toUpperCase(),
                style: const TextStyle(color: Colors.amber)),
          ],
        ),
      ),
    ];

    bool? isConfirm = await Dlg.appDialog(context, 'Advertencia', content,
        action: 'Continuar');

    return isConfirm ?? false;
  }

  void confirm(
    BuildContext context,
    Juego juego,
    FiguraDto figura,
    bool active,
    FiguraBloc figuraBlock,
  ) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FiguraForm(figuraDto: figura),
      ),
    );
  }
}
