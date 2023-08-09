import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/providers/dto/configuracion_dto.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/configuracion/configuracion_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/widgets/layout/app_message.dart' as msg;
import 'package:socio/widgets/layout/app_dialog.dart' as dlg;

class ConfiguracionForm extends StatelessWidget {
  ConfiguracionForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  late JuegosWithConfiguracion juegoConfiguracion;
  late Juego juego;
  late Configuracion? configuracion;
  late ConfiguracionDto configuracionDto;
  late String serie = juego.serie;
  late bool hasConfiguracion = false;
  late bool isMultiple = false;
  late bool isDual = false;

  @override
  Widget build(BuildContext context) {
    juegoConfiguracion = context.read<ItemsBloc>().state.juegoSelected;
    juego = juegoConfiguracion.juego;

    if (juegoConfiguracion.configuracion != null) {
      configuracion = juegoConfiguracion.configuracion;
      configuracionDto = ConfiguracionDto.fromConfiguracion(configuracion!);
      hasConfiguracion = true;
      isMultiple = juegoConfiguracion.configuracion!.balotas == 76;
      isDual = juegoConfiguracion.configuracion!.cartonDual > 0;
    } else {
      configuracionDto = ConfiguracionDto.initial(juego.serie);
    }

    return BlocProvider(
      create: (context) => ConfiguracionBloc(),
      child: BlocBuilder<ConfiguracionBloc, ConfiguracionState>(
          buildWhen: (previous, current) {
        if (current is ConfiguracionExito) {
          juegoConfiguracion =
              juegoConfiguracion.copyWith(configuracion: configuracion);

          context
              .read<ItemsBloc>()
              .add(SelectItem(tipoItem: 'juego', item: juegoConfiguracion));

          ScaffoldMessenger.of(context).showSnackBar(
              msg.appMessage(context, 'success', 'Configuracion Actualizada'));
          navigateTo(context, 'configuracion');
          return false;
        }
        if (current is ConfiguracionInitial) {
          context.read<ConfiguracionBloc>().add(SetConfiguracion(
              ConfiguracionDto.fromConfiguracion(configuracion!,
                  idUsuario: 9)));
          return false;
        }
        return true;
      }, builder: (context, state) {
        if (state is ConfiguracionInitial) {
          context
              .read<ConfiguracionBloc>()
              .add(SetConfiguracion(configuracionDto));
        }
        return AppScaffold(
          color: 'white',
          titleBar: AppTitleBarVariant(
            title: 'Configurar',
            leading: IconButton(
                onPressed: () => navigateTo(context, 'juego_list'),
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
                      enabled: (state is! ConfiguracionLoading),
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
                              name: 'serie',
                              initialValue: juego.serie,
                              readOnly: true,
                              decoration: InputDecoration(
                                  labelText: 'Serie',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  isDense: true,
                                  suffixIcon: const Icon(Icons.dynamic_feed)),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            FormBuilderTextField(
                              name: 'carton',
                              initialValue:
                                  '${(hasConfiguracion) ? configuracion!.carton : '0'}',
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
                                FormBuilderValidators.min(
                                    context, isMultiple ? 1 : 0,
                                    errorText:
                                        'Debe ser ${juego.cartonInicial} o superior'),
                                FormBuilderValidators.max(
                                    context, juego.cartonFinal,
                                    errorText:
                                        'No debe ser mayor de ${juego.cartonFinal}'),
                                (val) {
                                  final number = int.parse(val ?? '0');
                                  if (number == 0) {
                                    return (isDual)
                                        ? 'Debe ser ${juego.cartonInicial} o superior'
                                        : null;
                                  }
                                  if (number < juego.cartonInicial) {
                                    return 'Debe ser 0, ${juego.cartonInicial} o superior';
                                  }
                                  return null;
                                }
                              ]),
                            ),
                            SizedBox(
                              height: isDual ? 10 : 0,
                            ),
                            isDual
                                ? FormBuilderTextField(
                                    name: 'cartonDual',
                                    initialValue:
                                        '${(hasConfiguracion) ? configuracion!.cartonDual : '0'}',
                                    keyboardType: TextInputType.number,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                        labelText: 'Carton Dual',
                                        hintText:
                                            'Carton entre ${juego.cartonInicial} y ${juego.cartonFinal}',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        filled: true,
                                        isDense: true,
                                        suffixIcon:
                                            const Icon(Icons.table_view)),
                                    validator: FormBuilderValidators.compose([
                                      (val) {
                                        if (isDual) {
                                          if (val == '') {
                                            return 'Debe indicar Numero de Carton Dual';
                                          }
                                          var form = _formKey.currentState;
                                          final cartonDual =
                                              int.parse(val ?? '0');
                                          final carton = int.parse(
                                              form!.value['carton'] == ''
                                                  ? '0'
                                                  : form.value['carton'] ??
                                                      '0');

                                          if (cartonDual <
                                              juego.cartonInicial) {
                                            return 'Debe ser ${juego.cartonInicial} o superior';
                                          }

                                          if (carton == cartonDual) {
                                            return 'El carton $carton ya ha sido asignado ';
                                          }

                                          if (cartonDual > juego.cartonFinal) {
                                            return 'No debe ser mayor de ${juego.cartonFinal}';
                                          }
                                        } else {
                                          return null;
                                        }
                                        return null;
                                      }
                                    ]),
                                  )
                                : const SizedBox(width: 0, height: 0),
                            const SizedBox(
                              height: 10,
                            ),
                            FormBuilderTextField(
                              name: 'balotas',
                              initialValue:
                                  '${(hasConfiguracion) ? configuracion!.balotas : '0'}',
                              keyboardType: TextInputType.number,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              readOnly: isMultiple,
                              decoration: InputDecoration(
                                  labelText: 'Balota',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: !isMultiple,
                                  isDense: true,
                                  suffixIcon: const Icon(Icons.workspaces)),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText:
                                        'Debe ser 0 (automatico) o superior'),
                                FormBuilderValidators.min(context, 0,
                                    errorText:
                                        'Debe ser 0 (automatico) o superior'),
                                FormBuilderValidators.max(
                                    context, isMultiple ? 76 : 75,
                                    errorText:
                                        'No debe ser mayor que ${isMultiple ? 76 : 75}'),
                              ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Ganador Multiple',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                  Switch(
                                    value: isMultiple,
                                    onChanged: (value) {
                                      var form = _formKey.currentState;
                                      if (isMultiple) {
                                        isMultiple = false;
                                        form!.fields['balotas']!.didChange('0');
                                      } else {
                                        isMultiple = true;
                                        form!.fields['balotas']!
                                            .didChange('76');
                                        if (form.fields['carton']!.value ==
                                            '0') {
                                          form.fields['carton']!.didChange('0');
                                        }
                                      }
                                      form.validate();
                                      context.read<ConfiguracionBloc>().add(
                                          SetConfiguracion(configuracionDto));
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.secondary,
                                    inactiveTrackColor: Colors.blue[50],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Acumulado Dual',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                  ),
                                  Switch(
                                    value: isDual,
                                    onChanged: (value) {
                                      var form = _formKey.currentState;
                                      if (isDual) {
                                        isDual = false;
                                        form!.fields['cartonDual']!
                                            .didChange('1');
                                        form.validate();
                                      } else {
                                        isDual = true;
                                      }

                                      context.read<ConfiguracionBloc>().add(
                                          SetConfiguracion(configuracionDto));
                                    },
                                    activeColor:
                                        Theme.of(context).colorScheme.secondary,
                                    inactiveTrackColor: Colors.blue[50],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                height:
                                    (state is ConfiguracionLoading) ? 30 : 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (state is ConfiguracionLoading)
                                      ? const LinearProgressIndicator()
                                      : null,
                                )),
                            SizedBox(
                                height: (state is ConfiguracionError) ? 35 : 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (state is ConfiguracionError)
                                      ? Text(
                                          state.mensaje,
                                          style: const TextStyle(
                                              color: Colors.red),
                                        )
                                      : null,
                                )),
                            SizedBox(
                                height: (state is ConfiguracionExito) ? 35 : 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: (state is ConfiguracionExito)
                                      ? Text(
                                          state.mensaje,
                                          style: const TextStyle(
                                              color: Colors.green),
                                        )
                                      : null,
                                )),
                            const SizedBox(height: 05),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FloatingActionButton(
                                    onPressed: () {
                                      return confirm(
                                          context,
                                          context.read<ConfiguracionBloc>(),
                                          hasConfiguracion);
                                    },
                                    child: hasConfiguracion
                                        ? const Icon(Icons.edit)
                                        : const Icon(Icons.save),
                                    backgroundColor: hasConfiguracion
                                        ? Colors.orange
                                        : Colors.green,
                                    heroTag: '3',
                                    elevation: 0,
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 2))),
                                FloatingActionButton(
                                    onPressed: () =>
                                        (state is ConfiguracionLoading)
                                            ? null
                                            : onCancel(context),
                                    child: const Icon(
                                      Icons.close,
                                      size: 36,
                                    ),
                                    backgroundColor: Colors.red,
                                    heroTag: '5',
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
      }

          /* */

          ),
    );
  }

  void confirm(BuildContext context, ConfiguracionBloc configuracionBloc,
      bool hasConfiguracion) async {
    final FormBuilderState? formStatus = _formKey.currentState;
    bool isConfirm = false;

    if (formStatus != null) {
      formStatus.save();

      if (formStatus.validate()) {
        List<Widget> content = [
          ListTile(
            title: const Text('Serie'),
            subtitle: Text(serie),
          ),
          ListTile(
            title: const Text('Nro. Carton'),
            subtitle: Text(
              '${formStatus.value['carton']}',
            ),
          ),
          (isDual)
              ? ListTile(
                  title: const Text('Nro. Carton Dual'),
                  subtitle: Text(
                    '${formStatus.value['cartonDual']}',
                  ),
                )
              : const SizedBox(),
          ListTile(
            title: const Text('Balota'),
            subtitle: Text('${formStatus.value['balotas']}'),
          ),
        ];

        final String action = hasConfiguracion ? 'Actualizar' : 'Crear';

        final String title =
            '$action Configuracion Juego ${juego.idProgramacionJuego.toString().padLeft(3, '0')}?';

        await dlg
            .appDialog(context, title, content, action: 'Confirmar')
            .then((value) => isConfirm = value ?? false);
      }
    }

    if (isConfirm) {
      if (hasConfiguracion) {
        onUpdate(context, configuracionBloc, formStatus!);
      } else {
        onSave(context, configuracionBloc, formStatus!);
      }
    }
  }

  void onSave(BuildContext context, ConfiguracionBloc configuracionBloc,
      FormBuilderState formStatus) async {
    DateTime actualizado = DateTime.now();
    Configuracion addConfiguracion = Configuracion(
        idConfiguracion: 0,
        idProgramacionJuego: juego.idProgramacionJuego,
        idUsuario: 1,
        carton: int.parse(formStatus.value['carton']),
        serie: formStatus.value['serie'],
        balotas: int.parse(formStatus.value['balotas']),
        reconfigurado: true,
        fechaModificacion: actualizado,
        estado: 'A',
        fechaRegistro: actualizado,
        clienteDefecto: '',
        cartonDual: int.parse(formStatus.value['cartonDual'] ?? '0')); //TODO

    configuracionBloc.add(InsertConfiguracion(
        ConfiguracionDto.fromConfiguracion(addConfiguracion)));
    configuracion = addConfiguracion;
  }

  void onUpdate(BuildContext context, ConfiguracionBloc configuracionBloc,
      FormBuilderState formStatus) async {
    DateTime actualizado = DateTime.now();
    Configuracion updConfiguracion = configuracion!.copyWith(
        carton: int.parse(formStatus.value['carton']),
        serie: formStatus.value['serie'],
        balotas: int.parse(formStatus.value['balotas']),
        reconfigurado: true,
        fechaModificacion: actualizado,
        clienteDefecto: '',
        cartonDual: int.parse(formStatus.value['cartonDual'] ?? '0'));

    configuracionBloc.add(UpdateConfiguracion(
        ConfiguracionDto.fromConfiguracion(updConfiguracion)));
    configuracion = updConfiguracion;
  }

  void onCancel(BuildContext context) {
    final FormBuilderState? formStatus = _formKey.currentState;
    if (formStatus != null) {
      formStatus.reset();
    }
    navigateTo(context, 'configuracion');
  }
}
