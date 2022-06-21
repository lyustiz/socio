import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socio/blocs/auth/auth_bloc.dart';
import 'package:socio/blocs/preferences/preferences_bloc.dart';
import 'package:socio/models/endpoint.dart';
import 'package:socio/utils/route_helper.dart';
import 'package:socio/widgets/layout/app_scaffold.dart';
import 'package:socio/widgets/layout/logo.dart';
import 'package:socio/screens/login/login_form.dart';
import '../../widgets/layout/help_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(buildWhen: (previous, current) {
      final bool logged = (current is AuthLogged);
      if (logged) navigateTo(context, 'home');
      return !logged;
    }, builder: (context, state) {
      return AppScaffold(
        color: 'purple',
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => pushScreen(context, 'setup'),
                        icon: const Icon(Icons.settings)),
                    const Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: HelpButton(),
                    ),
                  ],
                ),
                const Logo(
                  titulo: 'Bingo JL',
                  fontSize: 22,
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    alignment: Alignment.center,
                    height: 18,
                    width: MediaQuery.of(context).size.width * 0.60,
                    child: BlocBuilder<PreferencesBloc, PreferencesState>(
                      builder: (context, state) {
                        String empresa = '';
                        if (state is PreferenceLoaded) {
                          empresa = endpoints.keys.firstWhere(
                              (k) => endpoints[k] == state.endpoint);
                        }
                        return ListTile(
                          leading: const Icon(Icons.apartment_rounded),
                          title: Text(
                            empresa,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      },
                    )),
                LoginForm(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () => navigateTo(context, 'condiciones'),
          child: Container(
            height: 35,
            padding: const EdgeInsets.all(3),
            alignment: Alignment.center,
            child: const Text(
              'Términos y condiciones de uso',
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ),
      );
    });
  }
}
