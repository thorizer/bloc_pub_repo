part of 'asset_bloc.dart';

@immutable
abstract class AssetEvent extends Equatable {
  const AssetEvent();

  @override
  List<Object> get props => [];
}

class SocketStatusChanged extends AssetEvent {
  const SocketStatusChanged(this.status);

  final SocketConnectionStatus status;

  @override
  List<Object> get props => [status];
}

class AssetsLoaded extends AssetEvent {}

class FleetSelected extends AssetEvent {
  const FleetSelected(this.fleet);
  final Fleet fleet;

  @override
  List<Object> get props => [fleet.id];
}

class CompanySelected extends AssetEvent {
  const CompanySelected(this.company);
  final CompanyOwnerRepo company;

  @override
  List<Object> get props => [company.id];
}

class RtAssetsLoaded extends AssetEvent {}

class RtAdressLoaded extends AssetEvent {}

class SetLanguage extends AssetEvent {
  const SetLanguage(this.language);
  final String language;

  @override
  List<Object> get props => [language];
}

class AssetFliterChanged extends AssetEvent {
  const AssetFliterChanged(
      this.searchAsset, this.filterStatusGYRB, this.filterType);
  final String searchAsset;
  final String filterStatusGYRB;
  final String filterType;

  @override
  List<Object> get props => [searchAsset, filterStatusGYRB];
}

class RealtimeAssetSubscriptionRequested extends AssetEvent {
  const RealtimeAssetSubscriptionRequested();
}

class AlertSubscriptionRequested extends AssetEvent {
  const AlertSubscriptionRequested();
}

class AssetListViewChanged extends AssetEvent {
  const AssetListViewChanged();

  @override
  List<Object> get props => [];
}

class AssetMapNavigateToAsset extends AssetEvent {
  const AssetMapNavigateToAsset(this.mapControllerState);
  final MapControllerState mapControllerState;
}

class AssetMapFollowAsset extends AssetEvent {
  const AssetMapFollowAsset(this.mapControllerState);
  final MapControllerState mapControllerState;
}
