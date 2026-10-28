// ignore_for_file: depend_on_referenced_packages

import 'package:creative_shop/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/widgets/item_card.dart';


part 'state.dart';

class ItemFavoriteCubit extends Cubit<ItemFavoriteState> {
  ItemFavoriteCubit({required this.isFavorite}) : super(ItemFavoriteInitial());

  static ItemFavoriteCubit get(context) => BlocProvider.of(context);
  bool isFavorite;

  void changeFavorite(ItemCard item) {
    isFavorite = !isFavorite;

    if (isFavorite) {
      favoriteList.add(item);
    } else {
      favoriteList.remove(item);
    }
    emit(ChangeFavoriteItemState());
  }
}
