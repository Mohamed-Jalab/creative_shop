import 'package:flutter/material.dart';

import '../../shared/constant.dart';

class ReviewsTaskiij extends StatelessWidget {
  const ReviewsTaskiij({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
          child: Divider(endIndent: 8, indent: 8, thickness: 1),
        ),
        const Padding(
          padding: EdgeInsets.only(right:8.0,left: 8.0),
          child: Text(
            'Item reviews and shop ratings',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.05),
          ),
        ),
        const SizedBox(height: 8),
        const Padding(
          padding: EdgeInsets.only(right:8.0,left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '4.98',
                          style: TextStyle(fontSize: 32),
                        ),
                        Icon(Icons.star_rounded, color: Colors.amber)
                      ],
                    ),
                    Text('2.4K ratings')
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Item quality'),
                        Row(children: [
                          SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                value: 100,
                                color: secondaryColor,
                              )),
                          SizedBox(width: 4),
                          Text('5.0'),
                        ]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Shipping'),
                        Row(children: [
                          SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(
                                value: 100,
                                color: secondaryColor,
                              )),
                          SizedBox(width: 4),
                          Text('5.0'),
                        ]),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Customer Service'),
                        Row(children: [
                          SizedBox(
                              width: 100,
                              child: LinearProgressIndicator(

                                value: 100,
                                color: secondaryColor,
                              )),
                          SizedBox(width: 4),
                          Text('5.0'),
                        ]),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left:8.0,top: 8.0, bottom: 16.0),
          child: Text(
            'Item reviews',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.05),
          ),
        ),
        SizedBox(
          height: 160,
          child: PageView(
            clipBehavior: Clip.antiAlias,
            controller: PageController(viewportFraction: .9),
            children: List.generate(3, (index) {
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Misha',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text(
                            'Jul 30, 2023',
                            style:
                            TextStyle(color: Colors.grey.withOpacity(.7)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: List.generate(
                            5,
                                (index) => const Icon(Icons.star_rounded,
                                color: Colors.amber)),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                          'Absolutely loved the 3 hand make nesting bowls. Stunning!')
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top:8,right: 98.0, left: 98.0),
          child: OutlinedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(primaryColor.withOpacity(.1)),
              side: MaterialStateProperty.all<BorderSide>(
                  const BorderSide(color: primaryColor, width: 2)),
              foregroundColor: MaterialStateProperty.all<Color>(primaryColor),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000),
                  ),
                ),
              ),
            ),
            onPressed: () {
              print('not working :)');
            },
            child: const Text('See all reviews (19)'),
          ),
        )
      ],
    );
  }
}
