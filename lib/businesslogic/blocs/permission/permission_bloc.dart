import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/permission.dart';
import '../../../data/repositories/permission_repository.dart';

part 'permission_event.dart';
part 'permission_state.dart';
part 'permission_bloc.freezed.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(_InitialState()) {
   List<Permission> permissions = [];

    on<_FetchPermissionListEvent>((event, emit) async {
      // roles = await PermissionRepository.readAllPermission();
      // emit(DisplayPermissions(permission: permissions));
    });

    on<_FetchPermissionByIdEvent>((event, emit) async {
      // Permission permission = await PermissionRepository.readPermission(id: event.id);
      // emit(DisplaySpecificPermission(permission: permission));
    });

   

   
  }
}
