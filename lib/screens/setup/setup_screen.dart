import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_container.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/app_title_bar_variant.dart';
import 'package:socio/widgets/layout/empresa_selector.dart';
import 'package:socio/widgets/layout/app_message.dart' as Msg;

class SetupScreen extends StatefulWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  TextEditingController textController = TextEditingController();
  late FocusNode myFocusNode;
  late bool isUnlocked;

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
          if (isUnlocked)
            Container(
              child: Column(
                children: [
                  Text('Seleccione Empresa', style: TextStyle(fontSize: 18)),
                  EmpresaSelector(),
                  Row(
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.green,
                        mini: true,
                        onPressed: () => pushScreen(context, 'endpoint'),
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          if (!isUnlocked)
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Desbloquear Configuracion',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    focusNode: myFocusNode,
                    controller: textController,
                    decoration: new InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Contraseña',
                      suffixIcon: Icon(Icons.vpn_key),
                      filled: true,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green),
                        ),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.lock_open),
                              Text(' Desbloquear'),
                            ],
                          ),
                        ),
                        onPressed: () => unlockForm(context)),
                  )
                ],
              ),
            )
        ],
      )),
    );
  }

  void unlockForm(context) {
    if (textController.text == '12345') {
      setState(() {
        isUnlocked = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          Msg.appMessage(context, 'error', 'Contraseña Invalida'));
    }
    textController.clear();
  }
}
