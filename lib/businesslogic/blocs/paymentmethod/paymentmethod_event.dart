part of 'paymentmethod_bloc.dart';

@freezed
class PaymentmethodEvent with _$PaymentmethodEvent {
  const factory PaymentmethodEvent.fetchpaymentmethodlist() = _FetchPaymentMethodListEvent;
  const factory PaymentmethodEvent.fetchpaymentmethodbyid() = _FetchPaymentMethodByIdEvent;
  const factory PaymentmethodEvent.addpaymentmethod() = _AddPaymentMethodEvent;
  const factory PaymentmethodEvent.updatepaymentmethod() = _UpdatePaymentMethodEvent;
  const factory PaymentmethodEvent.deletepaymentmethod() = _DeletePaymentMethodEvent;

}

