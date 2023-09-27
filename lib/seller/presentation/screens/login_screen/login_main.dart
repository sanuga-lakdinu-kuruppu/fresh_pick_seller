import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/landing_screen/landing_screen_with_bnb.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/login_screen/login_password.dart';
import 'package:fresh_pick_seller/seller/presentation/screens/login_screen/sign_up.dart';

import '../../../business_logic/auth_page/bloc/auth_page_bloc.dart';
import 'login_email.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late AuthPageBloc authPageBloc;
  @override
  void initState() {
    authPageBloc = BlocProvider.of<AuthPageBloc>(context);
    authPageBloc.add(AuthPageInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthPageBloc, AuthPageState>(
      bloc: authPageBloc,
      buildWhen: (previous, current) => current is! AuthPageActionState,
      listenWhen: (previous, current) => current is AuthPageActionState,
      listener: (context, state) {
        if (state is AuthPageNavigateToLoginPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginPasswordPage()));
        } else if (state is AuthPageNavigateToPreviousPageActionState) {
          Navigator.pop(context);
        } else if (state is AuthPageNavigateToSignUpPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignUpPage()));
        } else if (state is AuthPageLoginSuccessActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LandingPage()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case AuthPageLoadingSucessState:
            return LoginEmailPage();
          default:
            return const SizedBox();
        }
      },
    );
  }
}
