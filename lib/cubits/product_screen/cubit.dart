// ignore_for_file: depend_on_referenced_packages

import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/widgets/item_card.dart';

part 'state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  static ProductCubit get(context) => BlocProvider.of(context);
  bool isFavorite = false;
  int selectedItem = 0;
  int price = 69;
  int amountOfItem = 1;
  int total = 0;
  PageController scrollImagesController =
  PageController(viewportFraction: 1.0375);

  void changeFavorit(ItemCard item) {
    isFavorite = !isFavorite;
    if (isFavorite) {
      favoriteList.add(item);
    } else {
      favoriteList.remove(item);
    }
    emit(ChangeFavoriteItemState());
  }

  int changeSelectedItem(index) {
    selectedItem = index;
    emit(ChangeSelectItemState());
    return selectedItem;
  }

  int selectSizeOfItem = 0;
  int changeSizeOfProduct(index) {
    selectSizeOfItem = index;
    emit(ChangeSizeOfItemState());
    return selectSizeOfItem;
  }

  void addToAmountOfItem() {
    amountOfItem++;
    emit(AddToItem());
  }

  void removeFromAmountOfItem() {
    if (amountOfItem > 1) amountOfItem--;
    emit(RemoveFromItem());
  }

  void onImageChanged(int index) {
    emit(ScrollImage());
  }

  void addItemToCart() {
    total = price * amountOfItem;
    emit(AddItemToCartState());
  }
}
