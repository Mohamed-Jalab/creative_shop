import 'package:flutter/material.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({
    super.key,
    this.color = Colors.green,
    required this.image,
    this.title = 'Get your special offers',
    this.onTap,
  });

  final Color color;
  final Image image;
  final String title;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    Image imm = Image(
      image: image.image,
      fit: BoxFit.cover,
      //height: double.maxFinite,
      alignment: Alignment.topRight,
    );

    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16))),
        clipBehavior: Clip.antiAlias,
        color: color,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    constraints: const BoxConstraints(maxWidth: 120),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                      softWrap: true,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      onTap!();
                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(color),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      textStyle: MaterialStateTextStyle.resolveWith(
                        (states) => TextStyle(
                          color: color,
                        ),
                      ),
                    ),
                    child: const Text('Shop now!'),
                  )
                ],
              ),
            ),
            Expanded(child: imm),
          ],
        ),
      ),
    );
  }
}
