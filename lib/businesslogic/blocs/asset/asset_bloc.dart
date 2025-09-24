import '../../../data/dataproviders/asset_provider.dart';
import '../../../data/repositories/asset_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/asset.dart';

part 'asset_event.dart';
part 'asset_state.dart';
part 'asset_bloc.freezed.dart';

class AssetBloc extends Bloc<AssetEvent, AssetState> {
  AssetBloc() : super(AssetState.initial()) {
    //  List<Asset> asset = [];

    on<_FetchAssetListEvent>((event, emit) async {
      // Assets = await AssetRepository.getAssetList();
      // emit(_FetchList(asset: Assets));
    });

    on<_FetchAssetByIdEvent>((event, emit) async {
      // Asset asset = await AssetRepository.getAssetById(id: event.id);
      // emit(_FetchSpecificAsset(asset: asset));
    });

    on<_AddAssetEvent>((event, emit) async {
      // await AssetRepository.addAddress(
      //   Asset(
      //     createdTime: event.createdTime,
      //     description: event.description,
      //     isImportant: event.isImportant,
      //     number: event.number,
      //     title: event.title, id: null,
      //   ),
      // );
    });

    on<_UpdateAssetEvent>((event, emit) async {
      // await AssetRepository.updateAddress(
      //   asset: event.asset,
      // );
    });

    on<_DeleteAssetEvent>((event, emit) async {
      // await AssetRepository.deleteAsset(id: event.id);
      // add(const FetchAsset());
    });
  }
}
