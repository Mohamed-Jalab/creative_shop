part of 'cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ChangeSelectItemState extends ProductState {}

class ChangeSizeOfItemState extends ProductState {}

class ChangeFavoriteItemState extends ProductState {}

class AddToItem extends ProductState {}

class RemoveFromItem extends ProductState {}

class ScrollImage extends ProductState {}

class AddItemToCartState extends ProductState {}
