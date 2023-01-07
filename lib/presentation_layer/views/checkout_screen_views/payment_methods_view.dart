import 'package:fake_store/bussiness_layer/Radio_button_cubit/radio_button_cubit.dart';
import 'package:fake_store/bussiness_layer/Radio_button_cubit/radio_button_states.dart';
import 'package:fake_store/presentation_layer/constants/assets_manager.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PaymentMethodsView extends StatelessWidget
{
  const PaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>RadioButtonCubit(),
      child: BlocConsumer<RadioButtonCubit,RadioButtonStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColor.black,
                        width: 1,
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        const CircleAvatar(backgroundImage:AssetImage(AssetsManager.knetImage) ,),
                        const Text('Knet',style: TextStyle(color: Colors.black),),
                        Radio(
                          value: 1,
                          groupValue: RadioButtonCubit.get(context).selectedRadioButtonValue,
                          onChanged: (int? value)
                          {
                            RadioButtonCubit.get(context).changeRadioButtonState(value);
                          },
                          activeColor: AppColor.appDefaultColor,
                        )
                      ],
                    ),
                  )
              ),
              const SizedBox(height: 10.0,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColor.black,
                        width: 1,
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Image.asset(AssetsManager.hyperPay,height: 45,width: 45,) ,
                        const Text('HyperPay',style: TextStyle(color: AppColor.black),),
                        Radio(
                          value: 2 ,
                          groupValue: RadioButtonCubit.get(context).selectedRadioButtonValue,
                          onChanged: (int? value)
                          {
                            RadioButtonCubit.get(context).changeRadioButtonState(value);
                          },
                          activeColor: AppColor.appDefaultColor,
                        )
                      ],
                    ),
                  )
              ),
              const SizedBox(height: 10.0,),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColor.grey,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColor.black,
                        width: 1,
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Image.asset(AssetsManager.tabbyLogoImage,height: 35,width: 50,) ,
                        const Text('tabby',style: TextStyle(color: AppColor.black),),
                        Radio(
                          value: 3,
                          groupValue: RadioButtonCubit.get(context).selectedRadioButtonValue,
                          onChanged: (int? value)
                          {
                            RadioButtonCubit.get(context).changeRadioButtonState(value);
                          } ,
                          activeColor: AppColor.appDefaultColor,

                        )
                      ],
                    ),
                  )
              ),
              if(RadioButtonCubit.get(context).selectedRadioButtonValue == 2)...[
                const SizedBox(height: 40.0,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColor.black,
                          width: 1,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Image.asset(AssetsManager.madaImage,height: 45,width: 45,) ,
                          const Text('Mada',style: TextStyle(color: AppColor.black),),
                          Radio(
                            value: 1 ,
                            groupValue: RadioButtonCubit.get(context).secondSelectedRadioButtonValue,
                            onChanged: (int? value)
                            {
                              RadioButtonCubit.get(context).changeRadioButtonStateSecondGroup(value);
                            },
                            activeColor: AppColor.appDefaultColor,
                          )
                        ],
                      ),
                    )
                ),
                const SizedBox(height: 10.0,),
                Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: AppColor.grey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColor.black,
                          width: 1,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Image.asset(AssetsManager.visaMasterImage,height: 45,width: 45,) ,
                          const Text('Visa/Master Card',style: TextStyle(color: AppColor.black),),
                          Radio(
                            value: 2 ,
                            groupValue: RadioButtonCubit.get(context).secondSelectedRadioButtonValue,
                            onChanged: (int? value)
                            {
                              RadioButtonCubit.get(context).changeRadioButtonStateSecondGroup(value);
                            },
                            activeColor: AppColor.appDefaultColor,
                          )
                        ],
                      ),
                    )
                ),
              ],

              if(RadioButtonCubit.get(context).selectedRadioButtonValue == 3)
                ...[
                  SizedBox(height: 8.0.h,),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: AppColor.grey,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColor.black,
                            width: 1,
                          )
                      ),
                      child: FittedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Image.asset(AssetsManager.tabbyLogoImage,height: 40,width: 35,) ,
                              const Text('Pay in installments without interest',style: TextStyle(color: AppColor.black),),
                              Radio(
                                  value: 0 ,
                                  groupValue: RadioButtonCubit.get(context).thirdSelectedRadioButtonValue,
                                  onChanged: (int? value)
                                  {
                                    RadioButtonCubit.get(context).changeRadioButtonStateThirdGroup(value);
                                  },
                                  activeColor: AppColor.appDefaultColor
                              )
                            ],
                          ),
                        ),
                      )
                  ),]
            ],
          );
        },
      ),
    );
  }

}