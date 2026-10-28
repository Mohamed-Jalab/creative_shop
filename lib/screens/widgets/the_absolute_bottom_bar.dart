import 'package:flutter/material.dart';

import '../../shared/constant.dart';
import 'nav_bar_icon.dart';

class TheAbsoluteBottomBar extends StatefulWidget {
  TheAbsoluteBottomBar({super.key, required this.selectedInd});

  int selectedInd;

  @override
  State<TheAbsoluteBottomBar> createState() => _TheAbsoluteBottomBarState();
}

class _TheAbsoluteBottomBarState extends State<TheAbsoluteBottomBar> {
  @override
  Widget build(BuildContext context) {
    final navIcons = [
      NavBarIcon(
        onTap: () {
          if (selectedInd != 1) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => HomeScreen()));
            setState(() {
              selectedInd = 1;
            });
          }
        },
        icon: Icons.home_outlined,
        isSelected: selectedInd == 1,
        title: 'Home',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 2) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => const FavoritScreen()));
            setState(() {
              selectedInd = 2;
            });
          }
        },
        isSelected:selectedInd == 2,
        icon: Icons.favorite_outline_rounded,
        title: 'Favorite',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 3) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => const CartScreen()));
            setState(() {
              selectedInd = 3;
            });
          }
        },
        isSelected: selectedInd == 3,
        icon: Icons.shopping_cart_outlined,
        title: 'My Cart',
      ),
      NavBarIcon(
        onTap: () {
          if (selectedInd != 4) {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => const ProfileScreen()));
            setState(() {
              selectedInd = 4;
            });
          }
        },
        isSelected: selectedInd == 4,
        icon: Icons.person_outline_rounded,
        title: 'Profile',
      ),
    ];
    return BottomAppBar(
      elevation: 8,
      color: Colors.white,
      child: SizedBox(
        height: 72,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navIcons.length, (index) {
            bool isThisTheTime = (index + 1 == selectedInd);
            NavBarIcon returnedOne = NavBarIcon(
              onTap: navIcons[index].onTap,
              title: navIcons[index].title,
              icon: navIcons[index].icon,
              isSelected: isThisTheTime,
            );
            return returnedOne;
          }),
        ),
      ),
    );
  }
}
