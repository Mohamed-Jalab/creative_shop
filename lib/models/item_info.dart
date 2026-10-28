import 'package:flutter/material.dart';

class ItemInfo {
  ItemInfo(
      {required this.image,
      required this.title,
      required this.newPrice,
      required this.category,
      this.backgroundColor = const Color(0xfff8f5f5),
      this.isFavorite = false,
      this.saleText = '',
      this.oldPrice = '',
      this.onTap});

  Color backgroundColor;
  Image image;
  bool isFavorite;
  String saleText;
  String title;
  String category;
  String oldPrice;
  String newPrice;
  Function? onTap;

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
