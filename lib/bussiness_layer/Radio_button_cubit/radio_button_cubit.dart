import 'package:fake_store/bussiness_layer/Radio_button_cubit/radio_button_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButtonCubit extends Cubit<RadioButtonStates>
{
  RadioButtonCubit() : super(InitialRadioButtonState());

  static RadioButtonCubit get(context)=>BlocProvider.of(context);

  int selectedRadioButtonValue=1;

  void changeRadioButtonState(val)
  {
    selectedRadioButtonValue=val;
    emit(ChangeRadioButtonState());

  }

  int secondSelectedRadioButtonValue=1;

  void changeRadioButtonStateSecondGroup(val)
  {
    secondSelectedRadioButtonValue=val;
    emit(ChangeSecondRadioButtonState());
  }

  int thirdSelectedRadioButtonValue=1;

  void changeRadioButtonStateThirdGroup(val)
  {
    thirdSelectedRadioButtonValue=val;
    emit(ChangeThirdRadioButtonState());
  }


}