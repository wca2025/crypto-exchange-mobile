import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/collection.dart';

part 'collection_event.dart';
part 'collection_state.dart';
part 'collection_bloc.freezed.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionState.initial()) {
   List<Collection> collection = [];

    on<_FetchCollectionListEvent>((event, emit) async {
      // collection = await CollectionRepository.readAllCollections();
      // emit(DisplayCollections(collection: collections));
    });

    on<_FetchCollectionByIdEvent>((event, emit) async {
      // Collection collection = await CollectionRepository.readCollection(id: event.id);
      // emit(DisplaySpecificCollection(collection: collection));
    });

  }
}
