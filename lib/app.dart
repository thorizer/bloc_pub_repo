// ignore_for_file: no_default_cases, library_private_types_in_public_api

/*
Note: app.dart is split into two parts App and AppView.
App is responsible for creating/providing the AuthenticationBloc
which will be consumed by the AppView. This decoupling will enable us
to easily test both the App and AppView widgets later on.

Note: RepositoryProvider is used to provide the single instance of
AuthenticationRepository to the entire application
which will come in handy later on.

AppView is a StatefulWidget because it maintains a GlobalKey
which is used to access the NavigatorState. By default,
AppView will render the SplashPage (which we will see later)
and it uses BlocListener to navigate to different pages based on changes
in the AuthenticationState. */

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/authentication/authentication.dart';
import 'package:gdm_bloc/home/home.dart';
import 'package:gdm_bloc/login/login.dart';
import 'package:gdm_bloc/shared/constants.dart';
import 'package:gdm_bloc/splash/splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ngi_repository/ngi_repository.dart';

GlobalKey globalKey = GlobalKey();


class App extends StatelessWidget {
  const App({
    Key? key,
    required this.authenticationRepository,
  }) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  _AppViewState createState() => _AppViewState();
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorThemeMatch.m3_01));
    return MaterialApp(
      title: 'NGI Fleet',
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
          scrollbarTheme: ScrollbarThemeData().copyWith(
            thumbColor: MaterialStateProperty.all(Colors.teal),
            thickness: MaterialStateProperty.all(5),
          )),
      navigatorKey: _navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: (context, child) {
        /*  Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error; */
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                  (route) => false,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  LoginPage.route(),
                  (route) => false,
                );
                break;
              default:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
