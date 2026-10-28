import 'package:creative_shop/cubits/item_card/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.newPrice,
    required this.category,
    this.backgroundColor = const Color(0xfff8f5f5),
    this.isFavorite = false,
    this.saleText = '',
    this.oldPrice = '',
    required this.onTap,
  });

  final Color backgroundColor;
  final String image;
  final bool isFavorite;
  final String saleText;
  final String title;
  final String category;
  final String oldPrice;
  final String newPrice;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemFavoriteCubit>(
        create: (context) => ItemFavoriteCubit(isFavorite : isFavorite),
        child: BlocConsumer<ItemFavoriteCubit,ItemFavoriteState>(
          listener : (context, state) {},
          builder : (context, state) {
            var cubit = ItemFavoriteCubit.get(context);
            //cubit.isFavorite = isFavorite;
            return GestureDetector(
              onTap: onTap,
              child: SizedBox(
                height: 300,
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                  ),
                  color: backgroundColor,
                  elevation: 8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Stack(
                            children: [
                              const SizedBox(
                                width: 1000,
                                height: 160,
                              ),
                              SizedBox(
                                height: 200,
                                width: 1000,
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  clipBehavior: Clip.antiAlias,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide:
                                      const BorderSide(color: Colors.transparent)),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Image.network(image),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(80),
                                    color: (saleText == ''
                                        ? Colors.transparent
                                        : Colors.red),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      saleText,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: GestureDetector(
                                  onTap: (){
                                    ItemCard item = ItemCard(
                                      image: image,
                                      title: title, newPrice: newPrice, category: category, onTap: onTap,isFavorite: true,);
                                    cubit.changeFavorite(item);
                                    //this.isFavorite = cubit.isFavorite;
                                  },
                                  child: Container(
                                    width: 42,
                                    height: 42,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            offset: Offset(0.0, 0.0), //(x,y)
                                            blurRadius: 4.0,
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(80),
                                        color: Colors.white),
                                    child: Icon(
                                      (cubit.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_outline_rounded),
                                      size: 22,
                                      color: (cubit.isFavorite
                                          ? Colors.redAccent
                                          : Colors.black12),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                category,
                                style: const TextStyle(color: Colors.black38),
                              ),
                              Text(
                                title,
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Row(
                                children: [
                                  Text(
                                    oldPrice,
                                    style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black38),
                                  ),
                                  SizedBox(
                                    width: (oldPrice == '' ? 0 : 8),
                                  ),
                                  Text(
                                    newPrice,
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
    )      ;
  }
}
