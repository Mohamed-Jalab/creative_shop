import 'package:creative_shop/screens/product_screen.dart';
import 'package:creative_shop/screens/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../shared/constant.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  initState() {
    super.initState();
    for (int i = 0; i < favoriteList.length; i++) {
      favoriteList[i].onTap = () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ProductScreen(
              imageUrl: favoriteList[i].image,
              category: favoriteList[i].category,
              title: favoriteList[i].title,
            ),
          ),
        );
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
        backgroundColor: primaryColor,
      ),
      body: favoriteList.isEmpty
          ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/favorite_screen_empty.png',
                width: 250,
                height: 250,
              ),
              const Text('Nothing here... yet',
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
              const SizedBox(
                height: 10,
              ),
              const Text('Try adding to your favorite',
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
            ],
          ))
          : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: IntrinsicGridView.vertical(
          columnCount: 2,
          horizontalSpace: 4,
          verticalSpace: 4,
          padding: const EdgeInsets.only(
              top: 16, bottom: 12, left: 4, right: 4),
          children: List.generate(
            favoriteList.length,
                (index) {
              return favoriteList[index];
            },
          ),
        ),
      ),
    );
  }
}
// check