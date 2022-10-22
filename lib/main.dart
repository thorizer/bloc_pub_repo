// ignore_for_file: lines_longer_than_80_chars

//import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdm_bloc/app.dart';
import 'package:hive/hive.dart';
import 'package:ngi_repository/ngi_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:easy_localization/easy_localization.dart';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) {
        final isValidHost = host != "a" ;
        print("host: $isValidHost");
        return isValidHost;
      };
  }
}

void main() async {
  /* FlutterError.onError = (details) {
    FlutterError.presentError(details);
    //log(details.exceptionAsString(), stackTrace: details.stack);
  };

  PlatformDispatcher.instance.onError = (dynamic error, StackTrace stack) {
    log(error.toString(), stackTrace: stack);
    return true;
  }; */

  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  if (!kIsWeb) {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }
  await Hive.openBox<dynamic>('login');
  await EasyLocalization.ensureInitialized();
  final authenticationRepository = AuthenticationRepository();
  Bloc.observer = AppBlocObserver();

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('fr'),
      ],
      fallbackLocale: Locale('fr'),
      saveLocale: true,
      useOnlyLangCode: true,
      path: 'assets/translations',
      child: App(authenticationRepository: authenticationRepository)));
}

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    //log('onChange(${bloc.runtimeType})');
    log('${change.nextState})');
  }

  /* @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('onTransition ${bloc.runtimeType} $transition');
  } */

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('onEvent ${bloc.runtimeType} $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
