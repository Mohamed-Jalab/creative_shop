import 'package:flutter/material.dart';

class CateCard extends StatelessWidget {
  // !cateCards in home_screen
  const CateCard({
    super.key,
    this.title = 'Category',
    required this.image,
    required this.onTap,
  });

  final String title;
  final ImageProvider image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        // !put Navigator
      },
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            SizedBox(
              height: 120,
              width: 1000,
              child: Card(
                clipBehavior: Clip.antiAlias,
                elevation: 8,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                margin: EdgeInsets.zero,
                child: Image(
                  fit: BoxFit.cover,
                  image: image,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
