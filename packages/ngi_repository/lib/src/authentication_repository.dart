// ignore_for_file: lines_longer_than_80_chars, avoid_print, public_member_api_docs, avoid_void_async, unused_local_variable

import 'dart:async';
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:ngi_api/ngi_api.export.dart';
import 'package:ngi_repository/src/models/models.export.dart';

/// Authentication Status
enum AuthenticationStatus { unknown, authenticated, unauthenticated }

/// {@template AuthenticationRepository}
/// A repository that handles Authentication related requests.
/// {@endtemplate}
class AuthenticationRepository {
  /// A repository that handles ngi related requests
  AuthenticationRepository({
    LoginApi? loginApi,
  }) : _loginApi = loginApi ?? LoginApi();

  final LoginApi _loginApi;
  final _controller = StreamController<AuthenticationStatus>();
  static String? currentToken;

  Stream<AuthenticationStatus> get status async* {
    // TODOs(amine): auto logout interceptor
    // Hive.init('/data/hive');
    final token = await getToken();
    final expirationDate = await getExpirationDate();

    if (token != null && expirationDate != null && token.isNotEmpty) {
      final expDate = DateTime.parse(expirationDate).toUtc();
      final now = DateTime.now().toUtc();
      if (expDate.isAfter(now)) {
        yield AuthenticationStatus.authenticated;
        currentToken = token;
      } else {
        print('token expired');
        // TODOs(amine): refix
        //await logOut();
        //yield AuthenticationStatus.unauthenticated;
        yield AuthenticationStatus.authenticated;
      }
    } else {
      await logOut();
      yield AuthenticationStatus.unauthenticated;
    }
    yield* _controller.stream;
  }

  Future<UserLoginRepo> logIn({
    required String username,
    required String password,
  }) async {
    var auth = const UserLoginRepo();
    late UserLoginResult response;
    try {
      response = await _loginApi.getLogin(login: username, password: password);
    } catch (error, stackTrace) {
      print('error: $error');
      print('stackTrace: $stackTrace');
      throw WrongLoginInputException(error, stackTrace);
    }
    auth = getCleanLoginData(response);
    if (response.success == false) {
      _controller.add(AuthenticationStatus.unauthenticated);
      //throw WrongLoginInputException();
    } else {
      if (auth.token != null) {
        await setToken(auth.token);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
        return auth;
      }

      if (auth.user != null) {
        await setUser(auth.user!.toMap());
        await setUserData(response.result!.user!.toJson());
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
        return auth;
      }

      if (auth.company_owner != null) {
        await setCompany(auth.company_owner!.toMap());
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
        return auth;
      }

      if (auth.expirationDate != null) {
        await setExpirationDate(auth.expirationDate);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
        return auth;
      }

      if (auth.role != null) {
        if (auth.role?.childs != null) await setChildRoles(auth.role!.childs);
        await setPermissions(auth.role?.permissions);
      } else {
        _controller.add(AuthenticationStatus.unauthenticated);
        return auth;
      }

      _controller.add(AuthenticationStatus.authenticated);
    }

    return auth;
  }

  void unothorize() async {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> logOut() async {
    await Hive.box<dynamic>('login').clear();

    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<String?> getToken() async {
    final token = Hive.box<dynamic>('login').get('token') as String?;

    return token;
  }

  Future<void> setToken(String? token) async {
    await Hive.box<dynamic>('login').put('token', token);
  }

  Future<UserRepo?> getUser() async {
    final user = (Hive.box<dynamic>('login').get('user') as Map?)
            ?.cast<String, String?>() ??
        {};

    if (user.isEmpty) {
      return null;
    }
    return UserRepo(
      id: user['id'] ?? '',
      company_owner: user['CompanyOwner'],
      ctry: user['ctry'],
      fax: user['fax'],
      first_name: user['first_name'],
      last_name: user['last_name'],
      login: user['login'],
      mail: user['mail'],
      phone: user['phone'],
      role: user['role'],
    );
  }

  Future<void> setUser(Map<String, String?> user) async {
    await Hive.box<dynamic>('login').put('user', user);
  }

  Future<Map<String, dynamic>> getUserData() async {
    final userData = (Hive.box<dynamic>('login').get('userdata') as Map?)
            ?.cast<String, dynamic>() ??
        <String, dynamic>{};

    if (userData.isEmpty) {
      return <String, dynamic>{};
    }

    /*  final getUserById = UsersApi()
        .getUser(token: token ?? '', query: {'_id': user['id'] ?? ''});
    final userById = await getUserById;

    const encoder = JsonEncoder.withIndent('  ');
    final prettyprint = encoder.convert(userById);
    print(prettyprint); */
    return userData;
  }

  Future<void> setUserData(Map<String, dynamic> userData) async {
    await Hive.box<dynamic>('login').put('userdata', userData);
  }

  Future<Map<String, String>> getPermissions() async {
    final permissions = (Hive.box<dynamic>('login').get('permissions') as Map?)
            ?.cast<String, String>() ??
        {};

    return permissions;
  }

  Future<void> setPermissions(Map<String, String>? permissions) async {
    await Hive.box<dynamic>('login')
        .put('permissions', permissions ?? <String, String>{});
  }

  Future<List<String?>> getChildRoles() async {
    final childroles = (Hive.box<dynamic>('login').get('childroles') as List?)
            ?.cast<String?>() ??
        [];

    return childroles;
  }

  Future<void> setChildRoles(List<String?>? childroles) async {
    await Hive.box<dynamic>('login').put('childroles', childroles)
        as List<String?>?;
  }

  Future<CompanyOwnerRepo?> getCompany() async {
    final company = (Hive.box<dynamic>('login').get('company') as Map?)
            ?.cast<String, Object?>() ??
        {};

    if (company.isEmpty) {
      return null;
    }
    return CompanyOwnerRepo(
      id: company['id'] as String? ?? '',
      name: company['name'] as String?,
      client_code: company['client_code'] as String?,
      company_owner: company['company_owner'] as String?,
      ctry: company['ctry'] as String?,
      fax: company['fax'] as String?,
      currency: company['currency'] as String?,
      mail: company['email'] as String?,
      phone: company['phone'] as String?,
      fraudRate: company['fraudRate'] as int?,
      tank_over: company['tank_over'] as int?,
      tank_under: company['tank_under'] as int?,
      tank_threshold: company['tank_threshold'] as int?,
      totalCheckAccess: company['totalCheckAccess'] as bool?,
      totalPassword: company['totalPassword'] as String?,
      totalUsername: company['totalUsername'] as String?,
    );
  }

  Future<void> setCompany(Map<String, Object?> company) async {
    await Hive.box<dynamic>('login').put('company', company);
  }

  Future<String?> getExpirationDate() async {
    final expirationDate = Hive.box<dynamic>('login').get('expire') as String?;

    return expirationDate;
  }

  Future<void> setExpirationDate(String? expirationDate) async {
    await Hive.box<dynamic>('login').put('expire', expirationDate);
  }

  UserLoginRepo getCleanLoginData(UserLoginResult response) {
    if (response.success == false) {
      return UserLoginRepo(
        success: response.success,
      );
    }
    final user = UserRepo(
      id: response.result!.user!.id,
      company_owner: response.result?.user?.company_owner?.id,
      mail: response.result?.user?.contact?.mail,
      fax: response.result?.user?.contact?.fax,
      phone: response.result?.user?.contact?.phone,
      ctry: response.result?.user?.ctry,
      first_name: response.result?.user?.first_name,
      last_name: response.result?.user?.last_name,
      login: response.result?.user?.login,
      role: response.result?.user?.role?.id,
    );

    final oldPermission = response.result?.user?.role?.permissions;
    final permissions = <String, String>{};

    for (final e in oldPermission ?? <String>[]) {
      final perm = e.split('_');

      final create = perm[0].contains('C') ? '1' : '0';
      final read = perm[0].contains('R') ? '1' : '0';
      final update = perm[0].contains('U') ? '1' : '0';
      final delete = perm[0].contains('D') ? '1' : '0';
      final access = perm[1];
      final module = perm.sublist(2).join('_');
      final newPerm = '$access$create$read$update$delete';
      permissions[module] = newPerm;
    }

    final role = RoleRepo(
      id: response.result?.user?.role?.id,
      childs: response.result?.user?.role?.childs,
      permissions: permissions,
    );

    final company = CompanyOwnerRepo(
      id: response.result!.user!.company_owner!.id,
      name: response.result?.user?.company_owner?.name,
      ctry: response.result?.user?.company_owner?.ctry,
      client_code: response.result?.user?.company_owner?.client_code,
      totalUsername: response.result?.user?.company_owner?.totalData?.username,
      totalPassword: response.result?.user?.company_owner?.totalData?.password,
      totalCheckAccess:
          response.result?.user?.company_owner?.totalData?.check_access,
      currency: response.result?.user?.company_owner?.currency,
      company_owner: response.result?.user?.company_owner?.company_owner,
      mail: response.result?.user?.company_owner?.contact?.mail,
      fax: response.result?.user?.company_owner?.contact?.fax,
      phone: response.result?.user?.company_owner?.contact?.phone,
      fraudRate: response.result?.user?.company_owner?.params?.fraudRate,
      tank_over: response.result?.user?.company_owner?.params?.tank_over,
      tank_threshold:
          response.result?.user?.company_owner?.params?.tank_threshold,
      tank_under: response.result?.user?.company_owner?.params?.tank_under,
    );

    final auth = UserLoginRepo(
      token: response.result?.token,
      expirationDate: response.result?.expirationDate,
      user: user,
      role: role,
      company_owner: company,
      success: response.success,
    );
    return auth;
  }

  void dispose() => _controller.close();
}

/// Error thrown when login input is wrong.
class WrongLoginInputException implements Exception {
  /// {@macro WrongLoginInputException}
  const WrongLoginInputException(this.error, this.stackTrace);

  /// The error that was caught.
  final Object error;

  /// The Stacktrace associated with the [error].
  final StackTrace stackTrace;
}

// **************************************************************************
void main() async {
  const encoder = JsonEncoder.withIndent('  ');
  final loginRepository = AuthenticationRepository();
  print(loginRepository.status.listen(print));
  final loginResult = await loginRepository.logIn(
    username: '',
    password: '',
  );
  //final prettyprint = encoder.convert(loginResult);
  //print(prettyprint);

  await loginRepository.logOut();
}
