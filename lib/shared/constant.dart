import 'package:flutter/material.dart';

import '../screens/widgets/item_card.dart';

const primaryColor = Color(0xFF232F3E);
const secondaryColor = Color(0xFFF69B32);
const blackColor2 = Color(0xff404040);
const greyColor1 = Color(0xFF696969);
const greyColor2 = Color(0xFF979797);
const greyColor3 = Color(0xfff9f9fa);
const whiteColor = Color(0xffffffff);
const kColorThemeBrowse = Color(0xfffd5252);

List<ItemCard> favoriteList = [];
List<ItemCard> accessoriesCards = [];
List<ItemCard> giftsCards = [];
List<ItemCard> candlesCards = [];
List<ItemCard> collagesCards = [];
List<ItemCard> flowersCards = [];
List<ItemCard> paperCards = [];
List<ItemCard> embroideryCards = [];
List<ItemCard> raizenCards = [];
List<ItemCard> trendCards = [];
List<ItemCard> newestCards = [];
List<List<ItemCard>> allProduct = [
  accessoriesCards,
  candlesCards,
  collagesCards,
  embroideryCards,
  flowersCards,
  giftsCards,
  paperCards,
  raizenCards,
];
List<String> nameOfCategories = [
  "Accessories",
  "Candles",
  "Collages",
  "Embroideries",
  "Flowers",
  "Gifts",
  "Papers",
  "Raizens",
];
