import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../shared/constant.dart';
import 'cate_screen.dart';
import 'category_screen.dart';
import 'product_screen.dart';
import 'widgets/cate_card.dart';
import 'widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});





  @override
  Widget build(BuildContext context) {
    //trendCards.clear();
    //newestCards.clear();
    var controller = PageController(viewportFraction: 0.45, keepPage: true);
    dynamic cateCards;

    cateCards = [
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CateScreen(
                  index: 0, list: accessoriesCards, title: 'Accessories')));
        },
        image: const AssetImage('asset/images/accessories/1.jpg'),
        title: 'Accessories',
      ),
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) =>
                  CateScreen(index: 1, list: candlesCards, title: 'Candles')));
        },
        image: const AssetImage('asset/images/candles/1.jpg'),
        title: 'Candles',
      ),
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CateScreen(
                  index: 2, list: collagesCards, title: 'Collages')));
        },
        image: const AssetImage('asset/images/collages/3.jpg'),
        title: 'Collages',
      ),
      CateCard(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => CateScreen(
                  index: 5, list: embroideryCards, title: 'Embroideries')));
        },
        image: const AssetImage('asset/images/embroidery/1.jpg'),
        title: 'Embroideries',
      ),
    ];

    return FutureBuilder(
      future: getData(context),
      builder: (context, snapshot) => Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              child: Stack(
                children: [
                  snapshot.connectionState == ConnectionState.waiting && trendCards.isEmpty && newestCards.isEmpty
                      ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ))
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: IntrinsicGridView.vertical(
                            columnCount: 1,
                            children: [
                              const SizedBox(height: 140),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Categories',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        overlayColor: MaterialStateColor
                                            .resolveWith((_) =>
                                            secondaryColor
                                                .withOpacity(.1)),
                                        foregroundColor:
                                        MaterialStateProperty.all<
                                            Color>(secondaryColor),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                          const CategoryScreen(),
                                        ));
                                      },
                                      child: const Text('See all'),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8),
                                child: SizedBox(
                                  height: 165,
                                  child: PageView(
                                    physics:
                                    const BouncingScrollPhysics(),
                                    padEnds: false,
                                    clipBehavior: Clip.none,
                                    controller: controller,
                                    children: cateCards,
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 12,
                                  right: 12,
                                  bottom: 12,
                                ),
                                child: Text(
                                  'Trends',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                child: SizedBox(
                                  height: 300,
                                  child: PageView(
                                    physics:
                                    const BouncingScrollPhysics(),
                                    padEnds: false,
                                    controller: controller,
                                    clipBehavior: Clip.none,
                                    // itemCount: pages.length,
                                    children: List.generate(
                                      trendCards.length,
                                          (index) {
                                        return ItemCard(
                                          image: trendCards[index].image,
                                          title: trendCards[index].title,
                                          newPrice:
                                          trendCards[index].newPrice,
                                          category:
                                          trendCards[index].category,
                                          isFavorite:
                                          trendCards[index].isFavorite,
                                          saleText:
                                          trendCards[index].saleText,
                                          oldPrice:
                                          trendCards[index].oldPrice,
                                          backgroundColor: trendCards[index]
                                              .backgroundColor,
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) => ProductScreen(
                                                  imageUrl: trendCards[index]
                                                      .image,
                                                  title: trendCards[index]
                                                      .title,
                                                  category: trendCards[index]
                                                      .category,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    left: 12, right: 12, top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Newest',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              // Center(child: Column(
                              //   children: [
                              //     SizedBox(height: 50),
                              //     CircularProgressIndicator(),
                              //     SizedBox(height: 50),
                              //   ],
                              // )),
                              IntrinsicGridView.vertical(
                                columnCount: 2,
                                horizontalSpace: 4,
                                verticalSpace: 4,
                                padding: const EdgeInsets.only(
                                    top: 16,
                                    bottom: 12,
                                    left: 4,
                                    right: 4),
                                children: List.generate(
                                  newestCards.length,
                                      (index) {
                                    return ItemCard(
                                      image: newestCards[index].image,
                                      title: newestCards[index].title,
                                      newPrice:
                                      newestCards[index].newPrice,
                                      category:
                                      newestCards[index].category,
                                      isFavorite:
                                      newestCards[index].isFavorite,
                                      saleText:
                                      newestCards[index].saleText,
                                      oldPrice:
                                      newestCards[index].oldPrice,
                                      backgroundColor: newestCards[index]
                                          .backgroundColor,
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => ProductScreen(
                                              imageUrl: newestCards[index]
                                                  .image,
                                              title: newestCards[index]
                                                  .title,
                                              category: newestCards[index]
                                                  .category,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // !here it is AppBar
                  const SizedBox(
                    height: 111,
                    width: double.maxFinite,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.zero),
                      ),
                      margin: EdgeInsets.zero,
                      color: primaryColor,
                      child: Center(
                        child: Text(
                          'Creative Shop',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      SizedBox(height: 70),
                      //! here is TextField
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(1000)),
                                ),
                                child: TextField(
                                  cursorColor: primaryColor,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    filled: true,
                                    focusColor: Colors.white,
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.5),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(1000),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primaryColor,
                                        width: 1.2,
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(1000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

late QuerySnapshot<Map<String, dynamic>> trendCategoryData;
late QuerySnapshot<Map<String, dynamic>> newestCategoryData;


Future getData(BuildContext context) async {
  DocumentReference prouductsData = FirebaseFirestore.instance
      .collection('products')
      .doc('tXmQYu9kGr7OeE9X8N8I');
  //if(trendCards.isEmpty && newestCards.isEmpty)
  for (int i = 0; i < nameOfCategories.length; i++) {

    //if(trendCards.isEmpty)
    trendCategoryData = await prouductsData
        .collection(nameOfCategories[i])
        .where('trending', isEqualTo: true)
        .get();


    //if(newestCards.isEmpty)
    newestCategoryData = await prouductsData
        .collection(nameOfCategories[i])
        .where('newest', isEqualTo: true)
        .get();

    //if(newestCards.isEmpty)
    for (int j = 0; j < newestCategoryData.docs.length; j++) {
      QueryDocumentSnapshot<Map<String, dynamic>> data =
      newestCategoryData.docs[j];

      newestCards.add(
        ItemCard(
          image: data.data()['imageUrl'],
          title: data.data()['name'],
          newPrice: '${data.data()['price'].toString()} SYP',
          category: nameOfCategories[i],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductScreen(
                  imageUrl: data.data()['imageUrl'],
                  category: nameOfCategories[i],
                  title: data.data()['name'],
                ),
              ),
            );
          },
        ),
      );
    }

    //if(trendCards.isEmpty)
    for (int j = 0; j < trendCategoryData.docs.length; j++) {
      QueryDocumentSnapshot<Map<String, dynamic>> data =
      trendCategoryData.docs[j];

      trendCards.add(
        ItemCard(
          image: data.data()['imageUrl'],
          title: data.data()['name'],
          newPrice: '${data.data()['price'].toString()} SYP',
          category: nameOfCategories[i],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProductScreen(
                  imageUrl: data.data()['imageUrl'],
                  category: nameOfCategories[i],
                  title: data.data()['name'],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
// check 