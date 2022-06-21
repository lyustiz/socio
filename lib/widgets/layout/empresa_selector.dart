import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/models/endpoint.dart';

class EmpresaSelector extends StatelessWidget {
  const EmpresaSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        if (state is PreferenceLoaded) {
          return comboEmpresaEndpoint(context, state.endpoint);
        } else {
          return const Icon(Icons.light_mode_sharp);
        }
      },
    );
  }

  Widget comboEmpresaEndpoint(context, String endpoint) {
    String empresa = endpoints.keys.firstWhere((k) => endpoints[k] == endpoint);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: DropdownButton(
            style: const TextStyle(color: Colors.white, fontSize: 18),
            value: empresa,
            underline: null,
            isExpanded: true,
            dropdownColor: Theme.of(context).colorScheme.secondary,
            onChanged: (String? empresaSelect) {
              BlocProvider.of<PreferencesBloc>(context)
                  .add(UpdateEndPoint(empresaSelect!));
            },
            icon: const Icon(Icons.keyboard_arrow_down),
            items: endpoints
                .map((empresa, url) {
                  return MapEntry(empresa,
                      DropdownMenuItem(value: empresa, child: Text(empresa)));
                })
                .values
                .toList()));
  }
}
