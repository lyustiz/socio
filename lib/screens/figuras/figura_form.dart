import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/blocs/figura/figura_bloc.dart';
import 'package:socio/providers/dto/figura_dto.dart';
import 'package:socio/screens/juego/juego_menu.dart';
import 'package:socio/utils/db/db_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/items/items_bloc.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/widgets/layout/app_message.dart' as msg;

class FiguraForm extends StatelessWidget {
  final FiguraDto figuraDto;
  FiguraForm({Key? key, required this.figuraDto}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  late JuegosWithConfiguracion juegoConfiguracion;
  late Juego juego;
  late FiguraDto figura;
  late bool configurado;
  late bool isDual = false;

  @override
  Widget build(BuildContext context) {
    juegoConfiguracion = context.read<ItemsBloc>().state.juegoSelected;
    juego = juegoConfiguracion.juego;
    configurado = figuraDto.acumula == 'S' || figuraDto.multiple == 'S';
    bool isMultiple = figuraDto.multiple == 'S';
    isDual = (figuraDto.cartonDual ?? 0) > 0;
    figura = figuraDto;

    return BlocProvider(
      create: (context) => FiguraBloc(),
      child: AppScaffold(
        color: 'white',
        titleBar: AppTitleBarVariant(
          title: 'Configurar Figura',
          leading: IconButton(
              onPressed: () => navigateTo(context, 'figura'),
              icon: const Icon(Icons.chevron_left)),
          helpScreen: 'configurar',
        ),
        drawer: const JuegoMenu(),
        child: SingleChildScrollView(
            child: BlocBuilder<FiguraBloc, FiguraState>(
          buildWhen: (previous, current) {
            if (current is FiguraInitial) {
              context.read<FiguraBloc>().add(SetFigura(figuraDto));
              return false;
            }

            if (current is FiguraExito) {
              ScaffoldMessenger.of(context).showSnackBar(
                  msg.appMessage(context, 'success', 'Figura Actualizada'));
              navigateTo(context, 'figura');
              return false;
            }

            if (current is FiguraError) {
              ScaffoldMessenger.of(context).showSnackBar(msg.appMessage(
                  context, 'error', 'Error al Actualizar Figura'));
              return false;
            }

            return true;
          },
          builder: (context, state) {
            if (state is FiguraLoaded) {
              figura = state.figura;
            }

            return AppContainer(
                variant: 'secondary',
                borderRadius: 14,
                width: MediaQuery.of(context).size.width * 0.95,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Configurar Figura: ',
                        children: <TextSpan>[
                          TextSpan(
                              text: figura.nombre.toUpperCase(),
                              style: const TextStyle(color: Colors.amber)),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        'Cartones desde ${juego.cartonInicial} hasta ${juego.cartonFinal}',
                        style:
                            const TextStyle(color: Colors.amber, fontSize: 14),
                      ),
                    ),
                    FormBuilder(
                      key: _formKey,
                      child: FormBuilderTextField(
                          name: 'carton',
                          initialValue:
                              configurado ? figura.carton.toString() : '',
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
                            FormBuilderValidators.max(
                                context, juego.cartonFinal,
                                errorText:
                                    'No debe ser mayor de ${juego.cartonFinal}'),
                            (val) {
                              final number = int.parse(val ?? '0');
                              if (number == 0) return null;
                              return null;
                            }
                          ])),
                    ),
                    SizedBox(
                      height: isDual ? 10 : 0,
                    ),
                    isDual
                        ? FormBuilderTextField(
                            name: 'cartonDual',
                            initialValue: (figura.cartonDual ?? 0) > 0
                                ? figura.cartonDual.toString()
                                : '0',
                            keyboardType: TextInputType.number,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                labelText: 'Carton Dual',
                                hintText:
                                    'Carton entre ${juego.cartonInicial} y ${juego.cartonFinal}',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                isDense: true,
                                suffixIcon: const Icon(Icons.table_view)),
                            validator: FormBuilderValidators.compose([
                              (val) {
                                if (isDual) {
                                  if (val == '') {
                                    return 'Debe indicar Numero de Carton Dual';
                                  }
                                  var form = _formKey.currentState;
                                  final cartonDual = int.parse(val ?? '0');
                                  final carton = int.parse(
                                      form!.value['carton'] == ''
                                          ? '0'
                                          : form.value['carton'] ?? '0');

                                  if (cartonDual < juego.cartonInicial) {
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
                    const SizedBox(height: 10),
                    const SizedBox(height: 1),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Acumulado Dual',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              Switch(
                                value: isDual,
                                onChanged: (value) {
                                  FiguraDto newfigura;

                                  if (isDual) {
                                    isDual = false;
                                    newfigura =
                                        figura.copyWith(cartonDual: null);
                                  } else {
                                    isDual = true;
                                    isMultiple = false;
                                    newfigura = figura.copyWith(
                                        cartonDual: juego.cartonInicial);
                                  }

                                  context
                                      .read<FiguraBloc>()
                                      .add(SetFigura(newfigura));
                                },
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                inactiveTrackColor: Colors.blue[50],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Ganador Multiple',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                              ),
                              Switch(
                                value: isMultiple,
                                activeColor:
                                    Theme.of(context).colorScheme.secondary,
                                inactiveTrackColor: Colors.blue[50],
                                onChanged: (value) {
                                  FiguraDto newfigura;
                                  var form = _formKey.currentState;
                                  if (isMultiple) {
                                    isMultiple = false;
                                    newfigura = figura.copyWith(multiple: 'N');
                                  } else {
                                    isMultiple = true;
                                    isDual = false;
                                    newfigura = figura.copyWith(multiple: 'S');
                                  }
                                  form!.validate();

                                  context
                                      .read<FiguraBloc>()
                                      .add(SetFigura(newfigura));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    isMultiple || isDual
                        ? const Text(
                            'Si es multiple/dual debe seleccionar obligatoriamente un numero de carton',
                            style: TextStyle(color: Colors.amber))
                        : const Text(
                            'Si indica cero (0) selecciona un carton aleatorio no vendido',
                            style: TextStyle(color: Colors.amber)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange)),
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Volver')),
                        configurado
                            ? ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.redAccent),
                                    elevation: MaterialStateProperty.all(0)),
                                onPressed: () {
                                  FiguraBloc block = context.read<FiguraBloc>();
                                  removeConfiguracion(juego, figura, block);
                                },
                                child: const Text('Eliminar'),
                              )
                            : const SizedBox(height: 1),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.green)),
                            onPressed: () {
                              final FormBuilderState? formStatus =
                                  _formKey.currentState;
                              if (formStatus != null) {
                                formStatus.save();
                                if (formStatus.validate()) {
                                  int carton =
                                      int.parse(formStatus.value['carton']);
                                  FiguraBloc block = context.read<FiguraBloc>();
                                  setConfiguracion(juego, figura, carton, block,
                                      isMultiple, isDual);
                                }
                              }
                            },
                            child: const Text('Configurar')),
                      ],
                    ),
                    (state is FiguraLoading)
                        ? const LinearProgressIndicator()
                        : const SizedBox(height: 20),
                  ],
                ));
          },
        )),
      ),
    );
  }

  void setConfiguracion(Juego juego, FiguraDto figura, int carton,
      FiguraBloc figuraBlock, bool isMultiple, bool isDual,
      {int cartonDual = 0}) {
    String acumula = 'N';
    String multiple = 'N';

    if (isDual) {
      acumula = 'S';
    } else {
      acumula = isMultiple ? 'N' : 'S';
      multiple = isMultiple ? 'S' : 'N';
      cartonDual = 0; // 0 anula el dual
    }

    FiguraDto updFigura = figura.copyWith(
        carton: carton,
        acumula: acumula,
        multiple: multiple,
        cartonDual: cartonDual);
    figuraBlock.add(UpdateFigura(updFigura, juego.idProgramacionJuego));
  }

  void removeConfiguracion(
    Juego juego,
    FiguraDto figura,
    FiguraBloc figuraBlock,
  ) {
    String acumula = 'N';
    String multiple = 'N';
    FiguraDto updFigura =
        figura.copyWith(carton: 0, acumula: acumula, multiple: multiple);
    figuraBlock.add(UpdateFigura(updFigura, juego.idProgramacionJuego));
  }
}
