// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ngi_api/ngi_api.export.dart';
import 'package:tuple/tuple.dart';

/// {@template ngi_api}
/// The interface for an API that provides access to a list of comapny.
/// {@endtemplate}
class CompanyApi {
  /// {@macro ngi_api}

  static http.Client _httpClient = http.Client();

  /// Provides a [Future] of current comapny.
  Future<CompanyOwnerResult> getComapny({
    required String token,
    required String id,
  }) async {
    dynamic comapnyOwnerResult = <String, dynamic>{};

    final Urit = Uri(
        scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
        host: ActiveEnvironments.apiUri,
        path: '${ActiveEnvironments.path}/company/$id',
        port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port);

    try {
      final companyResponse = await _httpClient.get(
        Urit,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      print('CompanyOwnerResult: ' + companyResponse.statusCode.toString());
      if (companyResponse.body.startsWith('{')) {
        comapnyOwnerResult = jsonDecode(
          companyResponse.body,
        );
      } else {
        comapnyOwnerResult = {
          'success': false,
          'result': <List<CompanyOwner>>[],
        };
      }
    } catch (e, s) {
      print("CompanyApi.getComapny: $e $s");
    } finally {
      _httpClient.close();
      _httpClient = http.Client();
      //print(comapnyOwnerResult);
    }

    return CompanyOwnerResult.fromJson(
      comapnyOwnerResult as Map<String, dynamic>,
    );
  }

  /// Provides a [Future] of all comapnies.
  Future<Tuple2<CompanyQuery, int>> getCompaniesQuerry({
    required String token,
    Map<String, Object>? query = const {},
  }) async {
    //print(token);

    dynamic comapniesResult = <String, dynamic>{};
    int statusCode = 0;
    try {
      final Urit = Uri(
          scheme: ActiveEnvironments.isSafe ? 'https' : 'http',
          host: ActiveEnvironments.apiUri,
          path: '${ActiveEnvironments.path}/company/query',
          port: ActiveEnvironments.isSafe ? null : ActiveEnvironments.port);

      final companyResponse = await _httpClient.post(
        Urit,
        encoding: Encoding.getByName('utf-8'),
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
      print('getCompaniesQuerry: ' + companyResponse.statusCode.toString());
      statusCode = companyResponse.statusCode;
      if (companyResponse.body.startsWith('{')) {
        comapniesResult = jsonDecode(
          companyResponse.body,
        );
      } else {
        comapniesResult = {
          'page_count': 0,
          'result': <List<CompanyOwner>>[],
          'success': false,
          'total_count': 0,
        };
      }
    } catch (e) {
      print('companyResponse exception: $e');
      comapniesResult = {
        'page_count': 0,
        'result': <List<CompanyOwner>>[],
        'success': false,
        'total_count': 0,
      };
      statusCode = 500;
      print('company code: $statusCode');
    } finally {
      _httpClient.close();
      _httpClient = http.Client();
      //print(comapniesResult);
    }

    return Tuple2(
        CompanyQuery.fromJson(
          comapniesResult as Map<String, dynamic>,
        ),
        statusCode);
  }
}

// **************************************************************************
Future<void> main() async {
  final comapnyApi = CompanyApi();
  print('comapnyApi');
  final company = await comapnyApi.getCompaniesQuerry(
    token: Environment.token,
  );
  print(company);
}
