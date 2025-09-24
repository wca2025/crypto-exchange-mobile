part of 'role_bloc.dart';

@freezed
class RoleState with _$RoleState {
  const factory RoleState.initial() = _Initial;
  const factory RoleState.loading() = _LoadingRole;
  const factory RoleState.error() = _ErrorRole;
  const factory RoleState.success() = _SuccesRole;
const factory RoleState.displayroles()=_DisplayRoles;
const factory RoleState.displayspecificroles()=_DisplaySpecificRoles;

}

