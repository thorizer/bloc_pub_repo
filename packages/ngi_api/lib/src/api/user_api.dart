// ignore_for_file: avoid_print, lines_longer_than_80_chars, public_member_api_docs

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of users.
/// {@endtemplate}
class UsersApi {
  /// {@macro ngi_api}
  UsersApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Provides a [Future] of all users.
  Future<UserQuery> getUsers({required String token}) async {
    final userListResponse = await _httpClient.post(
      Uri.parse('${ActiveEnvironments.apiURL}/user/query'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (userListResponse.statusCode != 200) {
      throw UserListResponseFailure();
    }
    try {
      final dynamic userListResult = jsonDecode(
        userListResponse.body,
      );

      return UserQuery.fromJson(userListResult as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      throw UserListJsonDecodeFailure();
    }
  }

  // Provides a [Future] of all user.
  Future<User?> getUser({
    required String token,
    Map<String, Object>? query = const {},
  }) async {
    final userListResponse = await _httpClient.post(
      Uri.parse('${ActiveEnvironments.apiURL}/user/query'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'query': query,
        },
      ),
    );

    if (userListResponse.statusCode != 200) {
      throw UserListResponseFailure();
    }
    try {
      final dynamic userListResult = jsonDecode(
        userListResponse.body,
      );

      return UserQuery.fromJson(userListResult as Map<String, dynamic>)
          .result[0];
    } catch (e) {
      print(e.toString());
      throw UserListJsonDecodeFailure();
    }
  }
}

/// Error thrown when a [User] with a given id is not found.
class UserNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class UserListResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class UserListJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class UserListNotEmpty implements Exception {}

// **************************************************************************
void main() {
  const encoder = JsonEncoder.withIndent('  ');
  final usersApi = UsersApi();
  final users = <User>[];
  usersApi
      .getUsers(token: Environment.token)
      .then((x) => {users.addAll(x.result)})
      .then(
    (_) {
      final prettyprint = encoder.convert(users[14]);
      for (final user in users) {
        print(user.toJson());
      }
      print('**************');
      print(prettyprint);
    },
  );
}
