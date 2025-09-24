part of 'collection_bloc.dart';

@freezed
class CollectionEvent with _$CollectionEvent {
   const factory CollectionEvent.fetchcollectionist() = _FetchCollectionListEvent;
  const factory CollectionEvent.fetchcollectionbyid() = _FetchCollectionByIdEvent;
  const factory CollectionEvent.addcollection() = _AddCollectionEvent;
  const factory CollectionEvent.updatecollection() = _UpdateCollectionEvent;
  const factory CollectionEvent.deletecollection() = _DeleteCollectionEvent;

}