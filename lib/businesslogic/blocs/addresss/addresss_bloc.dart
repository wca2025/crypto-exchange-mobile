import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/addresss.dart';
import '../../../data/repositories/addresss_repository.dart';

part 'addresss_event.dart';
part 'addresss_state.dart';
part 'addresss_bloc.freezed.dart';

class AddresssBloc extends Bloc<AddresssEvent, AddresssState> {
  AddresssBloc() : super(AddresssState.initial()) {
 

    // List<Addresss> address = [];


    on<_FetchAddresssListEvent>((event, emit) async {
      // addresses = await AddresssRepository.getAddressList();
      // emit(FetchList(address: addresses));
    });

    on<_FetchAddresssByIdEvent>((event, emit) async {
      // Address address = await AddresssRepository.getAddressById(id: event.id);
      // emit(FetchSpecificAddress(address: address));
    });

    on<_AddAddresssEvent>((event, emit) async {
      // await AddresssRepository.addAddress(
      //   Address(
      //     createdTime: event.createdTime,
      //     description: event.description,
      //     isImportant: event.isImportant,
      //     number: event.number,
      //     title: event.title,
      //   ),
      // );
    }); 

    on<_UpdateAddresssEvent>((event, emit) async {
      // await AddresssRepository.updateAddress(
      //   address: event.address,
      // );
    });


    on<_DeleteAddresssEvent>((event, emit) async {
      // await AddresssRepository.deleteAddress(id: event.id);
      // add(const FetchAddress());
    });
    
  }






}
