part of 'asset_bloc.dart';

@freezed
class AssetState with _$AssetState {
    const factory AssetState.initial() =_InitialAssetState;
  const factory AssetState.loading() = _LoadingAssetState;
    // const factory AssetState.success( List<Asset> asset ) = _SuccessAssetState;
  const factory AssetState.error(String error) = _ErrorAssetState;
const factory AssetState.displayassets()=_DisplayAssetState;
const factory AssetState.displayspecificassets()=_DisplaySpecificAssetState;

}



