import 'package:fake_store/bussiness_layer/search_cubit/search_cubit.dart';
import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, required this.itemsList, required this.onChanged,}) : super(key: key);
  final List itemsList;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
      child: TextFormField(
        controller: searchController,
        onChanged: (value) {
           onChanged(value, searchController.text);
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            prefixIcon: const Icon(Icons.search,color:AppColor.white,),
            suffixIcon: searchController.text !='' ?IconButton(
              icon: const Icon(Icons.cancel, color:AppColor.white,),
              onPressed:  () {
                 searchController.clear();
                SearchCubit.get(context).searchInItems(searchedList: null);
              } ,
            ):const SizedBox(),
            hintText:AppLocalizations.of(context)!.search,
            hintStyle: const TextStyle(color: AppColor.white),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.w),
              borderSide: const BorderSide(
                color: AppColor.white,
              ),
            ),
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: const BorderSide(
              color: AppColor.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: const BorderSide(
              color: AppColor.white,
            ),
          ),
        ),
      ),
    );
  }
}
