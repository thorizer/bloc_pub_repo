// ignore_for_file: lines_longer_than_80_chars, public_member_api_docs

/// Provides the envirement variables of the API.
/// abstract class
abstract class Environment {
  /// This token is used for testing purposes.
  ///
  static const String oldToken =
      'a';
  static const String token =
      'a';
  static const String deliceToken =
      'a';
}


class ActiveEnvironments extends Environment {
  static const bool isSafe = false;
  static const String apiURL = 'a';
  static const String apiUri = 'a';
  static const String path = '/a/a/a';
  static const int? port = 1;
  static const String socketURL = 'http://a';
  static const String bndUrl = 'http://a/bgis/bnd';
  static const String titleUrl =
      'http://a/bgis/bgis/wms?format=png';
}
