// ignore_for_file: avoid_print, lines_longer_than_80_chars

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
//import 'package:logger/logger.dart';
import 'package:ngi_api/ngi_api.export.dart';
import 'package:tuple/tuple.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of assets.
/// {@endtemplate}
class AssetsApi {

  /// Provides a [Future] of all fleets.
  Future<Tuple2<FleetQuery, int>> getFleetsQuerry({
    required String token,
    Map<String, Object>? query = const {},
  }) async {
    dynamic fleetListResult = <String, dynamic>{};
    int statusCode = 0;
    try {
      final Urit = Uri(
        scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
        host: ActiveEnvironments.apiUri,
        path: '${ActiveEnvironments.path}/fleet/query',
        port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port,
      );
      final fleetListResponse = await http.post(
        Urit,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
        },
        body: jsonEncode(
          {
            'query': query,
            'options': {
              'populate': [
                {"path": "_company_owner", "select": "name"}
              ]
            }
          },
        ),
      );
      print('getFleetsQuerry: ' + fleetListResponse.statusCode.toString());
      statusCode = fleetListResponse.statusCode;
      if (fleetListResponse.body.startsWith('{')) {
        fleetListResult = jsonDecode(
          fleetListResponse.body,
        );
      } else {
        fleetListResult = {
          'page_count': 0,
          'result': <List<Fleet>>[],
          'success': false,
          'total_count': 0,
        };
      }
    } catch (e) {
      print('fleetResponse exception: $e');
      fleetListResult = {
        'page_count': 0,
        'result': <List<Fleet>>[],
        'success': false,
        'total_count': 0,
      };
      statusCode = 500;
      print('fleet code: $statusCode');
    } finally {
      //print(fleetListResult);
    }

    return Tuple2(FleetQuery.fromJson(fleetListResult as Map<String, dynamic>),
        statusCode);
  }

  /// Provides a [Future] of all assets.
  Future<Tuple2<AssetQuery, int>> getAssetsQuerry({
    required String token,
    Map<String, Object>? query = const {},
  }) async {
    dynamic assetListResult = <String, dynamic>{};
    int statusCode = 0;
    try {
      final Urit = Uri(
        scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
        host: ActiveEnvironments.apiUri,
        path: '${ActiveEnvironments.path}/asset/query',
        port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port,
      );
      final assetListResponse = await http.post(
        Urit,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
        },
        body: jsonEncode(
          {
            'query': query,
          },
        ),
      );
      print('AssetQuery: ' + assetListResponse.statusCode.toString());
      statusCode = assetListResponse.statusCode;
      if (assetListResponse.body.startsWith('{')) {
        assetListResult = jsonDecode(
          assetListResponse.body,
        );
      } else {
        assetListResult = {
          'page_count': 0,
          'result': <List<Asset>>[],
          'success': false,
          'total_count': 0,
        };
      }
    } catch (e) {
      print('assetResponse exception: $e');
      assetListResult = {
        'page_count': 0,
        'result': <List<Asset>>[],
        'success': false,
        'total_count': 0,
      };
      statusCode = 500;
      print('asset code: $statusCode');
    } finally {
      //print(assetListResult);
    }
    return Tuple2(AssetQuery.fromJson(assetListResult as Map<String, dynamic>),
        statusCode);
  }

  /// Provides a [Future] of all assetsDriver.
  Future<Tuple2<AssetQuery, int>> getAssetsDriverQuerry({
    required String token,
    required List<String> assetIds,
  }) async {
    dynamic assetListResult = <String, dynamic>{};
    int statusCode = 0;
    try {
      final Urit = Uri(
        scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
        host: ActiveEnvironments.apiUri,
        path: '${ActiveEnvironments.path}/assetdriver/assets_rt',
        port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port,
      );
      final assetListResponse = await http.post(
        Urit,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
        },
        body: jsonEncode(
          {
            'assetIds': assetIds,
          },
        ),
      );
      print('AssetDriverQuery: ' + assetListResponse.statusCode.toString());
      statusCode = assetListResponse.statusCode;
      if (assetListResponse.body.startsWith('{')) {
        assetListResult = jsonDecode(
          assetListResponse.body,
        );
      } else {
        assetListResult = {
          'page_count': 0,
          'result': <List<Asset>>[],
          'success': false,
          'total_count': 0,
        };
      }
    } catch (e) {
      print('assetResponse exception: $e');
      assetListResult = {
        'page_count': 0,
        'result': <List<Asset>>[],
        'success': false,
        'total_count': 0,
      };
      statusCode = 500;
      print('assetDriver code: $statusCode');
    } finally {
      //print(assetListResult);
    }
    return Tuple2(AssetQuery.fromJson(assetListResult as Map<String, dynamic>),
        statusCode);
  }

  /// Provides a [Future] of all assetsIds.
  Future<Tuple2<AssetIds, int>> getAssetsIdAgg({
    required String token,
  }) async {
    dynamic assetIdsResult = <String, dynamic>{};
    int statusCode = 0;
    try {
      final Urit = Uri(
        scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
        host: ActiveEnvironments.apiUri,
        path: '${ActiveEnvironments.path}/asset/agg',
        port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port,
      );
      final assetIdsListResponse = await http.post(
        Urit,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
        },
        body: jsonEncode({
          "aggregate": [
            {
              "\$sort": {"_id": 1}
            },
            {
              "\$group": {
                "_id": {"id": "\$id"},
                "ids": {"\$push": "\$_id"}
              }
            },
            {
              "\$project": {"ids": 1, "_id": 0}
            }
          ]
        }),
      );
      print('AssetIdQuery: ' + assetIdsListResponse.statusCode.toString());
      statusCode = assetIdsListResponse.statusCode;
      if (assetIdsListResponse.body.startsWith('{')) {
        assetIdsResult = jsonDecode(
          assetIdsListResponse.body,
        );
      } else {
        assetIdsResult = {
          'page_count': 0,
          'result': {'ids': <String>[]},
          'success': false,
          'total_count': 0,
        };
      }
    } catch (e) {
      print('assetResponse exception: $e');
      assetIdsResult = {
        'page_count': 0,
        'result': {'ids': <String>[]},
        'success': false,
        'total_count': 0,
      };
      statusCode = 500;
      print('assetIds code: $statusCode');
    } finally {
      //print(assetListResult);
    }
    return Tuple2(
        AssetIds.fromJson(assetIdsResult as Map<String, dynamic>), statusCode);
  }
}

// **************************************************************************
Future<void> main() async {
  final assetsApi = AssetsApi();
  final assets =
      await assetsApi.getAssetsQuerry(token: Environment.deliceToken);
  print(assets.item1.result.length);
  //print(assets.item1.result.toString());
  //pretty print
  prettyPrinterLog(assets.item1.result);
}
