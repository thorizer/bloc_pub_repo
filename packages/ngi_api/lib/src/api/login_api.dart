// ignore_for_file: avoid_print, lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';

/// {@template ngi_api}
/// The interface for an API that provides authentification
/// {@endtemplate}
class LoginApi {
  /// {@macro ngi_api}
  //static http.Client _httpClient = http.Client();

  /// Provides a [Future] of all User Login Result.
  Future<UserLoginResult> getLogin({
    required String login,
    required String password,
  }) async {
    int statusCode = 0;
    dynamic loginResult = <String, dynamic>{};
    final Urit = Uri(
        scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
        host: ActiveEnvironments.apiUri,
        path: '${ActiveEnvironments.path}/login',
        port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port);
        //print(Urit) ;
    try {
      final loginResultResponse = await http.post(
        Urit,
        body: json.encode({'login': login, 'password': password}),
        encoding: Encoding.getByName('utf-8'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
        },
      );
      statusCode = loginResultResponse.statusCode;
      print('getLogin: $statusCode');
      //print('getLogin: ${loginResultResponse.body.toString()}');

      if (loginResultResponse.body.startsWith('{') &&
          loginResultResponse.body.endsWith('}')) {
        //print("ok");
        loginResult = jsonDecode(
          loginResultResponse.body,
        );
        //print(loginResult);
      } else {
        //print("not ok");
        loginResult = {
          'success': false,
          'result': null,
        };
      }
    } catch (e, s) {
      print("LoginApi.getLogin: $e $s");
      print('catch');
      statusCode = 500;
      loginResult = {
        'success': false,
        'result': null,
      };
      throw Exception('LoginApi.getLogin: $e $s');
    } finally {
      /* _httpClient.close();
      _httpClient = http.Client(); */
    }

    return UserLoginResult.fromJson(
      loginResult as Map<String, dynamic>,
    );
  }
}

/// Error thrown when a [LoginResult] with a given id is not found.
class LoginResultNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class LoginResultResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class LoginResultJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class LoginResultNotEmpty implements Exception {}

// **************************************************************************
void main() {
  const encoder = JsonEncoder.withIndent('  ');
  final loginApi = LoginApi();
  loginApi.getLogin(login: '', password: '').then(
    (loginResult) {
      final prettyprint = encoder.convert(loginResult);
      print('**************');
      print(prettyprint);
    },
  );
}
