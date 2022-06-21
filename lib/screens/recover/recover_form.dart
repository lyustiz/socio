import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class RecoverForm extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<RecoverForm> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.only(top: 40),
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: 'inpPhone',
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: 'Telefono',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context,
                      errorText: 'El Telefono es requerido'),
                  FormBuilderValidators.numeric(context),
                ]),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                  width: 300,
                  height: 45,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.primaryVariant,
                      ],
                    ),
                  ),
                  child: MaterialButton(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      child: Text(
                        'Recuperar contraseña',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic),
                      ),
                      onPressed: () => {})),
            ],
          ),
        ));
  }
}
