import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/blocs/figura/figura_bloc.dart';
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

class FiguraScreen extends StatelessWidget {
  FiguraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final juegoDetalles = context.read<ItemsBloc>().state.juegoSelected;
    final Juego juego = juegoDetalles.juego;

    return BlocProvider(
      create: (context) => FiguraBloc(),
      child: BlocBuilder<FiguraBloc, FiguraState>(
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
          );
        },
      ),
    );
  }

  List<Widget> showEstatus(BuildContext context, FiguraState stateFigura) {
    if (stateFigura is FiguraExito) {
      ScaffoldMessenger.of(context).showSnackBar(
          Msg.appMessage(context, 'success', stateFigura.mensaje));
    }
    if (stateFigura is FiguraError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(Msg.appMessage(context, 'error', stateFigura.mensaje));
    }
    return [const LinearProgressIndicator()];
  }

  List<Widget> listFiguras(BuildContext context, Juego juego,
      List<Figura> figuras, FiguraBloc figuraBlock) {
    List<Widget> itemsFiguras = [];

    figuras = figuras
        .where((figura) => !figura.nombre.toLowerCase().startsWith('lleno'))
        .toList();

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
              dense: true,
              leading: const SizedBox(width: 50),
              title: Text(figura.nombre,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              subtitle: Container(
                child: Column(
                  children: [
                    Text(
                      Fd.formatNumber(figura.valorPremio),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize: 16),
                    ),
                    Text(
                      'Carton: ' + figura.carton.toString(),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondaryVariant,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
              trailing: Switch(
                value: figura.acumula == 'S',
                onChanged: (value) {
                  confirm(context, juego, figura, value, figuraBlock);
                },
                activeColor: Theme.of(context).colorScheme.secondary,
                inactiveTrackColor: Colors.blue[50],
              ),
            ),
            Positioned(
              left: -6,
              top: -7,
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

  void confirm(BuildContext context, Juego juego, Figura figura, bool active,
      FiguraBloc figuraBlock) async {
    String mensaje = active ? ', se Acumule? ' : ', "NO" se Acumule? ';

    final _formKey = GlobalKey<FormBuilderState>();
    List<Widget> content = [
      const SizedBox(height: 20),
      RichText(
        text: TextSpan(
          text: 'Desea que la figura: ',
          children: <TextSpan>[
            TextSpan(
                text: figura.nombre.toUpperCase(),
                style: const TextStyle(color: Colors.amber)),
            TextSpan(
                text: mensaje,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15, bottom: 15),
        child: Text(
          'Cartones desde ${juego.cartonInicial} hasta ${juego.cartonFinal}',
          style: const TextStyle(color: Colors.amber, fontSize: 14),
        ),
      ),
      (!active)
          ? const SizedBox(height: 20)
          : FormBuilder(
              key: _formKey,
              child: FormBuilderTextField(
                  name: 'carton',
                  autofocus: true,
                  initialValue:
                      figura.carton > 0 ? figura.carton.toString() : '',
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: false, decimal: false),
                  autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                      labelText: 'Carton Asignado',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      isDense: true,
                      suffixIcon: const Icon(Icons.table_view)),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: 'El carton es requerido'),
                    FormBuilderValidators.integer(context,
                        errorText: 'indicar Solo numeros'),
                    FormBuilderValidators.min(context, 0,
                        errorText:
                            'Debe ser ${juego.cartonInicial} o superior'),
                    FormBuilderValidators.max(context, juego.cartonFinal,
                        errorText: 'No debe ser mayor de ${juego.cartonFinal}'),
                    (val) {
                      final number = int.parse(val ?? '0');
                      if (number == 0) return null;
                      if (number < juego.cartonInicial) {
                        return 'Debe ser 0, ${juego.cartonInicial} o superior';
                      }
                      return null;
                    }
                  ])),
            ),
      const SizedBox(height: 4),
      (!active)
          ? const SizedBox(height: 5)
          : const Text('Cero (0) selecciona un carton aleatorio no vendido',
              style: TextStyle(color: Colors.amber)),
    ];

    bool? isConfirm = await Dlg.appDialog(context, 'Acumular Figura?', content,
        action: 'Confirmar');

    if (active) {
      final FormBuilderState? formStatus = _formKey.currentState;
      if (isConfirm ?? false) {
        if (formStatus != null) {
          formStatus.save();
          if (formStatus.validate()) {
            int carton = int.parse(formStatus.value['carton']);
            setAcumula(context, juego, figura, active, carton, figuraBlock);
          }
        } else {
          Msg.appMessage(context, 'info', 'Debe asignar un carton');
        }
      }
    } else {
      if (isConfirm ?? false) {
        setAcumula(context, juego, figura, active, 0, figuraBlock);
      }
    }
  }

  void setAcumula(
    BuildContext context,
    Juego juego,
    Figura figura,
    bool active,
    int carton,
    FiguraBloc figuraBlock,
  ) {
    Figura updFigura = Figura(
        idFigura: figura.idFigura,
        idProgramacionJuego: figura.idProgramacionJuego,
        idPlenoAutomatico: figura.idPlenoAutomatico,
        nombre: figura.nombre,
        posiciones: figura.posiciones,
        estado: figura.estado,
        valorPremio: figura.valorPremio,
        acumula: active ? 'S' : 'N',
        carton: active ? carton : 0);

    figuraBlock.add(UpdateFigura(updFigura));
  }
}
