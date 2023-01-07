import 'package:fake_store/bussiness_layer/home_screen_cubit/home_screen_cubit.dart';
import 'package:fake_store/presentation_layer/screens/cart_screen.dart';
import 'package:fake_store/presentation_layer/screens/checkout_screen.dart';
import 'package:fake_store/presentation_layer/screens/description_screen.dart';
import 'package:fake_store/presentation_layer/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouterNames {
  static const cartScreen = '/cartScreen';
  static const productDetailsScreen = '/productDetailsScreen';
  static const checkoutScreen = '/checkoutScreen';
}

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/cartScreen':
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );
        case '/productDetailsScreen':
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsScreen(),
        );
        case '/checkoutScreen':
        return MaterialPageRoute(
          builder: (_) =>  CheckoutScreen(),
        );
      default:
        return null;
    }
  }
}
