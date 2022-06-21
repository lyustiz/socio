import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool validate;
  final String? validateType;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.validate = false,
      this.validateType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        padding: EdgeInsets.only(top: 5, left: 13, bottom: 5, right: 20),
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 5),
                  blurRadius: 5)
            ]),
        child: TextFormField(
            controller: this.textController,
            autocorrect: false,
            keyboardType: this.keyboardType,
            obscureText: this.isPassword,
            decoration: InputDecoration(
                prefixIcon: Icon(this.icon),
                border: InputBorder.none,
                hintText: this.placeholder),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (validate == true) {
                return _validate(value = '1');
              }
            }));
  }

  String _validate(String value) {
    print(value.isEmpty);
    print(validateType);

    bool hasStr(validateType, string) {
      return string.indexOf(validateType) != -1;
    }

    if (hasStr(validateType, 'required') && value.isEmpty)
      return 'Dato requerido';

    if (hasStr(validateType, 'short') && value.length < 3)
      return 'Dato Invalido';

    return '';
  }
}
