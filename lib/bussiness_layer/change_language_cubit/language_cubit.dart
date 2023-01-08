import 'package:fake_store/bussiness_layer/change_language_cubit/language_states.dart';
import 'package:fake_store/data_layer/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageStates> {
  ChangeLanguageCubit() : super(ChangeLanguageInitialState());

  static ChangeLanguageCubit get(context) => BlocProvider.of(context);

  bool appLanguageIsArabic = false;

  String languageMenuValue = 'English';

  void changeAppLanguage({bool? appLanguageIsArabic, String? languageMenuValue}) {
    if (languageMenuValue != null) {
      this.languageMenuValue = languageMenuValue;
    } else {
      this.languageMenuValue = appLanguageIsArabic! ? "العربية" : "English";
    }
    if (appLanguageIsArabic != null) {
      this.appLanguageIsArabic = appLanguageIsArabic;
    }
    CacheHelper.saveDataSharedPreference(key: 'language', value: appLanguageIsArabic);
    emit(ChangeLanguageSuccessState());
  }
}