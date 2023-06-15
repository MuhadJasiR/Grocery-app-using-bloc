import 'package:bloc_sample/features/cart/bloc/cart_bloc.dart';
import 'package:bloc_sample/features/home/bloc/home_bloc.dart';
import 'package:bloc_sample/features/home/model/home_product_data_model.dart';
import 'package:flutter/material.dart';

class CartTileWIdget extends StatelessWidget {
  const CartTileWIdget(
      {super.key, required this.productDataModel, required this.cartBloc});
  final CartBloc cartBloc;
  final ProductDataModel productDataModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(productDataModel.imageUrl))),
                  ),
                  Text(
                    productDataModel.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(productDataModel.description),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${productDataModel.price}",
                        style: const TextStyle(color: Colors.blue),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                // homeBloc.add(
                                //     HomeProductWishlistButtonClickedEvent(
                                //         clickedProduct: productDataModel));
                              },
                              icon: const Icon(Icons.favorite_border)),
                          IconButton(
                              onPressed: () {
                                cartBloc.add(CartRemoveCartEvent(
                                    productDataModel: productDataModel));
                              },
                              icon: const Icon(Icons.shopping_cart))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
