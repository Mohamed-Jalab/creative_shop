import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/item_of_cart.dart';
import 'states.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final List<ItemOfCart> items = [];

  void addItem(ItemOfCart item) {
    items.add(item);
    emit(CartUpdated(List<ItemOfCart>.from(items)));
  }

  void clear() {
    items.clear();
    emit(CartUpdated([]));
  }

  int get totalPrice => items.fold<int>(0, (total, item) => total + item.price);
}
