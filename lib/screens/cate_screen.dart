// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:creative_shop/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../shared/constant.dart';
import 'widgets/item_card.dart';

class CateScreen extends StatelessWidget {
  final String title;
  final List<ItemCard> list;
  final int index;
  const CateScreen({
    super.key,
    this.title = 'Creative Shop',
    required this.list,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    allProduct[index].clear();
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('products')
            .doc('tXmQYu9kGr7OeE9X8N8I')
            .collection(nameOfCategories[index])
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
                snapshot.data!.docs;
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              allProduct[index].add(ItemCard(
                image: data[i].data()['imageUrl'],
                title: data[i].data()['name'],
                newPrice: '${data[i].data()['price'].toString()} SYP',
                category: nameOfCategories[index],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProductScreen(
                        imageUrl: data[i].data()['imageUrl'],
                        category: nameOfCategories[index],
                        title: data[i].data()['name'],
                      ),
                    ),
                  );
                },
              ));
            }
          }
          return Scaffold(
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  child: Stack(
                    children: [
                      snapshot.connectionState == ConnectionState.done
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: IntrinsicGridView.vertical(
                              columnCount: 1,
                              children: [
                                SizedBox(height: 130),
                                IntrinsicGridView.vertical(
                                  columnCount: 2,
                                  horizontalSpace: 4,
                                  verticalSpace: 4,
                                  padding: EdgeInsets.only(
                                      top: 16,
                                      bottom: 12,
                                      left: 4,
                                      right: 4),
                                  children: List.generate(
                                    list.length,
                                        (index) {
                                      return list[index];
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                          : Center(
                          child: CircularProgressIndicator(
                              color: primaryColor)),
                      SizedBox(
                        height: 100,
                        width: double.maxFinite,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.zero),
                          ),
                          margin: EdgeInsets.zero,
                          color: primaryColor,
                          child: SafeArea(
                            child: Stack(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Text(
                                    title,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 22),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: const [
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
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(1000),
                                      ),
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
                                            width: 1.5,
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
          );
        });
  }
}
// check