part of 'collection_bloc.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState.initial() = _InitialStatee;
    const factory CollectionState.loading() = _LoadingCollectionState;
  const factory CollectionState.error() = _ErrorCollectionState;
  const factory CollectionState.success() = _SuccesCollectionState;
const factory CollectionState.displaycollections()=_DisplayCollection;
const factory CollectionState.displayspecificcollections()=_DisplaySpecificCollections;


}

