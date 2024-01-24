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

class FiguraScreenx extends StatelessWidget {
  const FiguraScreenx({Key? key}) : super(key: key);

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
        margin: EdgeInsets.only(bottom: 2),
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
                    'Multiple: ' + figura.multiple,
                    style: TextStyle(
                        color: figura.multiple == 'S'
                            ? Colors.redAccent
                            : Theme.of(context).colorScheme.secondary,
                        fontSize: 14),
                  ),
                ],
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
    bool continuar = await advertencia(context, figura, active);

    if (!continuar) return;

    String mensaje = active ? ', se Acumule? ' : ', "NO" se Acumule? ';

    bool isMultiple = figura.multiple == 'S';

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
        margin: const EdgeInsets.only(top: 15, bottom: 15),
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
                    FormBuilderValidators.min(
                        context, isMultiple ? juego.cartonInicial : 0,
                        errorText:
                            'Debe ser ${isMultiple ? juego.cartonInicial : 0} o superior'),
                    FormBuilderValidators.max(context, juego.cartonFinal,
                        errorText: 'No debe ser mayor de ${juego.cartonFinal}'),
                    (val) {
                      final number = int.parse(val ?? '0');
                      if (number == 0) return null;
                      return null;
                    }
                  ])),
            ),
      (!active)
          ? const SizedBox(height: 20)
          : Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Ganador Multiple',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Switch(
                    value: isMultiple,
                    activeColor: Theme.of(context).colorScheme.secondary,
                    inactiveTrackColor: Colors.blue[50],
                    onChanged: (value) {
                      FiguraDto newfigura;
                      var form = _formKey.currentState;
                      if (isMultiple) {
                        isMultiple = false;
                        newfigura = figura.copyWith(multiple: 'N');
                      } else {
                        isMultiple = true;
                        newfigura = figura.copyWith(multiple: 'S');
                      }
                      form!.validate();

                      //context.read<FiguraBloc>().on(SetFigura(newfigura));
                    },
                  ),
                ],
              ),
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
    FiguraDto figura,
    bool active,
    int carton,
    FiguraBloc figuraBlock,
  ) {
    FiguraDto updFigura = FiguraDto(
        idFigura: figura.idFigura,
        idPlenoAutomatico: figura.idPlenoAutomatico,
        nombre: figura.nombre,
        posiciones: figura.posiciones,
        estado: figura.estado,
        valorPremio: figura.valorPremio,
        acumula: active ? 'S' : 'N',
        multiple: 'N',
        carton: active ? carton : 0);

    figuraBlock.add(UpdateFigura(updFigura, juego.idProgramacionJuego));
  }
}
