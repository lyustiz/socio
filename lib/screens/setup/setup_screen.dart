import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/models/endpoint.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/widgets/layout/app_message.dart' as Msg;

class SetupScreen extends StatefulWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  TextEditingController textController = TextEditingController();
  late FocusNode myFocusNode;
  EndPoint endpoint = EndPoint(0, '', '');

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
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
        title: 'Configuracion',
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
          Column(
            children: [
              const SizedBox(height: 16),
              const Text('Cambio de Empresa', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              TextField(
                focusNode: myFocusNode,
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'Codigo de Empresa',
                  suffixIcon: Icon(Icons.vpn_key),
                  filled: true,
                ),
              ),
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
                        children: [
                          const Icon(Icons.sync_alt),
                          const Text('Cambiar'),
                        ],
                      ),
                    ),
                    onPressed: () => unlockForm(context)),
              )
            ],
          ),
        ],
      )),
    );
  }

  void unlockForm(context) {
    EndPoint endpointSel = EndPoint(0, '', '');

    if (textController.text.isNotEmpty) {
      endpointSel = endpoints
          .firstWhere((ep) => ep.id == int.tryParse(textController.text));
    }

    if (endpointSel.id > 0) {
      BlocProvider.of<PreferencesBloc>(context)
          .add(UpdateEndPoint(endpointSel.url));
      pushScreen(context, 'login');
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(Msg.appMessage(context, 'error', 'Código Inválido'));
    }
    textController.clear();
  }
}
