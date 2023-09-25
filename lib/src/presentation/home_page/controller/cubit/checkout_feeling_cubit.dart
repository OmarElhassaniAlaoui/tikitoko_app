import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkout_feeling_state.dart';

class CheckoutFeelingCubit extends Cubit<CheckoutFeelingState> {
  CheckoutFeelingCubit() : super(CheckoutFeelingInitial());
}
