//library osm_nominatim;

import 'dart:convert';
//import 'dart:developer';

import 'package:ngi_api/ngi_api.export.dart';
import 'package:http/http.dart' as http;

/// OSM Nominatim helper
class BenomadApi {
  //static http.Client _httpClient = http.Client();

  /// Searches for a place by it's coordinates
  static Future<List<BatchResult>> reverseGeoBatch({
    String? radius,
    String? action,
    int? maxResults,
    Map<String, dynamic>? options,
    String? transportType,
    required List<String> xy,
    String? language,
    String? layers,
  }) async {
    //log(xy);
    dynamic addressResult;
    int statusCode = 0;
    final urit = Uri(
      scheme: 'https',
      host: 'tcfleet.ngi.tn',
      path: 'bgis/bnd',
      queryParameters: <String, dynamic>{
        'radius': radius ?? '500',
        'maxresults': maxResults ?? '1',
        'xy': xy,
        if (transportType != null) 'transportType': transportType,
        'language': language ?? 'fr',
        if (layers != null) 'layers': layers,
        if (options != null) 'options': options,
        'action': action ?? 'revgeoBatch',
        'geoserver': "benomad",
        'version': "1.0.0",
        'format': "json"
      },
    );
    try {
      //log(urit);
      final benomadResponse = await http.post(
        urit,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': "*/*",
          'Access-Control-Allow-Origin': '*',
          "Access-Control-Allow-Methods": "GET, POST, PUT, DELETE, OPTIONS",
        },
      );
      statusCode = benomadResponse.statusCode;
      //log(benomadResponse.body);
      if (benomadResponse.body.startsWith('{')) {
        addressResult = jsonDecode(
          benomadResponse.body.toLowerCase(),
        );
      } else {
        addressResult = {
          "bnd": {
            "batchresults": <List<BatchResult>>[],
          }
        };
      }
      // ignore: unused_catch_stack
    } catch (e, s) {
      /* _httpClient.close();
      _httpClient = http.Client(); */
      //log('benomad exp: $e');
      addressResult = {
        "bnd": {
          "batchresults": <List<BatchResult>>[],
        }
      };
      statusCode = 500;
    } finally {
      //log(addressResult);

      if (xy.length > 1)
        print('BenomadStatusCode: ' + statusCode.toString());

      //log(urit);
      /* _httpClient.close();
      _httpClient = http.Client(); */
    }

    return Benomad.fromJson(addressResult as Map<String, dynamic>)
        .bnd
        ?.batchresults as List<BatchResult>;
  }
}

// main
void main() async {
  final List<BatchResult> places = await BenomadApi.reverseGeoBatch(
      xy: ['10.206445,36.839105', '10.206438,36.839121'], radius: "500");
  print(places.first.toJson());
}
