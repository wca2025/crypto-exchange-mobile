import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/role.dart';
import '../../../data/repositories/role_repository.dart';

part 'role_event.dart';
part 'role_state.dart';
part 'role_bloc.freezed.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  RoleBloc() : super(_Initial()) {
   List<Role> roles = [];

    on<_FetchRoleList>((event, emit) async {
      // roles = await RoleRepository.readAllRoles();
      // emit(DisplayRoles(role: roles));
    });

    on<_FetchRoleById>((event, emit) async {
      // Role role = await RoleRepository.readRole(id: event.id);
      // emit(DisplaySpecificRole(role: role));
    });

   

   
  }
}
