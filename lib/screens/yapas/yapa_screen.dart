import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/blocs/yapa/yapa_bloc.dart';
import 'package:socio/providers/dto/Yapa_dto.dart';
import 'package:socio/screens/yapas/yapa_form.dart';
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

class YapaScreen extends StatelessWidget {
  YapaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final juegoDetalles = context.read<ItemsBloc>().state.juegoSelected;
    final Juego juego = juegoDetalles.juego;

    return BlocProvider(
      create: (context) => YapaBloc(),
      child: BlocBuilder<YapaBloc, YapaState>(
        buildWhen: (previous, current) {
          if (current is YapaExito) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'success', current.mensaje));
            return true;
          }
          if (current is YapaError) {
            ScaffoldMessenger.of(context).showSnackBar(
                Msg.appMessage(context, 'error', current.mensaje));
          }
          return true;
        },
        builder: (context, stateYapa) {
          if (stateYapa is YapaInitial) {
            context
                .read<YapaBloc>()
                .add(GetAllYapas(juego.idProgramacionJuego));
          }
          return AppScaffold(
            color: 'white',
            titleBar: AppTitleBarVariant(
              title: 'Yapas Juego ${Fd.numeroJuego(juego.idProgramacionJuego)}',
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
                        children: (stateYapa is YapasLoaded)
                            ? listYapas(context, juego, stateYapa.yapas,
                                context.read<YapaBloc>())
                            : showEstatus(context, stateYapa)),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => formYapa(context, YapaDto.initial()),
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  void formYapa(BuildContext context, YapaDto yapaDto) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => YapaForm(yapa: yapaDto)),
    );
  }

  List<Widget> showEstatus(BuildContext context, YapaState stateYapa) {
    return [const LinearProgressIndicator()];
  }

  List<Widget> listYapas(BuildContext context, Juego juego, List<YapaDto> yapas,
      YapaBloc yapaBlock) {
    List<Widget> itemsYapas = [];

    itemsYapas.add(Container(
        margin: EdgeInsets.only(bottom: 2),
        child: const Text(
          'Administar Yapas',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        )));

    for (var yapa in yapas) {
      var item = Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ListTile(
              dense: true,
              leading: const SizedBox(width: 0),
              title: Text(yapa.nombre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis)),
              subtitle: Column(
                children: [
                  Text(
                    Fd.formatNumber(yapa.valorPremio),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Carton: ' + yapa.carton.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondaryVariant,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                ],
              ),
              trailing: IconButton(
                  onPressed: () => formYapa(context, yapa),
                  icon: const Icon(Icons.edit_rounded, color: Colors.red)),
            ),
            Positioned(
              left: -12,
              top: -3,
              child: Container(
                width: 64,
                height: 64,
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
                    child: const Icon(Icons.view_week_rounded, size: 26)),
              ),
            ),
          ],
        ),
      );

      itemsYapas.add(item);
    }

    return itemsYapas;
  }

  void confirm(BuildContext context, Juego juego, YapaDto yapa, bool active,
      YapaBloc yapaBlock) async {
    String mensaje = active ? ', se Acumule? ' : ', "NO" se Acumule? ';

    final _formKey = GlobalKey<FormBuilderState>();
    List<Widget> content = [
      const SizedBox(height: 20),
      RichText(
        text: TextSpan(
          text: 'Desea que la Yapa: ',
          children: <TextSpan>[
            TextSpan(
                text: yapa.nombre.toUpperCase(),
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
                  initialValue: yapa.carton > 0 ? yapa.carton.toString() : '',
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

    bool? isConfirm = await Dlg.appDialog(context, 'Acumular Yapa?', content,
        action: 'Confirmar');

    if (active) {
      final FormBuilderState? formStatus = _formKey.currentState;
      if (isConfirm ?? false) {
        if (formStatus != null) {
          formStatus.save();
          if (formStatus.validate()) {
            int carton = int.parse(formStatus.value['carton']);
            setAcumula(context, juego, yapa, active, carton, yapaBlock);
          }
        } else {
          Msg.appMessage(context, 'info', 'Debe asignar un carton');
        }
      }
    } else {
      if (isConfirm ?? false) {
        setAcumula(context, juego, yapa, active, 0, yapaBlock);
      }
    }
  }

  void setAcumula(
    BuildContext context,
    Juego juego,
    YapaDto yapa,
    bool active,
    int carton,
    YapaBloc yapaBlock,
  ) {
    YapaDto updYapa = YapaDto(
        idYapa: yapa.idYapa,
        idProgramacionJuego: yapa.idProgramacionJuego,
        nombre: yapa.nombre,
        orden: yapa.orden,
        valorPremio: yapa.valorPremio,
        estado: yapa.estado,
        aleatorio: active ? 'S' : 'N',
        carton: active ? carton : 0);

    yapaBlock.add(UpdateYapa(updYapa));
  }
}
