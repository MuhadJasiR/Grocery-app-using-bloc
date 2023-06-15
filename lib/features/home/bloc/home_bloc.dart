import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample/data/cart_item.dart';
import 'package:bloc_sample/data/grocery_data.dart';
import 'package:bloc_sample/data/wishlist_item.dart';
import 'package:bloc_sample/features/home/model/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvents>(homeInitialEvents);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);

    on<HomeWishlistButtonNavigationEvent>(homeWishlistButtonNavigationEvent);

    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
  }

  FutureOr<void> homeInitialEvents(
      HomeInitialEvents event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProduct
            .map((e) => ProductDataModel(
                id: e["id"],
                name: e["name"],
                description: e["description"],
                price: e["price"],
                imageUrl: e["image"]))
            .toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    print("whishlist product clicked");
    wishListItems.add(event.clickedProduct);
    emit(HomeProductItemWishListedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print("cart product clicked");
    cartItem.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigationEvent(
      HomeWishlistButtonNavigationEvent event, Emitter<HomeState> emit) {
    print("whishlist navigate clicked");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigationEvent(
      HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {
    print("cart navigate clicked");
    emit(HomeNavigateToCardPageActionState());
  }
}
