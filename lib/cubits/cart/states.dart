import '../../models/item_of_cart.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  CartUpdated(this.items);

  final List<ItemOfCart> items;
}
