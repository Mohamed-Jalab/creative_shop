import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart/cubit.dart';
import '../shared/component.dart';
import '../shared/constant.dart';
import 'check_out_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartCubit>().items;
    final total = context.watch<CartCubit>().totalPrice;

    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('Your Cart'),
        actions: [
          cart.isEmpty
              ? const SizedBox()
              : IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              buildMessage(
                context,
                image: 'asset/images/delete_cart_icon.png',
                title: 'Warning!',
                subTitle: 'Are you sure to remove\nall products from your cart?',
                firstButtonText: 'Yes',
                function: () {
                  Navigator.of(context).pop();
                  context.read<CartCubit>().clear();
                },
                secondButtonText: 'Cancel',
                secondButtonFunction: () {
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ],
      ),
      backgroundColor: greyColor3,
      body: cart.isEmpty
          ? Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/images/cart_screen_empty.png',
                width: 250,
                height: 250,
              ),
              const Text('Your shopping cart is empty',
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
              const SizedBox(
                height: 10,
              ),
              const Text('Try shopping',
                  style: TextStyle(fontSize: 20, fontFamily: 'Poppins')),
            ],
          ))
          : SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFD8D8D8),
                          offset: Offset(0.0, .4),
                          blurRadius: 10.0,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        for (int i = 0; i < cart.length; i++)
                          buildlistTile(context,
                              imageUrl: cart[i].imageUrl,
                              title: cart[i].name,
                              subTitle: cart[i].price.toString(),
                              numOfProduct: cart[i].amountOfItem),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Goods:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '$total SYP',
                                style: const TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '0.00 SYP',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        distance(),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Price:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '$total SYP',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.greenAccent[400]
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                  const SizedBox(height: 130),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: buildBigButton(
                  context,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  color: secondaryColor,
                  child: const Text('Check Out',
                      style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (context) => CheckOutScreen(
                          total: total,
                        ),
                      ),
                    )
                        .then((value) => setState(() {}));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
