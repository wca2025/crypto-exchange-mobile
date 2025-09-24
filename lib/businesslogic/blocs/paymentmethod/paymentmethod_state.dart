part of 'paymentmethod_bloc.dart';

@freezed
class PaymentmethodState with _$PaymentmethodState {
  const factory PaymentmethodState.initial() = _InitialPaymentMethodState;
    const factory PaymentmethodState.loading() = _LoadingPaymentMethodState;
  const factory PaymentmethodState.error() = _ErrorPaymentMethodState;
  const factory PaymentmethodState.success() = _SuccessPaymentMethodState;
const factory PaymentmethodState.displaypaymentmethods()=_DisplayPaymentMethods;
const factory PaymentmethodState.displayspecificpaymentmethods()=_DisplaySpecificPaymentMethods;


}
