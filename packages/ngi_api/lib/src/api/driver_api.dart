// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of drivers.
/// {@endtemplate}
class DriversApi {
  /// {@macro ngi_api}
  DriversApi({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  /// Provides a [Future] of all drivers.
  Future<DriverQuery> getDrivers({required String token}) async {
    final driverListResponse = await _httpClient.post(
      Uri.parse('${ActiveEnvironments.apiURL}/driver/query'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (driverListResponse.statusCode != 200) {
       //print(driverListResponse.body);
    }
    try {
      final dynamic driverListResult = jsonDecode(
        driverListResponse.body,
      );

      return DriverQuery.fromJson(driverListResult as Map<String, dynamic>);
    } catch (e) {
      print(e.toString());
      throw DriverListJsonDecodeFailure();
    }
  }
}

/// Error thrown when a [Driver] with a given id is not found.
class DriverNotFoundException implements Exception {}

/// Exception thrown when locationSearch fails.
class DriverListResponseFailure implements Exception {}

/// Exception thrown when json serioalizatiobn fails.
class DriverListJsonDecodeFailure implements Exception {}

/// Exception thrown when locationSearch fails.
class DriverListNotEmpty implements Exception {}

// **************************************************************************
void main() {
  const encoder = JsonEncoder.withIndent('  ');
  final driversApi = DriversApi();
  final drivers = <Driver>[];
  driversApi
      .getDrivers(token: Environment.token)
      .then((x) => {drivers.addAll(x.result)})
      .then(
    (_) {
      final prettyprint = encoder.convert(drivers);
      /* for (final driver in drivers) {
        print(driver.toJson());
      } */
      print('**************');
      print(prettyprint);
    },
  );
}
