import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/configuracion/configuracion_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/route_helper.dart';

class JuegoForm extends StatefulWidget {
  const JuegoForm({Key? key}) : super(key: key);

  @override
  _JuegoFormState createState() => _JuegoFormState();
}

class _JuegoFormState extends State<JuegoForm> {
  final _formKey = GlobalKey<FormBuilderState>();

  late JuegosWithConfiguracion juego;
  late Configuracion? configuracion;
  late String serie = 'X';

  @override
  Widget build(BuildContext context) {
    juego = context.read<ItemsBloc>().state.juegoSelected;
    if (juego.configuracion != null) {
      configuracion = juego.configuracion;
    } else {
      configuracion = null;
    }

    return BlocProvider(
      create: (context) => ConfiguracionBloc(),
      child: BlocBuilder<ConfiguracionBloc, ConfiguracionState>(
        builder: (context, state) {
          return FormBuilder(
              enabled: (state is! ConfiguracionLoading),
              key: _formKey,
              child: (configuracion == null)
                  ? const SizedBox(
                      height: 60,
                      child: Text(
                        'No posee configuraciones consulta con el Administrador',
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              padding:
                                  const EdgeInsets.only(right: 12, left: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white.withOpacity(0.2),
                              ),
                              child: serieDropdown()),
                          const SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            name: 'carton',
                            initialValue: '${configuracion!.carton}',
                            keyboardType: TextInputType.number,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                labelText: 'Carton',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                isDense: true,
                                suffixIcon: const Icon(Icons.table_view)),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: 'el carton es requerido'),
                              FormBuilderValidators.min(context, 1,
                                  errorText: 'Debe ser mayor que 0'),
                              FormBuilderValidators.max(context, 1000,
                                  errorText: 'No debe ser mayor que 1000'),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FormBuilderTextField(
                            name: 'balotas',
                            initialValue: '${configuracion!.balotas}',
                            keyboardType: TextInputType.number,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                labelText: 'Balota',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                isDense: true,
                                suffixIcon: const Icon(Icons.workspaces)),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context,
                                  errorText: 'la balota es requerida'),
                              FormBuilderValidators.min(context, 1,
                                  errorText: 'Debe ser mayor que 0'),
                              FormBuilderValidators.max(context, 100,
                                  errorText: 'No debe ser mayor que 100'),
                            ]),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                              height: (state is ConfiguracionLoading) ? 30 : 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (state is ConfiguracionLoading)
                                    ? const LinearProgressIndicator()
                                    : null,
                              )),
                          SizedBox(
                              height: (state is ConfiguracionError) ? 30 : 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (state is ConfiguracionError)
                                    ? Text(
                                        state.mensaje,
                                        style:
                                            const TextStyle(color: Colors.red),
                                      )
                                    : null,
                              )),
                          SizedBox(
                              height: (state is ConfiguracionExito) ? 30 : 0,
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
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              if (juego is JuegosWithConfiguracion)
                                FloatingActionButton(
                                    onPressed: () => onSave(context,
                                        context.read<ConfiguracionBloc>()),
                                    child: const Icon(Icons.edit),
                                    backgroundColor: Colors.orange,
                                    heroTag: '3',
                                    elevation: 0,
                                    shape: const CircleBorder(
                                        side: BorderSide(
                                            color: Colors.white, width: 2))),
                              FloatingActionButton(
                                  onPressed: () => onCancel(context),
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
                    ));
        },
      ),
    );
  }

  Widget serieDropdown() {
    List<String> series = ['X', 'A', 'B', 'C', 'D'];
    return DropdownButton(
        borderRadius: const BorderRadius.all(Radius.circular(14)),
        style: const TextStyle(color: Colors.white, fontSize: 18),
        value: serie,
        underline: Container(),
        isExpanded: true,
        hint: const Text('Series'),
        disabledHint: const Text('No existe Promociones'),
        dropdownColor: Theme.of(context).colorScheme.secondaryVariant,
        onChanged: (String? val) {
          configuracion = configuracion!.copyWith(
            serie: val,
          );
          serie = val!;
          setState(() {});
        },
        icon: const Icon(Icons.keyboard_arrow_down),
        items: series
            .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    'Serie $e',
                  ),
                ))
            .toList());
  }

  void onSave(BuildContext context, ConfiguracionBloc configuracionBloc) {
    final FormBuilderState? formStatus = _formKey.currentState;
    if (formStatus != null) {
      formStatus.save();
      if (formStatus.validate()) {
        DateTime actualizado = DateTime.now();
        Configuracion updConfiguracion = configuracion!.copyWith(
          carton: int.parse(formStatus.value['carton']),
          serie: serie,
          balotas: int.parse(formStatus.value['balotas']),
          reconfigurado: true,
          fechaModificacion: actualizado,
        );

        //configuracionBloc.add(UpdateConfiguracion(updConfiguracion));
      }
    }
  }

  void onCancel(BuildContext context) {
    final FormBuilderState? formStatus = _formKey.currentState;
    if (formStatus != null) {
      formStatus.reset();
    }
    navigateTo(context, 'juego_list');
  }
}
