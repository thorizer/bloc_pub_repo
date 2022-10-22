// ignore_for_file: lines_longer_than_80_chars

part of 'asset_bloc.dart';

enum DataStatus { initial, success, failure, Unauthorized, retry }

enum AdressStatus { initial, success }

enum RealtimeStatus { initial, success, outdated }

enum MapAssetEvent {
  none,
  navigateToAsset,
  zoomIn,
  zoomOut,
  fitBounds,
  refresh,
  followAsset
}

class AssetState extends Equatable {
  const AssetState({
    this.dataStatus = DataStatus.initial,
    this.rtStatus = RealtimeStatus.initial,
    this.socketStatus = SocketConnectionStatus.disconnected,
    this.adressStatus = AdressStatus.initial,
    this.assets = const <Asset>[],
    this.realtimeData = const <String, RtRepo?>{},
    this.latLngList = const <String>[],
    this.lastRtGps = null,
    this.lastFleetRtGps = null,
    this.lastAlert = null,
    this.companiesList = const <CompanyOwnerRepo>[],
    this.fleets = const <Fleet>[],
    this.selectedCompany,
    this.selectedFleet,
    this.companyFleets = const <Fleet>[],
    this.companyAssets = const <Asset>[],
    this.fleetAssets = const <Asset>[],
    this.filteredAssets = const <Asset>[],
    this.filteredAssetsChanged,
    this.searchAsset = '',
    this.filterStatusGYRB = '1111',
    this.sidebarStandardView = true,
    this.mapControllerState = const MapControllerState(
      id: 0,
      assetID: null,
      location: null,
      mapEvent: MapAssetEvent.none,
    ),
    this.assetIds = const <String>[],
    this.language = 'fr',
  });

  final DataStatus dataStatus;
  final RealtimeStatus rtStatus;
  final SocketConnectionStatus socketStatus;
  final AdressStatus adressStatus;
  final List<Asset> assets;
  final Map<String, RtRepo?> realtimeData;
  final List<String> latLngList;
  final String? lastRtGps;
  final String? lastFleetRtGps;
  final String? lastAlert;
  final List<CompanyOwnerRepo> companiesList;
  final List<Fleet> fleets;
  final CompanyOwnerRepo? selectedCompany;
  final Fleet? selectedFleet;
  final List<Fleet> companyFleets;
  final List<Asset> companyAssets;
  final List<Asset> fleetAssets;
  final List<Asset> filteredAssets;
  final String? filteredAssetsChanged;
  final String searchAsset;
  final String filterStatusGYRB;
  final bool sidebarStandardView;
  final MapControllerState mapControllerState;
  final List<String> assetIds;
  final String? language;

  /*  @override
  String toString() =>
      'AssetState(selectedFleet: ${selectedFleet?.name},  status: $status, lastRtGps: $lastRtGps,   assets: ${assets.length}  fleets: ${fleets.length} fleetAssets: ${fleetAssets.length})'; */

  @override
  String toString() =>
      'AssetState(Language: ${language} Company: ${selectedCompany?.name}, Fleet: ${selectedFleet?.name}, lastRtdate: ${lastRtGps?.split('_')[1]}, assetId: ${lastRtGps?.split('_')[0]}, lastEventdate: ${lastRtGps?.split('_')[2]}, lastFleetEventdate: ${lastFleetRtGps != null && lastFleetRtGps!.isNotEmpty ? lastFleetRtGps?.split('_')[2] : 'null'}, DataStatus: $dataStatus, RtStatus: $rtStatus, AdressStatus: $adressStatus,  companies: ${companiesList.length}, assets: ${assets.length},  fleets: ${fleets.length}, fleetAssets: ${fleetAssets.length}), filtredAssets: ${filteredAssets.length}, adress: ${realtimeData['61c585a637750d7a716f7841']?.address}, searchAsset: $searchAsset, filterStatusGYRB: $filterStatusGYRB, sidebarStandardView: $sidebarStandardView, mapControllerState: $mapControllerState, assetIds: ${assetIds.length})';

  AssetState copyWith(
      {

      /// The current status of the asset bloc
      DataStatus? dataStatus,

      /// The current status of the realtime bloc
      RealtimeStatus? rtStatus,

      /// The status of the socket connection
      SocketConnectionStatus? socketStatus,

      /// The current status of the adress bloc
      AdressStatus? adressStatus,

      ///  list of all assets
      List<Asset>? assets,

      /// map of assets ids and their realtime data
      Map<String, RtRepo?>? realtimeData,

      /// list of cordinates loaded from rt data
      List<String>? latLngList,

      /// last realtime gps date
      String? lastRtGps,

      /// last realtime gps date of the fleet
      String? lastFleetRtGps,

      /// last realtime alert date
      String? lastAlert,

      /// list of all Companies(
      List<CompanyOwnerRepo>? companiesList,

      /// list of fleets
      List<Fleet>? fleets,

      /// the selected company
      CompanyOwnerRepo? selectedCompany,

      /// the selected fleet
      Fleet? selectedFleet,

      /// list of filtered fleets
      List<Fleet>? companyFleets,

      /// list of company assets
      List<Asset>? companyAssets,

      /// list of assets of the selected fleet
      List<Asset>? fleetAssets,

      /// list of filtered assets
      List<Asset>? filteredAssets,

      /// filtered assets changed
      String? filteredAssetsChanged,

      /// search asset
      String? searchAsset,

      /// filter asset status
      String? filterStatusGYRB,

      /// sidebar standard view
      bool? sidebarStandardView,

      /// map controller
      MapControllerState? mapControllerState,

      /// lunguage
      String? lunguage,

      /// list of asset ids
      List<String>? assetIds,

      /// language
      String? language}) {
    return AssetState(
      dataStatus: dataStatus ?? this.dataStatus,
      rtStatus: rtStatus ?? this.rtStatus,
      socketStatus: socketStatus ?? this.socketStatus,
      adressStatus: adressStatus ?? this.adressStatus,
      assets: assets ?? this.assets,
      realtimeData: realtimeData ?? this.realtimeData,
      latLngList: latLngList ?? this.latLngList,
      lastRtGps: lastRtGps ?? this.lastRtGps,
      lastFleetRtGps: lastFleetRtGps ?? this.lastFleetRtGps,
      lastAlert: lastAlert ?? this.lastAlert,
      companiesList: companiesList ?? this.companiesList,
      fleets: fleets ?? this.fleets,
      selectedFleet: selectedFleet ?? this.selectedFleet,
      selectedCompany: selectedCompany ?? this.selectedCompany,
      companyFleets: companyFleets ?? this.companyFleets,
      companyAssets: companyAssets ?? this.companyAssets,
      fleetAssets: fleetAssets ?? this.fleetAssets,
      filteredAssets: filteredAssets ?? this.filteredAssets,
      filteredAssetsChanged:
          filteredAssetsChanged ?? this.filteredAssetsChanged,
      searchAsset: searchAsset ?? this.searchAsset,
      filterStatusGYRB: filterStatusGYRB ?? this.filterStatusGYRB,
      sidebarStandardView: sidebarStandardView ?? this.sidebarStandardView,
      mapControllerState: mapControllerState ?? this.mapControllerState,
      assetIds: assetIds ?? this.assetIds,
      language: language ?? this.language,
    );
  }

  @override
  List<Object?> get props => [
        socketStatus,
        rtStatus,
        adressStatus,
        dataStatus,
        lastRtGps,
        lastFleetRtGps,
        lastAlert,
        selectedFleet?.id,
        selectedCompany?.id,
        searchAsset,
        filteredAssetsChanged,
        filterStatusGYRB,
        sidebarStandardView,
        mapControllerState.id,
        language
      ];
}

class MapControllerState extends Equatable {
  const MapControllerState({
    required this.id,
    this.mapEvent = MapAssetEvent.none,
    this.assetID = null,
    this.location = null,
  });

  final int id;
  final MapAssetEvent mapEvent;
  final String? assetID;
  final LatLng? location;

  @override
  String toString() =>
      'MapControllerState(mapEvent: $mapEvent, assetID: $assetID, location: $location)';

  MapControllerState copyWith({
    int? id,
    MapAssetEvent? mapEvent,
    String? assetID,
    LatLng? location,
  }) {
    return MapControllerState(
      id: id ?? this.id,
      mapEvent: mapEvent ?? MapAssetEvent.none,
      assetID: assetID ?? this.assetID,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
