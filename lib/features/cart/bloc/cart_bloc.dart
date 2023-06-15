import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample/data/cart_item.dart';
import 'package:bloc_sample/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveCartEvent>(cartRemoveCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItem));
  }

  FutureOr<void> cartRemoveCartEvent(
      CartRemoveCartEvent event, Emitter<CartState> emit) {
    cartItem.remove(event.productDataModel);
    emit(CartSuccessState(cartItems: cartItem));
  }
}
