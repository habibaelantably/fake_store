import 'package:fake_store/presentation_layer/widgets/shared/default_formField.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class AddressView extends StatelessWidget
{
  final TextEditingController zoneController=TextEditingController();
  final TextEditingController streetController=TextEditingController();
  final TextEditingController buildingNumber=TextEditingController();

   AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 2.h,),
      DefaultFormField(
        validateText: 'Please enter your zone',
        maxLines: 1,
        hasBorder: true,
        hintText: 'enter your zone',
        controller: zoneController,
        borderRadius: 3.w,
        inputType:TextInputType.text,),
      SizedBox(height: 1.h,),
      DefaultFormField(
        validateText: 'Please enter your street',
        maxLines: 1,
        hasBorder: true,
        hintText: 'enter your street name',
        controller: streetController,
        borderRadius: 3.w,
        inputType:TextInputType.text,),
      SizedBox(height: 1.h,),
      DefaultFormField(
        validateText: 'Please enter your building number',
        hintText: 'enter your building number',
        maxLines: 1,
        hasBorder: true,
        borderRadius: 3.w,
        controller: streetController,
        inputType:TextInputType.number,),
    ],
  );
  }

}