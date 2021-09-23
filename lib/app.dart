import 'package:demo/cubit/auth_cubit.dart';
import 'package:demo/main_stack.dart';
import 'package:demo/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthLoggedIn) {
          return MainStack();
        }
        if (state is AuthInitial) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return AuthScreen();
      },
      listener: (context, state) {
        if (state is AuthLoading) {
          Fluttertoast.showToast(
              msg: AppLocalizations.of(context).loggingIn,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16.0);
        }
        if (state is AuthError) {
          Fluttertoast.showToast(
              msg: state.error.message ??
                  AppLocalizations.of(context).somethingWentWrong,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      bloc: BlocProvider.of<AuthCubit>(context)..startUp(),
    );
  }
}
