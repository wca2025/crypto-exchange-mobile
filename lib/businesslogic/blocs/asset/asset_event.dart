part of 'asset_bloc.dart';

@freezed
class AssetEvent with _$AssetEvent {
  const factory AssetEvent.initial() =_InitialAssetEvent;
  const factory AssetEvent.fetchassetbyid() = _FetchAssetByIdEvent;
  const factory AssetEvent.fetchassetlist() = _FetchAssetListEvent;
  const factory AssetEvent.addasset() = _AddAssetEvent;
  const factory AssetEvent.updateasset() = _UpdateAssetEvent;
  const factory AssetEvent.deleteasset() = _DeleteAssetEvent;






}





