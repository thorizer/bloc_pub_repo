// ignore_for_file: lines_longer_than_80_chars, avoid_print, public_member_api_docs, avoid_void_async

import 'dart:async';
//import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:ngi_repository/ngi_repository.dart';

import 'package:tuple/tuple.dart';

/// {@template AssetRepository}
/// A repository that handles Asset related requests.
/// {@endtemplate}
class AssetRepository {
  /// A repository that handles ngi related requests
  AssetRepository({
    AssetsApi? assetsApi,
    CompanyApi? companyApi,
    AlertsApi? alertsApi,
  })  : _assetsApi = assetsApi ?? AssetsApi(),
        _alertsApi = alertsApi ?? AlertsApi(),
        _companyApi = companyApi ?? CompanyApi();

  final AssetsApi _assetsApi;
  final AlertsApi _alertsApi;
  final CompanyApi _companyApi;

  /// Provides a [Future] of all companies.
  Future<Tuple2<List<CompanyOwnerRepo>, int>> getAllCompaniesQuerry({
    String? token,
    Map<String, Object>? query,
  }) async {
    //Hive.init('/data/hive');
    final token = Hive.box<dynamic>('login').get('token') as String?;

    final companiesResult = await _companyApi.getCompaniesQuerry(
      token: token ?? '',
      query: {},
    );
    final companiesR = companiesResult.item1;
    final companiesStatusCode = companiesResult.item2;
    final companies = <CompanyOwnerRepo>[];
    for (final company in companiesR.result) {
      companies.add(CompanyOwnerRepo(
        id: company.id,
        name: company.name,
        ctry: company.ctry,
      ));
    }
    if (companiesStatusCode == 200) print('companies: ${companies.length}');
    return Tuple2(companies, companiesStatusCode);
  }

  /// Provides a [Future] of all fleets.
  Future<Tuple2<List<Fleet>, int>> getAllFleetsQuerry({
    String? token,
    Map<String, Object>? query,
    //List<Fleet>? fleetList,
  }) async {
    //Hive.init('/data/hive');
    final token = Hive.box<dynamic>('login').get('token') as String?;

    final fleetsResult = await _assetsApi.getFleetsQuerry(
      token: token ?? '',
      query: {},
    );
    final fleetsR = fleetsResult.item1.result;
    final fleetsStatusCode = fleetsResult.item2;
    if (fleetsStatusCode == 200) print('fleet: ${fleetsR.length}');
    return Tuple2(fleetsR, fleetsStatusCode);
  }

  /// Provides a [Future] of all assets.
  Future<Tuple4<List<Asset>, Map<String, RtRepo?>, int, List<String>>>
      getAllAssetsQuerry({
    String? token,
    Map<String, Object>? query,
    List<Fleet>? fleetList,
  }) async {
    // Hive.init('/data/hive');
    final token = Hive.box<dynamic>('login').get('token') as String?;
    final assetsResult = await _assetsApi.getAssetsQuerry(
      token: token ?? '',
      query: {},
    );
    final assetR = assetsResult.item1;
    final assetStatusCode = assetsResult.item2;
    final assets = <Asset>[];
    final assetsRt = <String, RtRepo?>{};
    final latLngList = <String>[];
    print('assetR: ${assetR.result.length}');
    for (final asset in assetR.result) {
      String latLng = '0,0';
      if (asset.rt?.loc?.coordinates != null &&
          asset.rt?.loc?.coordinates?.length == 2 &&
          asset.rt?.loc?.coordinates?[0] != null &&
          asset.rt?.loc?.coordinates?[1] != null &&
          asset.rt?.loc?.coordinates?[0] != 0 &&
          asset.rt?.loc?.coordinates?[1] != 0) {
        latLng =
            '${asset.rt?.loc?.coordinates?[0]},${asset.rt?.loc?.coordinates?[1]}';
      }
      latLngList.add(latLng);
      final rtrep = RtRepo(
          CANBUSDATA: asset.rt?.CANBUSDATA,
          CANBUSDATA_dt: asset.rt?.CANBUSDATA_dt,
          consL_Km: asset.rt?.consL_Km,
          gps_dt: asset.rt?.gps_dt,
          io_dt: asset.rt?.io_dt,
          last_stop_dt: asset.rt?.last_stop_dt,
          loc_dt: asset.rt?.loc_dt,
          odo: asset.rt?.odo,
          srv_dt: asset.rt?.srv_dt,
          uid: asset.rt?.uid,
          uid_dt: asset.rt?.uid_dt,
          working_time: asset.rt?.working_time,
          loc: asset.rt?.loc,
          io: asset.rt?.io,
          status: const RtRepo().getStatut(asset.rt?.io, asset.rt?.gps_dt),
          address: '',
          addressLocationDate: null);
      assetsRt[asset.id] = rtrep;
      final fleetIds = <String>[];
      if (fleetList != null) {
        for (final fleet in fleetList) {
          if (fleet.assets != null) {
            if (fleet.assets!.contains(asset.id)) {
              fleetIds.add(fleet.id);
            }
          }
        }
      }
      assets.add(asset.copyWith(fleet: fleetIds));
    }
    if (assetStatusCode == 200) print('assets: ${assets.length}');
    return Tuple4(assets, assetsRt, assetStatusCode, latLngList);
  }

  /// Provides a [Future] of all assetsIds.
  Future<Tuple2<List<String>, int>> getAssetsIdAgg({String? token}) async {
    // Hive.init('/data/hive');
    final token = Hive.box<dynamic>('login').get('token') as String?;
    final assetsResult = await _assetsApi.getAssetsIdAgg(
      token: token ?? '',
    );
    final assetIdsResponse = assetsResult.item1;
    final assetStatusCode = assetsResult.item2;
    final assetsIds = assetIdsResponse.result;
    //final assetsIds = assetsIdstemp.map((dynamic e) => e.toString()).toList();

    if (assetStatusCode == 200) print('assetsIds: ${assetsIds.length}');
    return Tuple2(assetsIds, assetStatusCode);
  }

  /// Provides a [Future] of all Assets by id
  Future<
      Tuple6<List<Asset>, Map<String, RtRepo?>, int, List<String>, List<String>,
          int>> getAllAssetsRtQuerry({
    String? token,
    Map<String, Object>? query,
    List<Fleet>? fleetList,
  }) async {
    // Hive.init('/data/hive');
    final token = Hive.box<dynamic>('login').get('token') as String?;
    final assetIds = await getAssetsIdAgg(token: token);
    if (assetIds.item2 != 200 || assetIds.item1.isEmpty) {
      return Tuple6([], {}, assetIds.item2, [], [], 500);
    }
    final assetsResult = await _assetsApi.getAssetsDriverQuerry(
      token: token ?? '',
      assetIds: assetIds.item1,
    );
    final alertsResult = await _alertsApi.getAlerts(
      token: token ?? '',
      assetIds: assetIds.item1,
    );
    final assetR = assetsResult.item1;
    final assetStatusCode = assetsResult.item2;
    final alertR = alertsResult.item1.result;
    final alertStatusCode = alertsResult.item2;
    final assets = <Asset>[];
    final assetsRt = <String, RtRepo?>{};
    final latLngList = <String>[];
    print('assetR: ${assetR.result.length}');
    print('alertR: ${alertR.length}');
    for (final asset in assetR.result) {
      String latLng = '0,0';
      if (asset.rt?.loc?.coordinates != null &&
          asset.rt?.loc?.coordinates?.length == 2 &&
          asset.rt?.loc?.coordinates?[0] != null &&
          asset.rt?.loc?.coordinates?[1] != null &&
          asset.rt?.loc?.coordinates?[0] != 0 &&
          asset.rt?.loc?.coordinates?[1] != 0) {
        latLng =
            '${asset.rt?.loc?.coordinates?[0]},${asset.rt?.loc?.coordinates?[1]}';
      }
      final alertList = alertStatusCode == 200
          ? alertR
              .where((Alert alert) => alert.assetId?.id == asset.id)
              .toList()
          : <Alert>[];
      latLngList.add(latLng);
      final rtrep = RtRepo(
        CANBUSDATA: asset.rt?.CANBUSDATA,
        CANBUSDATA_dt: asset.rt?.CANBUSDATA_dt,
        consL_Km: asset.rt?.consL_Km,
        gps_dt: asset.rt?.gps_dt,
        io_dt: asset.rt?.io_dt,
        last_stop_dt: asset.rt?.last_stop_dt,
        loc_dt: asset.rt?.loc_dt,
        odo: asset.rt?.odo,
        srv_dt: asset.rt?.srv_dt,
        uid: asset.rt?.uid,
        uid_dt: asset.rt?.uid_dt,
        working_time: asset.rt?.working_time,
        loc: asset.rt?.loc,
        io: asset.rt?.io,
        status: const RtRepo().getStatut(asset.rt?.io, asset.rt?.gps_dt),
        address: '',
        addressLocationDate: null,
        driver: asset.driver,
        alerts: alertList,
      );
      assetsRt[asset.id] = rtrep;
      final fleetIds = <String>[];
      if (fleetList != null) {
        for (final fleet in fleetList) {
          if (fleet.assets != null) {
            if (fleet.assets!.contains(asset.id)) {
              fleetIds.add(fleet.id);
            }
          }
        }
      }
      assets.add(asset.copyWith(fleet: fleetIds));
    }
    if (assetStatusCode == 200) print('assets: ${assets.length}');
    return Tuple6(assets, assetsRt, assetStatusCode, latLngList, assetIds.item1,
        alertStatusCode);
  }

  /// Provides a [Future] of address to a single asset via nominatim api
  Future<String> getAdress(double lat, double lng, String? language) async {
    Place? placeN = null;
    String address = '';

    try {
      await Future<dynamic>.delayed(const Duration(seconds: 1));
      placeN = await Nominatim.reverseSearch(
        lat: lat,
        lon: lng,
        addressDetails: false,
        extraTags: false,
        nameDetails: false,
        language: language ?? 'fr',
      );
      address = placeN.displayName;
    } catch (e) {
      print(e);
      address = '';
    }
    return address;
  }

  /// Provides a [Future] of list of address via benomad
  Future<List<String>> getAllAdress(
      {required List<String> latLngList,
      String? radius,
      String? action,
      String? language}) async {
    final List<String> adressList = [];
    try {
      //await Future<dynamic>.delayed(const Duration(seconds: 5));
      final batchResult = await BenomadApi.reverseGeoBatch(
          xy: latLngList,
          radius: radius,
          action: action,
          language: language ?? 'fr');

      for (final batchElemnt in batchResult) {
        bool elementExist = false;
        if (batchElemnt.elements?.element != null &&
            batchElemnt.elements!.count != null &&
            batchElemnt.elements!.count! > 0) {
          elementExist = true;
        }
        //print(batchElemnt.elements?.element?.first.postaladdress?.toJson());
        final adressData = elementExist
            ? batchElemnt.elements?.element?.first.postaladdress
            : null;
        final adress = adressData != null
            ? '${adressData.streetnumber} ${adressData.street} ${adressData.district} ${adressData.city}'
            : '';

        final fullAdress = adress.isNotEmpty
            ? '${adress}, ${adressData?.country}'
            : '${adressData?.country}';
        adressList.add(fullAdress);
      }
      //print(adressList);
    } catch (e) {
      print('getAllAdressException: $e');
    }

    return adressList.isNotEmpty
        ? adressList
        : List.filled(latLngList.length, '');
  }
}

// **************************************************************************
void main() async {
  //const encoder = JsonEncoder.withIndent('  ');
  final assetRepository = AssetRepository();
  /* final assets = await assetRepository.getAllAssetsQuerry(
    token: Environment.token,
  );

  print(assets.item1.first); */
  //print(assets.item2);
  //print(assetRepository.status.listen(print));

  /* final prettyprint = encoder.convert(assets.item2[assets.item1.first.id]);
  print(prettyprint); */

  final assetIDs = await assetRepository.getAssetsIdAgg(
    token: Environment.token,
  );
  print(assetIDs.item1);
  final adress = await assetRepository
      .getAllAdress(latLngList: ['10.206445,36.839105', '10.201485,36.839121']);
  print(adress);
}
