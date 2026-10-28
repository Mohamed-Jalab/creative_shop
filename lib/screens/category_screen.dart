import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../shared/component.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color.fromRGBO(35, 47, 62, 1),
        title: const Text(
          "Category",
          style: TextStyle(fontSize: 23),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search, size: 27,))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, mainAxisExtent: 200),
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return grid(context, categories[index], listOfCards(index), index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
