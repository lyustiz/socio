import 'package:flutter/material.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/help_button.dart';
import 'package:socio/widgets/layout/logo.dart';
import 'recover_form.dart';

class RecoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      color: 'purple',
      child: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: HelpButton(),
                    ),
                  ],
                ),
                Logo(
                  titulo: 'Recuperar contraseña',
                  fontSize: 22,
                ),
                RecoverForm(),
                TextButton(
                  onPressed: () => navigateTo(context, 'login'),
                  child: Text('Volver'),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => navigateTo(context, 'condiciones'),
        child: Container(
          height: 35,
          padding: EdgeInsets.all(3),
          alignment: Alignment.center,
          child: Text(
            'Términos y condiciones de uso',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
