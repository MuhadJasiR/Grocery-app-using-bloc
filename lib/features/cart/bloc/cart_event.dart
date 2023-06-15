part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveCartEvent extends CartEvent {
  final ProductDataModel productDataModel;

  CartRemoveCartEvent({required this.productDataModel});
}
