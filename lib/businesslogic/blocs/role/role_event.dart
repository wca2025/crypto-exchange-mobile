part of 'role_bloc.dart';

@freezed
class RoleEvent with _$RoleEvent {
   const factory RoleEvent.fetchrolelist() = _FetchRoleList;
  const factory RoleEvent.fetchrolebyid() = _FetchRoleById;
  const factory RoleEvent.addrole() = _AddRole;
  const factory RoleEvent.updaterole() = _UpdateRole;
  const factory RoleEvent.deleterole() = _DeleteRole;

}