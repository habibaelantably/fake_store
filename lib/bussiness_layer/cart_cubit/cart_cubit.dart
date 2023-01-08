import 'dart:convert';

import 'package:fake_store/bussiness_layer/cart_cubit/cart_states.dart';
import 'package:fake_store/data_layer/local/cache_helper.dart';
import 'package:fake_store/data_layer/model/cart_model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitialState());

  static CartCubit get(context) => BlocProvider.of(context);

  List<CartItemModel> cartItems = [];

  getCart({required BuildContext context})  {
    if(cartItems.isEmpty){
      emit(GetCartLoadingState());
      try {
        final String? decodedCart = CacheHelper.getDataFromSharedPreference(key: "cart");
        if(decodedCart!=null){
          Map cart= json.decode(decodedCart);
            cartItems = (cart['cartItems']as List<dynamic>).map((cartItem) => CartItemModel.fromJson(cartItem)).toList();

        }
        emit(GetCartSuccessState());
      } catch (exception) {
        emit(GetCartErrorState(errorMessage: exception.toString()));
      }
    }
  }

  void addToCart({
    required int productId,
    required String productImage,
    required String productTitle,
    required double productPrice,
    required BuildContext context,
  }) async {
    CartItemModel cartModel = CartItemModel(
        productId: productId,
        productImage: productImage,productTitle: productTitle,productPrice: productPrice );

    cartItems.add(cartModel);
    calculateTotalPrice();
    await saveCartToCache(context: context);
  }

  Future<void> saveCartToCache({required BuildContext context}) async {
    final String encodedData = json.encode({
      'cartItems':cartItems.map((element) => element.toCacheJson()).toList()
    });
    await CacheHelper.saveDataSharedPreference(key: "cart", value: encodedData);
    emit(SaveCartToCacheState());
  }


  removeCartItem( {indexNumber,required BuildContext context})async  {
    cartItems.removeAt(indexNumber);
    minusTotalPrice();
    await saveCartToCache(context: context);
  }


  calculateTotalPrice() {
    return cartItems.isEmpty ? 0 : cartItems.map((e) => e.productPrice)
        .reduce((value, element) => value + element);
  }

  minusTotalPrice({int itemPrice = 0}) {
    return cartItems.isEmpty ? 0 : cartItems.map((e) => e.productPrice)
        .reduce((value, element) => value - element);
  }

}