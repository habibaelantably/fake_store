import 'package:fake_store/bussiness_layer/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates>{
  SearchCubit():super(InitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  List? searchedList;

  void searchInItems({required List? searchedList}){
    this.searchedList = searchedList;
    emit(SearchInListState());
  }
}