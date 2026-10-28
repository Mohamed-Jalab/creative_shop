import 'package:creative_shop/screens/favorite_screen.dart';
import 'package:creative_shop/screens/home_screen.dart';
import 'package:creative_shop/screens/widgets/order_tracking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart/cubit.dart';
import '../shared/component.dart';
import '../shared/constant.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.total});
  final int total;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 8,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Check Out'),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      backgroundColor: greyColor3,
      body: SizedBox(
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
                        bottomRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                    ),
                    child: Column(
                      children: [
                        // const SizedBox(height: 25),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     IconButton(
                        //       icon: const Icon(Icons.arrow_back),
                        //       onPressed: () {
                        //         Navigator.of(context).pop();
                        //       },
                        //     ),
                        //     const Center(
                        //       child: Text(
                        //         'Check Out',
                        //         style: TextStyle(
                        //           fontSize: 20,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //     //? this is a failed solve
                        //     const IconButton(
                        //       icon: Icon(Icons.delete_outlined,
                        //           color: Colors.transparent),
                        //       onPressed: null,
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 20),
                        ListTile(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const OrderTrackingPage()));
                          },
                          leading: const Icon(Icons.location_on_outlined,
                              color: Colors.black),
                          title: const Text('Set your location'),
                          subtitle: const Text(
                              'to deliver your goods to your location'),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                        distance(),
                        RadioListTile(
                            fillColor: MaterialStateProperty.all<Color>(
                                secondaryColor),
                            value: 1,
                            groupValue: 1,
                            onChanged: (value) {},
                            title: Row(
                              children: [
                                Image.asset('asset/images/cash_icon.png',
                                  width: 60,
                                  height: 60,
                                ),
                                const Text('Cash'),
                              ],
                            )),
                        distance(),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Goods:',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                '${widget.total} SYP',
                                style: const TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                '${widget.total} SYP',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
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
                  child: const Text('Pay', style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    context.read<CartCubit>().clear();
                    buildMessage(
                        context,
                        image: 'asset/images/check-all.png',
                        subTitle:
                        "Your order has been successfully\npaid. Your product(s) are received\nin an hour.",
                        function: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        secondButtonText: 'Go to favorites',
                        secondButtonFunction: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteScreen()));
                        }
                    );
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
