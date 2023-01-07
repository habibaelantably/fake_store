import 'package:fake_store/presentation_layer/constants/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key,}) : super(key: key);
  // required this.itemsList, required this.onChanged,
  // final List itemsList;
  // final Function onChanged;
  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
      child: TextFormField(
        controller: searchController,
        onChanged: (value) {
          // onChanged(value, searchController.text);
        },
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0),
            prefixIcon: const Icon(Icons.search,color:AppColor.white,),
            suffixIcon: searchController.text.isNotEmpty ?IconButton(
              icon: const Icon(Icons.cancel, color:AppColor.white,),
              onPressed:  () {
                // searchController.clear();
                // SearchCubit.get(context).searchInItems(searchedList: null);
              } ,
            ):const SizedBox(),
            hintText: 'search',
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
