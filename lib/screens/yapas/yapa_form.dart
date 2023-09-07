import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/blocs/yapa/yapa_bloc.dart';
import 'package:socio/providers/dto/Yapa_dto.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/widgets/layout/app_message.dart' as msg;
import 'package:socio/widgets/layout/app_dialog.dart' as dlg;

class YapaForm extends StatelessWidget {
  YapaForm({Key? key, required this.yapa}) : super(key: key);
  final YapaDto yapa;
  final _formKey = GlobalKey<FormBuilderState>();

  late JuegosWithConfiguracion juegoConfiguracion;
  late Juego juego;
  late bool hasYapa;
  late bool isAleatoria;

  @override
  Widget build(BuildContext context) {
    juegoConfiguracion = context.read<ItemsBloc>().state.juegoSelected;
    juego = juegoConfiguracion.juego;
    hasYapa = yapa.idYapa > 0;
    isAleatoria = yapa.carton > 0;

    return BlocProvider(
      create: (context) => YapaBloc(),
      child: BlocBuilder<YapaBloc, YapaState>(buildWhen: (previous, current) {
        if (current is YapaExito) {
          ScaffoldMessenger.of(context).showSnackBar(
              msg.appMessage(context, 'success', current.mensaje));
          navigateTo(context, 'yapas');
          return false;
        }
        if (current is YapaError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(msg.appMessage(context, 'error', current.mensaje));
          navigateTo(context, 'yapas');
          return false;
        }
        if (current is YapaInitial) {
          context.read<YapaBloc>().add(SelectYapa(yapa));
          return false;
        }
        return true;
      }, builder: (context, state) {
        if (state is YapaInitial) {
          context.read<YapaBloc>().add(SelectYapa(yapa));
        }
        return AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: 'Configurar Yapa',
            leading: IconButton(
                onPressed: () => navigateTo(context, 'yapas'),
                icon: const Icon(Icons.chevron_left)),
            helpScreen: 'configurar',
          ),
          drawer: const JuegoMenu(),
          child: SingleChildScrollView(
              child: AppContainer(
                  variant: 'secondary',
                  borderRadius: 14,
                  width: MediaQuery.of(context).size.width * 0.95,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  padding: const EdgeInsets.all(15),
                  child: FormBuilder(
                      enabled: (state is! YapaLoading),
                      key: _formKey,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            FormBuilderTextField(
                              name: 'nombre',
                              initialValue: yapa.nombre,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: 'Nombre',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  isDense: true,
                                  suffixIcon:
                                      const Icon(Icons.view_week_rounded)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: 'Debe Indicar Nombre'),
                              ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FormBuilderTextField(
                              name: 'carton',
                              initialValue: '${yapa.carton}',
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: 'Carton',
                                  hintText:
                                      'Carton entre ${juego.cartonInicial} y ${juego.cartonFinal}',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  isDense: true,
                                  suffixIcon: const Icon(Icons.table_view)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText:
                                        'Debe ser ${juego.cartonInicial} o superior'),
                                FormBuilderValidators.integer(context,
                                    errorText: 'indicar Solo numeros'),
                                FormBuilderValidators.min(context, 0,
                                    errorText:
                                        'Debe ser 0 (Aleatorio), ${juego.cartonInicial} o superior'),
                                FormBuilderValidators.max(
                                    context, juego.cartonFinal,
                                    errorText:
                                        'No debe ser mayor de ${juego.cartonFinal}'),
                              ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FormBuilderTextField(
                              name: 'valorPremio',
                              initialValue: '${yapa.valorPremio}',
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                  labelText: 'Valor Premio',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  isDense: true,
                                  suffixIcon: const Icon(Icons.attach_money)),
                              validator: FormBuilderValidators.compose([
                                (val) {
                                  if (val == '') {
                                    return 'Debe indicar Monto Valido';
                                  }
                                  double value = double.parse(val ?? '0');

                                  if (value < 1) {
                                    return 'Debe indicar Monto Valido';
                                  }
                                  return null;
                                }
                              ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                height: (state is YapaLoading) ? 25 : 25,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (state is YapaLoading)
                                      ? const LinearProgressIndicator()
                                      : null,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FloatingActionButton(
                                    onPressed: () {
                                      return confirm(context,
                                          context.read<YapaBloc>(), hasYapa);
                                    },
                                    child: hasYapa
                                        ? const Icon(Icons.edit)
                                        : const Icon(Icons.save),
                                    backgroundColor:
                                        hasYapa ? Colors.orange : Colors.green,
                                    heroTag: '3',
                                    elevation: 0,
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 2))),
                                (hasYapa)
                                    ? FloatingActionButton(
                                        onPressed: () => (state is YapaLoading)
                                            ? null
                                            : hasYapa
                                                ? delConfirm(context,
                                                    context.read<YapaBloc>())
                                                : null,
                                        child: const Icon(
                                          Icons.delete,
                                          size: 36,
                                        ),
                                        backgroundColor: Colors.red,
                                        heroTag: '5',
                                        elevation: 0,
                                        shape: const CircleBorder(
                                            side: BorderSide(
                                                color: Colors.white, width: 2)))
                                    : const SizedBox(width: 40),
                                FloatingActionButton(
                                    onPressed: () => (state is YapaLoading)
                                        ? null
                                        : onCancel(context),
                                    child: const Icon(
                                      Icons.reply,
                                      size: 36,
                                    ),
                                    backgroundColor: Colors.amber,
                                    heroTag: '6',
                                    elevation: 0,
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 2))),
                              ],
                            )
                          ],
                        ),
                      )))),
        );
      }),
    );
  }

  void confirm(BuildContext context, YapaBloc yapaBloc, bool hasYapa) async {
    final FormBuilderState? formStatus = _formKey.currentState;
    bool isConfirm = false;

    if (formStatus != null) {
      formStatus.save();

      int carton = int.parse(formStatus.value['carton']);
      String aleatorio = carton == 0 ? '(Aleatorio)' : '';

      if (formStatus.validate()) {
        List<Widget> content = [
          ListTile(
            title: const Text('Nombre'),
            subtitle: Text('${formStatus.value['nombre']}'),
          ),
          ListTile(
            title: const Text('Nro. Carton'),
            subtitle: Text('${formStatus.value['carton']} $aleatorio'),
          ),
          ListTile(
            title: const Text('Valor Premio'),
            subtitle: Text('${formStatus.value['valorPremio']}'),
          ),
        ];

        final String action = hasYapa ? 'Actualizar' : 'Crear';

        final String title =
            '$action Yapa Juego ${juego.idProgramacionJuego.toString().padLeft(3, '0')}?';

        await dlg
            .appDialog(context, title, content, action: 'Confirmar')
            .then((value) => isConfirm = value ?? false);
      }
    }

    if (isConfirm) {
      if (hasYapa) {
        onUpdate(context, yapaBloc, formStatus!);
      } else {
        onSave(context, yapaBloc, formStatus!);
      }
    }
  }

  void delConfirm(BuildContext context, YapaBloc yapaBloc) async {
    bool isConfirm = false;

    final String title =
        'Eliminar Yapa del Juego ${juego.idProgramacionJuego.toString().padLeft(3, '0')}?';

    List<Widget> content = [
      ListTile(title: const Text('Nombre Yapa'), subtitle: Text(yapa.nombre)),
    ];

    await dlg
        .appDialog(context, title, content, action: 'Confirmar')
        .then((value) => isConfirm = value ?? false);

    if (isConfirm) {
      onDelete(context, yapaBloc);
    }
  }

  void onSave(BuildContext context, YapaBloc yapaBloc,
      FormBuilderState formStatus) async {
    DateTime actualizado = DateTime.now();
    int carton = int.parse(formStatus.value['carton']);
    String aleatorio = carton > 0 ? 'N' : 'S';
    YapaDto addYapa = YapaDto(
      idYapa: 0,
      idProgramacionJuego: juego.idProgramacionJuego,
      nombre: formStatus.value['nombre'],
      carton: carton,
      valorPremio: double.parse(formStatus.value['valorPremio']),
      orden: 1,
      aleatorio: aleatorio,
      estado: 'A',
      fechaAjuste: actualizado,
      idUsuario: 1,
    );
    yapaBloc.add(InsertYapa(addYapa));
  }

  void onUpdate(BuildContext context, YapaBloc yapaBloc,
      FormBuilderState formStatus) async {
    DateTime actualizado = DateTime.now();
    int carton = int.parse(formStatus.value['carton']);
    String aleatorio = carton > 0 ? 'N' : 'S';
    YapaDto updYapa = YapaDto(
      idYapa: yapa.idYapa,
      idProgramacionJuego: juego.idProgramacionJuego,
      nombre: formStatus.value['nombre'],
      carton: carton,
      valorPremio: double.parse(formStatus.value['valorPremio']),
      orden: yapa.orden,
      aleatorio: aleatorio,
      estado: 'A',
      fechaAjuste: actualizado,
      idUsuario: 1,
    );

    yapaBloc.add(UpdateYapa(updYapa));
  }

  void onDelete(BuildContext context, YapaBloc yapaBloc) async {
    YapaDto delYapa = YapaDto(
      idYapa: yapa.idYapa,
      idProgramacionJuego: juego.idProgramacionJuego,
      nombre: yapa.nombre,
      carton: yapa.carton,
      valorPremio: yapa.valorPremio,
      orden: yapa.orden,
      aleatorio: yapa.aleatorio,
      estado: 'A',
      fechaAjuste: yapa.fechaAjuste,
      idUsuario: 1,
    );

    yapaBloc.add(DeleteYapa(delYapa));
  }

  void onCancel(BuildContext context) {
    final FormBuilderState? formStatus = _formKey.currentState;
    if (formStatus != null) {
      formStatus.reset();
    }
    navigateTo(context, 'yapas');
  }
}
