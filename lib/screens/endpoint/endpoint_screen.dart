import 'package:flutter/material.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:socio/widgets/layout/app_message.dart' as Msg;

class EndpointScreen extends StatefulWidget {
  const EndpointScreen({Key? key}) : super(key: key);

  @override
  State<EndpointScreen> createState() => _EndpointScreenState();
}

class _EndpointScreenState extends State<EndpointScreen> {
  TextEditingController textController = TextEditingController();
  late FocusNode myFocusNode;
  late bool isUnlocked;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
    isUnlocked = false;
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: 'purple',
      titleBar: AppTitleBarVariant(
        color: 'white',
        title: 'Agregar Conexion',
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.chevron_left,
              color: Theme.of(context).colorScheme.primary,
            )),
      ),
      child: AppContainer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(top: 4, bottom: 18),
              child: const Text('Agregar Conexion',
                  style: TextStyle(fontSize: 18))),
          Container(
              margin: const EdgeInsets.only(left: 8),
              child: FormBuilderTextField(
                name: 'inputNombre',
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    labelText: 'Nombre Empresa',
                    filled: true,
                    isDense: true,
                    prefixIcon: Icon(Icons.article)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context,
                      errorText: 'El Nombre de la empresa es requerido'),
                ]),
              )),
          const SizedBox(height: 10),
          Container(
              margin: const EdgeInsets.only(left: 8),
              child: FormBuilderTextField(
                name: 'inputUrl',
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    labelText: 'URL',
                    filled: true,
                    isDense: true,
                    prefixIcon: Icon(Icons.add_link)),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context,
                      errorText: 'La url es requerida'),
                ]),
              )),
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [Icon(Icons.save), Text(' Guardar')],
                  ),
                ),
                onPressed: () => _save(context)),
          )
        ],
      )),
    );
  }

  void _save(BuildContext context) {}
}
