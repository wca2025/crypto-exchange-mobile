import '../../../presentation/pro/add_payment_method.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repositories/paymentmethod_repository.dart';

part 'paymentmethod_event.dart';
part 'paymentmethod_state.dart';
part 'paymentmethod_bloc.freezed.dart';

class PaymentmethodBloc extends Bloc<PaymentmethodEvent, PaymentmethodState> {
  PaymentmethodBloc() : super(PaymentmethodState.initial()) {
    List<PaymentMethod> paymentmethods = [];

    on<_FetchPaymentMethodListEvent>((event, emit) {
      // paymentmethods = await PaymentmethodRepository.readAllPayments();
      //     emit(DisplayPaymentMethods(paymentmethod: paymentmethods));
    });

    on<_FetchPaymentMethodByIdEvent>((event, emit) {
//  PaymentMethod paymentmethod = await PaymentmethodRepository.readPayment(id: event.id);
//       emit(DisplaySpecificPayment(paymentmethod: paymentmethod));
    });

    on<_AddPaymentMethodEvent>((event, emit) {
      // await PaymentmethodRepository.CreatePaymentMethod( PaymentMethodRepository(createdTime: event.createdTime));
    });
    on<_UpdatePaymentMethodEvent>((event, emit) {
      // TODO: implement event handler
      // await PaymentmethodRepository.UpdatePaymentMethod( paymentmethod: event.paymentmethod, );
    });

    on<_DeletePaymentMethodEvent>((event, emit) {
      // TODO: implement event handler
      //   await PaymentmethodRepository.DeletePaymentMethod(id: event.id);
      // add(const PaymentMethods());
    });
  }
}
