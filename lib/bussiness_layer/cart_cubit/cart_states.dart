class CartStates {}

class CartInitialState extends CartStates {}

class AddedToCartSuccessState extends CartStates {}

class RemoveFromCartSuccessState extends CartStates {}

class ChangeCartCountState extends CartStates {}

class SaveCartToCacheState extends CartStates {}

class DeleteCartFromCacheState extends CartStates {}

class GetCartLoadingState extends CartStates {}

class GetCartSuccessState extends CartStates {}

class GetCartErrorState extends CartStates {
  final String errorMessage;

  GetCartErrorState({required this.errorMessage});
}

class SaveToCartLoadingState extends CartStates {}

class SaveToCartSuccessState extends CartStates {
  final String accessToken;

  SaveToCartSuccessState({required this.accessToken});
}

class SaveToCartErrorState extends CartStates {
  final String errorMsg;

  SaveToCartErrorState(this.errorMsg);
}