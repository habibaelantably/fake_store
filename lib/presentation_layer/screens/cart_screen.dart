
import 'package:fake_store/bussiness_layer/cart_cubit/cart_cubit.dart';
import 'package:fake_store/bussiness_layer/cart_cubit/cart_states.dart';
import 'package:fake_store/presentation_layer/views/cart_screen_view/cart_screen_view.dart';
import 'package:fake_store/presentation_layer/widgets/cart_screen_widgets/checkout_button_widget.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class CartScreen extends StatelessWidget{
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartCubit.get(context).getCart(context: context);
    return Scaffold(
      appBar: AppBar(
        title:  RegularText(text: AppLocalizations.of(context)!.cart),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<CartCubit,CartStates>(
          builder: (BuildContext context, state) {
            if(CartCubit.get(context).cartItems.isNotEmpty){
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView.separated(itemBuilder:(context,index)=>
                            CartItem(
                                productImage:  CartCubit.get(context).cartItems[index].productImage,
                                productName: CartCubit.get(context).cartItems[index].productTitle,
                                productPrice:  CartCubit.get(context).cartItems[index].productPrice.toString(),
                                index: index,
                            ),
                            separatorBuilder:(context,index)=> SizedBox(height: 0.0.h,),
                            itemCount:  CartCubit.get(context).cartItems.length),
                      ),
                       const PayNowButton()
                    ],
                  ),

                ],
              );
            }
            if(state is GetCartErrorState){
              return  Center(child: RegularText(text: state.errorMessage.toString(),color: Colors.black,));
            }
            if(state is GetCartSuccessState && CartCubit.get(context).cartItems.isEmpty){
              return Center(child: RegularText(text: AppLocalizations.of(context)!.thereIsNoItems,color: Colors.black,));
            }
            if(state is GetCartLoadingState){
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox(height: 0.0,);

          },
          listener: (BuildContext context, Object? state) {  },
        ),
      ),

    );
  }

}