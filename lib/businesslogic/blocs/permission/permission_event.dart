part of 'permission_bloc.dart';

@freezed
class PermissionEvent with _$PermissionEvent {
   const factory PermissionEvent.fetchpermissionlist() = _FetchPermissionListEvent;
  const factory PermissionEvent.fetchpermissionbyid() = _FetchPermissionByIdEvent;
  const factory PermissionEvent.addpermission() = _AddPermissionEvent;
  const factory PermissionEvent.updatepermission() = _UpdatePermissionEvent;
  const factory PermissionEvent.deletepermission() = _DeletePermissionEvent;

}





