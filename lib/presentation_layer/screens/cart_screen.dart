
import 'package:fake_store/presentation_layer/constants/assets_manager.dart';
import 'package:fake_store/presentation_layer/views/cart_screen_view/cart_screen_view.dart';
import 'package:fake_store/presentation_layer/widgets/cart_screen_widgets/checkout_button_widget.dart';
import 'package:fake_store/presentation_layer/widgets/shared/regular_text.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget{
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RegularText(text: 'Cart',),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: ListView.separated(itemBuilder:(context,index)=>
                  const CartItem(productImage: AssetsManager.testImage, productName: 'productName', productPrice: 'productPrice'),
                      separatorBuilder:(context,index)=> SizedBox(height: 0.0.h,),
                      itemCount: 10),
                ),
                const PayNowButton(totalValue: 345.0,)
              ],
            ),

          ],
        ),
      ),

    );
  }

}