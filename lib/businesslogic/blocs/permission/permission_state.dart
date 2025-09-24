part of 'permission_bloc.dart';

@freezed
class PermissionState with _$PermissionState {
  const factory PermissionState.initial() = _InitialState;
    const factory PermissionState.loading() = _LoadingPermissionState;
  const factory PermissionState.error() = _ErrorPermissionState;
  const factory PermissionState.success() = _SuccessPermissionState;
const factory PermissionState.displaypermissions()=_DisplayPermissionsState;
const factory PermissionState.displayspecificpermissions()=_DisplaySpecificPermissionsState;

}
 
