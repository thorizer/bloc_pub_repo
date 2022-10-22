// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';
import 'package:tuple/tuple.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of alerts.
/// {@endtemplate}
class AlertsApi {
  /// {@macro ngi_api}

  /// Provides a [Future] of all assetsDriver.
  Future<Tuple2<AlertQuery, int>> getAlerts({
    required String token,
    required List<String> assetIds,
  }) async {
    dynamic alertListResult = <String, dynamic>{};
    int statusCode = 0;
    try {
      final Urit = Uri(
          scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
          host: ActiveEnvironments.apiUri,
          path: '${ActiveEnvironments.path}/alert/query',
          port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port,
          queryParameters: <String, dynamic>{
            "limit": "10000",
            "page": "1",
          });
      print(Urit);
      //get last week date
      final DateTime now = DateTime.now();
      //final DateTime lastWeek = now.subtract(const Duration(days: 7));
      final DateTime todayafterMidnight =
          DateTime(now.year, now.month, now.day, 0, 0, 0);
      //final String lastWeekDate = lastWeek.toString();
      final String todayDate = todayafterMidnight.toString();
      final alertListResponse = await http.post(
        Urit,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
        },
        body: jsonEncode(
          {
            "query": {
              "_assetId": {"\$in": assetIds},
              "ack": {"\$exists": true, "\$eq": false},
              "start_dt": {"\$gte": todayDate},
              "end_dt": {"\$exists": true, "\$ne": null},
            },
            "options": {
              "populate": [
                {"path": "_assetId", "select": "_id name type"},
                {"path": "_alertConfig", "select": "config name type"}
              ],
              "sortBy": {"start_dt": -1}
            },
          },
        ),
      );
      print('AlertQuery: ' + alertListResponse.statusCode.toString());
      statusCode = alertListResponse.statusCode;
      if (alertListResponse.body.startsWith('{')) {
        alertListResult = jsonDecode(
          alertListResponse.body,
        );
      } else {
        alertListResult = {
          'page_count': 0,
          'result': <List<Alert>>[],
          'success': false,
          'total_count': 0,
        };
      }
    } catch (e) {
      print('alertResponse exception: $e');
      alertListResult = {
        'page_count': 0,
        'result': <List<Alert>>[],
        'success': false,
        'total_count': 0,
      };
      statusCode = 500;
      print('alert code: $statusCode');
    } finally {
      //print(assetListResult);
    }
    return Tuple2(AlertQuery.fromJson(alertListResult as Map<String, dynamic>),
        statusCode);
  }
}

// **************************************************************************
Future<void> main() async {
  const encoder = JsonEncoder.withIndent('  ');
  final alertsApi = AlertsApi();

  final alerts = await alertsApi.getAlerts(
    token: Environment.token,
    assetIds: <String>[
      '5d304b7b90bae930b9a1e697',
    ],
  );
  final prettyprint = encoder.convert(alerts.item1.result);
  print(prettyprint);
}
