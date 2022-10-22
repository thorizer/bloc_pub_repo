// ignore_for_file: lines_longer_than_80_chars, avoid_print
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ngi_repository/ngi_repository.dart';
import 'package:latlong2/latlong.dart';
import 'package:tuple/tuple.dart';
part 'asset_event.dart';
part 'asset_state.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  AssetBloc({
    required AssetRepository assetRepository,
  })  : _assetRepository = assetRepository,
        super(const AssetState()) {
    on<RtAssetsLoaded>(_onRtAssetsLoaded);
    on<RtAdressLoaded>(_onRtAdressLoaded);
    on<SetLanguage>(_onSetLanguage);
    on<FleetSelected>(_onFleetSelected);
    on<CompanySelected>(_onCompanySelected);
    on<AssetFliterChanged>(_onAssetFliterChanged);
    on<RealtimeAssetSubscriptionRequested>(
      _onRealtimeAssetSubscriptionRequested,
    );
    on<AlertSubscriptionRequested>(_onAlertSubscriptionRequested);
    on<AssetListViewChanged>(_onAssetListViewChanged);
    on<AssetMapNavigateToAsset>(_onAssetMapNavigateToAsset);
    on<AssetMapFollowAsset>(_onAssetMapFollowAsset);
    on<SocketStatusChanged>(_onSocketStatusChanged);
    _SocketStatusSubscription = SocketApi.socketStatus.listen(
      (status) => add(SocketStatusChanged(status)),
    );
  }
  final AssetRepository _assetRepository;
  // ignore: unused_field
  late StreamSubscription<SocketConnectionStatus> _SocketStatusSubscription;
  void _onSocketStatusChanged(
    SocketStatusChanged event,
    Emitter<AssetState> emit,
  ) async {
    //print(event.status);
    switch (event.status) {
      case SocketConnectionStatus.disconnected:
        return emit(
            state.copyWith(socketStatus: SocketConnectionStatus.disconnected));
      case SocketConnectionStatus.connected:
        return emit(
            state.copyWith(socketStatus: SocketConnectionStatus.connected));
      case SocketConnectionStatus.connecting:
        return emit(
            state.copyWith(socketStatus: SocketConnectionStatus.connecting));
      case SocketConnectionStatus.Unauthorized:
        return emit(
            state.copyWith(socketStatus: SocketConnectionStatus.Unauthorized));
      case SocketConnectionStatus.error:
        return emit(state.copyWith(socketStatus: SocketConnectionStatus.error));
      case SocketConnectionStatus.closed:
        return emit(
            state.copyWith(socketStatus: SocketConnectionStatus.closed));
      case SocketConnectionStatus.reconnecting:
        return emit(
            state.copyWith(socketStatus: SocketConnectionStatus.reconnecting));
      case SocketConnectionStatus.unknown:
        return emit(
            state.copyWith(socketStatus: SocketConnectionStatus.unknown));
      default:
        return;
    }
  }

  Future<void> _onRtAssetsLoaded(
    RtAssetsLoaded event,
    Emitter<AssetState> emit,
  ) async {
    if (state.fleets.isEmpty ||
        state.assets.isEmpty ||
        state.companiesList.isEmpty) {
      if (state.dataStatus != DataStatus.initial) {
        emit(state.copyWith(dataStatus: DataStatus.retry));
      }
      //companies
      final companiesTupple = state.companiesList.isEmpty
          ? await _assetRepository.getAllCompaniesQuerry()
          : Tuple2(state.companiesList, 200);
      final companies = companiesTupple.item1;
      final companiesStatusCode = companiesTupple.item2;
      //fleet
      final fleetsTupple = state.fleets.isEmpty
          ? await _assetRepository.getAllFleetsQuerry()
          : Tuple2(state.fleets, 200);
      final fleets = fleetsTupple.item1;
      final fleetStatusCode = fleetsTupple.item2;
      //assets
      late Tuple6<List<Asset>, Map<String, RtRepo?>, int, List<String>,
          List<String>, int> assetsTupple;
      if (state.assets.isEmpty) {
        if (fleetStatusCode == 200)
          assetsTupple =
              await _assetRepository.getAllAssetsRtQuerry(fleetList: fleets);
        else
          assetsTupple = Tuple6([], <String, RtRepo?>{}, 500, [], [], 500);
      } else {
        assetsTupple = Tuple6(state.assets, state.realtimeData, 200,
            state.latLngList, state.assetIds, 200);
      }
      final assets = assetsTupple.item1;
      final assetsRealtimeData = assetsTupple.item2;
      final assetStatusCode = assetsTupple.item3;
      final latLngList = assetsTupple.item4;
      final assetIds = assetsTupple.item5;
      final alertStatusCode = assetsTupple.item6;
      // DataStatus
      late DataStatus newStatus;
      if (companiesStatusCode == 200 &&
          fleetStatusCode == 200 &&
          assetStatusCode == 200 &&
          alertStatusCode == 200 &&
          assets.isNotEmpty &&
          fleets.isNotEmpty &&
          companies.isNotEmpty &&
          assetsRealtimeData.isNotEmpty) {
        newStatus = DataStatus.success;
      } else if (companiesStatusCode == 401 ||
          fleetStatusCode == 401 ||
          assetStatusCode == 401) {
        newStatus = DataStatus.Unauthorized;
      } else {
        newStatus = DataStatus.failure;
      }
      // companies transform data
      late List<CompanyOwnerRepo> companiesSorted;
      late CompanyOwnerRepo? selectedCompany;
      if (state.companiesList.isEmpty && companies.isNotEmpty) {
        companiesSorted = List.from(companies)
          ..sort((a, b) => a.name!.compareTo(b.name!));
        selectedCompany = companiesSorted.first;
      } else {
        companiesSorted = state.companiesList;
        selectedCompany = state.selectedCompany;
      }
      // fleets transform data
      late List<Fleet> companyFleets;
      late List<Fleet> companyFleetsSorted;
      late Fleet? selectedFleet;
      if ((state.fleets.isEmpty &&
              fleets.isNotEmpty &&
              selectedCompany != null) ||
          state.fleets.isNotEmpty && state.selectedFleet == null) {
        companyFleets = fleets
            .where((fleet) => fleet.company_owner?.id == selectedCompany?.id)
            .toList();
        if (companyFleets.isNotEmpty) {
          companyFleetsSorted = List.from(companyFleets)
            ..sort((a, b) => a.name!.compareTo(b.name!));
          selectedFleet = companyFleetsSorted.first;
        } else {
          companyFleets = state.fleets;
          companyFleetsSorted = state.companyFleets;
          selectedFleet = state.selectedFleet;
        }
      } else {
        companyFleets = state.fleets;
        companyFleetsSorted = state.companyFleets;
        selectedFleet = state.selectedFleet;
      }
      // assets transform data
      late List<Asset> companyAssets;
      late List<Asset> fleetAssets;
      late List<Asset> fleetAssetsSortedByStatus;
      if ((state.assets.isEmpty && assets.isNotEmpty) ||
          (state.assets.isNotEmpty && state.selectedFleet == null) ||
          (state.assets.isNotEmpty && state.selectedCompany == null)) {
        companyAssets = selectedCompany != null
            ? assets
                .where((asset) => asset.company_owner == selectedCompany?.id)
                .toList()
            : state.companyAssets;
        fleetAssets = selectedFleet != null
            ? assets
                .where((asset) => asset.fleet!.contains(selectedFleet!.id))
                .toList()
            : state.fleetAssets;
        fleetAssetsSortedByStatus =
            RtRepo().SortByStatus(fleetAssets, assetsRealtimeData);
      } else {
        companyAssets = state.companyAssets;
        fleetAssets = state.fleetAssets;
        fleetAssetsSortedByStatus = state.fleetAssets;
      }
      emit(
        state.copyWith(
          assets: assets,
          realtimeData: assetsRealtimeData,
          rtStatus: RealtimeStatus.success,
          fleets: fleets,
          companiesList: companiesSorted,
          selectedCompany: selectedCompany,
          companyFleets: companyFleetsSorted,
          companyAssets: companyAssets,
          fleetAssets: fleetAssetsSortedByStatus,
          selectedFleet: selectedFleet,
          dataStatus: newStatus,
          filteredAssets: fleetAssetsSortedByStatus,
          latLngList: latLngList,
          assetIds: assetIds,
        ),
      );
    }
  }

  Future<void> _onRtAdressLoaded(
    RtAdressLoaded event,
    Emitter<AssetState> emit,
  ) async {
    int i = 0;
    int j = 0;
    final assetLength = state.assets.length;
    final latLngLength = state.latLngList.length;
    final partValue = 150;
    int max = (assetLength / partValue).ceil();
    //int lastPart = assetLength % 300;
    final adressList = <String>[];
    try {
      for (j = 0; j < max; j++) {
        final latLng = j == max - 1
            ? state.latLngList.sublist(j * partValue, latLngLength)
            : state.latLngList.sublist(j * partValue, (j + 1) * partValue);
        await Future<dynamic>.delayed(Duration(seconds: 1));
        //print("language adress: ${state.language}");
        final adressPart = await _assetRepository.getAllAdress(
            latLngList: latLng, radius: '500');
        //print(adressPart.length);
        adressList.addAll(adressPart);
      }
      print(adressList.length);
      print(state.latLngList.length);
      if (adressList.length == state.latLngList.length) print('EQUAL');
      if (adressList.isNotEmpty) {
        for (final asset in state.assets) {
          state.realtimeData[asset.id] = state.realtimeData[asset.id]?.copyWith(
              address: adressList[i],
              addressLocationDate: AddressDateStatus.recent);
          i++;
        }
      }
    } catch (e) {
      print('_onRtAdressLoadedException: $e');
      if (adressList.isNotEmpty) {
        for (final asset in state.assets) {
          state.realtimeData[asset.id] = state.realtimeData[asset.id]?.copyWith(
              address: adressList[i],
              addressLocationDate: AddressDateStatus.recent);
          i++;
        }
      }
    } finally {
      emit(state.copyWith(
        adressStatus: AdressStatus.success,
      ));
      print("adressStatus success");
    }
  }

  Future<void> _onSetLanguage(
    SetLanguage event,
    Emitter<AssetState> emit,
  ) async {
    emit(state.copyWith(
      language: event.language,
    ));
  }

  Future<void> _onCompanySelected(
    CompanySelected event,
    Emitter<AssetState> emit,
  ) async {
    if (state.companiesList.isNotEmpty ||
        state.fleets.isNotEmpty ||
        state.assets.isNotEmpty) {
      final companyFleets = state.fleets
          .where((fleet) => fleet.company_owner?.id == event.company.id)
          .toList();
      final List<Fleet> companyFleetsSorted = List.from(companyFleets)
        ..sort((a, b) => a.name!.compareTo(b.name!));
      final selectedFleet =
          companyFleetsSorted.isNotEmpty ? companyFleetsSorted.first : null;
      final companyAssets = state.assets
          .where((asset) => asset.company_owner == event.company.id)
          .toList();
      final fleetAssets = companyFleets.isNotEmpty
          ? companyAssets
              .where((asset) => asset.fleet!.contains(selectedFleet!.id))
              .toList()
          : <Asset>[];
      final List<Asset> fleetAssetsSortedByStatus =
          RtRepo().SortByStatus(fleetAssets, state.realtimeData);
      emit(state.copyWith(
        lastFleetRtGps: '',
        selectedCompany: event.company,
        companyFleets: companyFleetsSorted,
        selectedFleet: selectedFleet,
        companyAssets: companyAssets,
        fleetAssets: fleetAssetsSortedByStatus,
        filteredAssets: fleetAssetsSortedByStatus,
        searchAsset: '',
        filterStatusGYRB: '1111',
      ));
    }
  }

  Future<void> _onFleetSelected(
    FleetSelected event,
    Emitter<AssetState> emit,
  ) async {
    print(state.assets.length);
    print(state.fleetAssets.length);
    if (state.fleets.isNotEmpty || state.assets.isNotEmpty) {
      final fleetAssets = state.companyAssets
          .where((asset) => asset.fleet!.contains(event.fleet.id))
          .toList();
      final List<Asset> fleetAssetsSortedByStatus =
          RtRepo().SortByStatus(fleetAssets, state.realtimeData);
      emit(
        state.copyWith(
          lastFleetRtGps: '',
          selectedFleet: event.fleet,
          fleetAssets: fleetAssetsSortedByStatus,
          filteredAssets: fleetAssetsSortedByStatus,
          searchAsset: '',
          filterStatusGYRB: '1111',
        ),
      );
    }
  }

  Future<void> _onAssetFliterChanged(
    AssetFliterChanged event,
    Emitter<AssetState> emit,
  ) async {
    if (event.filterType == 'search') {
      final List<String> statusList = [];
      if (state.filterStatusGYRB.isNotEmpty) {
        if (state.filterStatusGYRB[0] == '1') {
          statusList.add('drive');
        }
        if (state.filterStatusGYRB[1] == '1') {
          statusList.add('idle');
        }
        if (state.filterStatusGYRB[2] == '1') {
          statusList.add('stop');
        }
        if (state.filterStatusGYRB[3] == '1') {
          statusList.add('disabled');
        }
      }
      if (event.searchAsset.startsWith('id:')) {
        final filteredAssets = state.fleetAssets
            .where((asset) =>
                (asset.id == event.searchAsset.substring(3).trim()) &&
                (statusList
                    .contains(state.realtimeData[asset.id]!.status.toString())))
            .toList();
        emit(
          state.copyWith(
            searchAsset: event.searchAsset,
            filteredAssets: filteredAssets,
          ),
        );
      } else {
        final filteredAssets = state.fleetAssets
            .where((asset) =>
                ((asset.name!.toLowerCase().trim())
                    .contains(event.searchAsset.toLowerCase().trim())) &&
                (statusList
                    .contains(state.realtimeData[asset.id]!.status.toString())))
            .toList();
        emit(
          state.copyWith(
            filteredAssets: filteredAssets,
            searchAsset: event.searchAsset,
          ),
        );
      }
    } else if (event.filterType == 'status') {
      final List<String> statusList = [];
      if (event.filterStatusGYRB.isNotEmpty) {
        if (event.filterStatusGYRB[0] == '1') {
          statusList.add('drive');
        }
        if (event.filterStatusGYRB[1] == '1') {
          statusList.add('idle');
        }
        if (event.filterStatusGYRB[2] == '1') {
          statusList.add('stop');
        }
        if (event.filterStatusGYRB[3] == '1') {
          statusList.add('disabled');
        }
      }
      if (state.searchAsset.startsWith('id:')) {
        final filteredAssets = state.fleetAssets
            .where((asset) =>
                (asset.id == state.searchAsset.substring(3).trim()) &&
                (statusList
                    .contains(state.realtimeData[asset.id]!.status.toString())))
            .toList();
        emit(
          state.copyWith(
            filterStatusGYRB: event.filterStatusGYRB,
            filteredAssets: filteredAssets,
          ),
        );
      } else {
        //print(statusList);
        //print(state.searchAsset.toLowerCase().trim());
        final filteredAssets = state.fleetAssets
            .where((asset) => (statusList.contains(
                    state.realtimeData[asset.id]!.status.toString()) &&
                (asset.name!.toLowerCase().trim())
                    .contains(state.searchAsset.toLowerCase().trim())))
            .toList();
        emit(
          state.copyWith(
            filteredAssets: filteredAssets,
            filterStatusGYRB: event.filterStatusGYRB,
          ),
        );
      }
    }
  }

  // asset subscription
  Future<void> _onRealtimeAssetSubscriptionRequested(
    RealtimeAssetSubscriptionRequested event,
    Emitter<AssetState> emit,
  ) async {
    try {
      await SocketApi.init();
    } catch (e, s) {
      print(e);
      print(s);
    }
    await emit.onEach<Asset>(
      SocketApi.getAsset(),
      onData: (asset) async {
        if (state.selectedCompany != null &&
            state.selectedFleet != null &&
            state.fleetAssets.isNotEmpty) {
          String oldStatus = state.realtimeData[asset.id]?.status ?? 'disabled';
          String newStatus = RtRepo().getStatut(asset.rt?.io, asset.rt?.gps_dt);
          String adress = state.realtimeData[asset.id]?.address ?? '';
          AddressDateStatus? addressLocationDate;
          if (state.adressStatus == AdressStatus.success &&
              (oldStatus == 'drive' || newStatus == 'drive') &&
              asset.type != AssetType.warehouse) {
            String oldAdress = state.realtimeData[asset.id]?.address ?? '';
            String? newAdress;
            final lat = asset.rt?.loc?.coordinates?[1] ?? 0.0;
            final lng = asset.rt?.loc?.coordinates?[0] ?? 0.0;
            final latlng = lat.toString() + ',' + lng.toString();
            await Future<dynamic>.delayed(Duration(milliseconds: 500));
            final adressPart = await _assetRepository.getAllAdress(
                latLngList: [latlng],
                radius: '1000',
                action: 'revgeocoding',
                language: state.language);
            if (adressPart.first.isNotEmpty) {
              newAdress = adressPart.first;
            } else {
              final adressNominatim =
                  await _assetRepository.getAdress(lat, lng, null);
              if (adressNominatim.isNotEmpty) {
                newAdress = adressNominatim;
              } else {
                newAdress = state.realtimeData[asset.id]?.address ?? '';
              }
            }
            if (newAdress != 'null' && newAdress.trim() != '') {
              adress = newAdress.trim();
              addressLocationDate = AddressDateStatus.recent;
            } else {
              adress = oldAdress.trim();
              addressLocationDate = AddressDateStatus.outdated;
            }
          } else {
            addressLocationDate = adress.trim() != '' && adress != 'null'
                ? AddressDateStatus.recent
                : AddressDateStatus.outdated;
            if (asset.type == AssetType.warehouse)
              addressLocationDate = AddressDateStatus.recent;
          }
          final driver = state.realtimeData[asset.id]?.driver;
          final alerts = state.realtimeData[asset.id]?.alerts;
          bool assetInFleet = state.fleetAssets
              .where(
                  (assetInSelectedFleet) => assetInSelectedFleet.id == asset.id)
              .isNotEmpty;
          bool assetInFiltredAssets = state.filteredAssets
              .where(
                  (assetInSelectedFleet) => assetInSelectedFleet.id == asset.id)
              .isNotEmpty;
          MapControllerState? mapC = state.mapControllerState;
          if (state.mapControllerState.mapEvent == MapAssetEvent.followAsset &&
              state.mapControllerState.assetID == asset.id) {
            if (assetInFiltredAssets) {
              mapC = MapControllerState(
                  id: DateTime.now().microsecond,
                  mapEvent: MapAssetEvent.followAsset,
                  assetID: asset.id,
                  location: LatLng(asset.rt?.loc?.coordinates?[1] ?? 0.0,
                      asset.rt?.loc?.coordinates?[0] ?? 0.0));
            } else
              mapC = MapControllerState(
                  id: DateTime.now().microsecond,
                  mapEvent: MapAssetEvent.none,
                  assetID: asset.id,
                  location: LatLng(asset.rt?.loc?.coordinates?[1] ?? 0.0,
                      asset.rt?.loc?.coordinates?[0] ?? 0.0));
          }
          // check if asset in selected Fleet
          if (assetInFleet) {
            // check if asset status is Diffrent than last status,
            if (oldStatus != newStatus) {
              if (RtRepo().IsStatusActive(oldStatus, state.filterStatusGYRB) &&
                  !RtRepo().IsStatusActive(newStatus, state.filterStatusGYRB)) {
                final now = DateTime.now().toString();
                String lastRtGpsMsg =
                    '${asset.id}_${asset.rt?.gps_dt}_${now}_${asset.rt?.loc?.coordinates?[1]}_${asset.rt?.loc?.coordinates?[0]}';
                final filteredAssetsChanged = asset.id + '_' + now + '_remove';
                emit(
                  state.copyWith(
                    filteredAssetsChanged : filteredAssetsChanged,
                    filteredAssets: state.filteredAssets
                        .where((fasset) => fasset.id != asset.id)
                        .toList(),
                    lastRtGps: lastRtGpsMsg,
                    lastFleetRtGps: lastRtGpsMsg,
                    mapControllerState: mapC,
                  ),
                );
                state.realtimeData[asset.id] =
                    state.realtimeData[asset.id]?.copyWith(
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
                  status: newStatus,
                  address: adress,
                  driver: driver,
                  alerts: alerts,
                  addressLocationDate: addressLocationDate,
                );
              } else if (RtRepo()
                      .IsStatusActive(newStatus, state.filterStatusGYRB) &&
                  !RtRepo().IsStatusActive(oldStatus, state.filterStatusGYRB)) {
                // if asset status is active and not in filtered list
                if (state.filteredAssets
                        .where((fasset) => fasset.id == asset.id)
                        .isEmpty &&
                    (asset.name!.toLowerCase().trim())
                        .contains(state.searchAsset.toLowerCase().trim())) {
                  final now = DateTime.now().toString();
                  String lastRtGpsMsg =
                      '${asset.id}_${asset.rt?.gps_dt}_${now}_${asset.rt?.loc?.coordinates?[1]}_${asset.rt?.loc?.coordinates?[0]}';
                  state.realtimeData[asset.id] =
                      state.realtimeData[asset.id]?.copyWith(
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
                    status: newStatus,
                    address: adress,
                    driver: driver,
                    alerts: alerts,
                    addressLocationDate: addressLocationDate,
                  );
                  final filteredAssetsChanged = asset.id + '_' + now + '_add';
                  emit(
                    state.copyWith(
                      filteredAssetsChanged : filteredAssetsChanged,
                      filteredAssets: [...state.filteredAssets, asset],
                      lastRtGps: lastRtGpsMsg,
                      lastFleetRtGps: lastRtGpsMsg,
                      mapControllerState: mapC,
                    ),
                  );
                }
              } else {
                final now = DateTime.now().toString();
                String lastRtGpsMsg =
                    '${asset.id}_${asset.rt?.gps_dt}_${now}_${asset.rt?.loc?.coordinates?[1]}_${asset.rt?.loc?.coordinates?[0]}';
                state.realtimeData[asset.id] =
                    state.realtimeData[asset.id]?.copyWith(
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
                  status: newStatus,
                  address: adress,
                  driver: driver,
                  alerts: alerts,
                  addressLocationDate: addressLocationDate,
                );
                emit(
                  state.copyWith(
                    lastRtGps: lastRtGpsMsg,
                    lastFleetRtGps: lastRtGpsMsg,
                    mapControllerState: mapC,
                  ),
                );
              }
            } else {
              final now = DateTime.now().toString();
              String lastRtGpsMsg =
                  '${asset.id}_${asset.rt?.gps_dt}_${now}_${asset.rt?.loc?.coordinates?[1]}_${asset.rt?.loc?.coordinates?[0]}';
              state.realtimeData[asset.id] =
                  state.realtimeData[asset.id]?.copyWith(
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
                status: newStatus,
                address: adress,
                driver: driver,
                alerts: alerts,
                addressLocationDate: addressLocationDate,
              );
              emit(
                state.copyWith(
                  lastRtGps: lastRtGpsMsg,
                  lastFleetRtGps: lastRtGpsMsg,
                  mapControllerState: mapC,
                ),
              );
            }
          } else {
            final now = DateTime.now().toString();
            String lastRtGpsMsg =
                '${asset.id}_${asset.rt?.gps_dt}_${now}_${asset.rt?.loc?.coordinates?[1]}_${asset.rt?.loc?.coordinates?[0]}';
            state.realtimeData[asset.id] =
                state.realtimeData[asset.id]?.copyWith(
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
              status: newStatus,
              address: adress,
              driver: driver,
              alerts: alerts,
              addressLocationDate: addressLocationDate,
            );
            emit(state.copyWith(
              lastRtGps: lastRtGpsMsg,
            ));
          }
        }
      },
      onError: (e, s) {
        print(e);
        print(s);
      },
    );
  }

  // alert subscription
  Future<void> _onAlertSubscriptionRequested(
    AlertSubscriptionRequested event,
    Emitter<AssetState> emit,
  ) async {
    try {
      await SocketApi.init();
    } catch (e, s) {
      print(e);
      print(s);
    }
    await emit.onEach<Alert>(
      SocketApi.getAlert(),
      onData: (alert) async {
        if (state.selectedCompany != null &&
            state.selectedFleet != null &&
            state.fleetAssets.isNotEmpty) {
          final assetId = alert.assetId?.id ?? '';
          //print(assetId);
          /* final isAlertsNotEmpty =
              state.realtimeData[assetId]?.alerts?.isNotEmpty ?? false; */
          final alertList = state.realtimeData[assetId]?.alerts ?? [];
          //print(alert.id);
          state.realtimeData[assetId] =
              state.realtimeData[assetId]?.copyWith(alerts: [
            alert,
            ...alertList,
          ]);
          emit(
            state.copyWith(
              lastAlert: '${assetId}_${alert.id}',
            ),
          );
        }
      },
      onError: (e, s) {
        print(e);
        print(s);
      },
    );
  }

  Future<void> _onAssetListViewChanged(
    AssetListViewChanged event,
    Emitter<AssetState> emit,
  ) async {
    emit(state.copyWith(
      sidebarStandardView: !state.sidebarStandardView,
    ));
  }

  Future<void> _onAssetMapNavigateToAsset(
    AssetMapNavigateToAsset event,
    Emitter<AssetState> emit,
  ) async {
    emit(state.copyWith(mapControllerState: event.mapControllerState));
  }

  Future<void> _onAssetMapFollowAsset(
    AssetMapFollowAsset event,
    Emitter<AssetState> emit,
  ) async {
    emit(state.copyWith(mapControllerState: event.mapControllerState));
  }

  @override
  Future<void> close() async {
    await SocketApi.dispose();
    await _SocketStatusSubscription.cancel();
    return super.close();
  }
}
