import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/models/endpoint.dart';
import 'package:socio/utils/route_helper.dart';

class EmpresaSelector extends StatelessWidget {
  final EndPoint endPoint;
  const EmpresaSelector({Key? key, required this.endPoint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is PreferenceLoaded) {
          BlocProvider.of<PreferencesBloc>(context)
              .add(UpdateEndPoint(endPoint.url));
          return Container(
              padding: EdgeInsets.only(top: 18, bottom: 18),
              child: Column(
                children: [
                  empresaSelected(context, endPoint),
                  SizedBox(height: 10),
                  returnButton(context),
                ],
              ));
        } else {
          return Icon(Icons.light_mode_sharp);
        }
      },
    );
  }

  Widget empresaSelected(context, EndPoint endPoint) {
    return FormBuilderTextField(
      name: 'Nombre',
      initialValue: endPoint.nombre,
      readOnly: true,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.apartment_rounded),
        labelText: 'Empresa',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        isDense: true,
      ),
    );
  }

  Widget returnButton(context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green),
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [Icon(Icons.undo), Text('Volver a Login')],
          ),
        ),
        onPressed: () => pushScreen(context, 'login'));
  }

  Widget comboEmpresaEndpoint(context, String endpoint, EndPoint endPoint) {
    EndPoint? empresa = endpoints.firstWhere((ep) => ep.url == endpoint);

    List<DropdownMenuItem<String>> items = [
      DropdownMenuItem(value: endPoint.url, child: Text(endPoint.nombre))
    ];

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: DropdownButton(
            style: const TextStyle(color: Colors.white, fontSize: 18),
            value: empresa.url,
            underline: null,
            isExpanded: true,
            dropdownColor: Theme.of(context).colorScheme.secondary,
            onChanged: (String? url) {
              BlocProvider.of<PreferencesBloc>(context)
                  .add(UpdateEndPoint(url!));
            },
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items));
  }
}
