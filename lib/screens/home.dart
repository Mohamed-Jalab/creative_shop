import 'package:creative_shop/screens/cart_screen.dart';
import 'package:creative_shop/screens/favorite_screen.dart';
import 'package:creative_shop/screens/home_screen.dart';
import 'package:creative_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/bottom_nav_bar/cubit.dart';
import '../shared/constant.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late List<Widget> pageList = [];

  @override
  initState(){
    super.initState();
    pageList.add(HomeScreen());
    pageList.add(FavoriteScreen());
    pageList.add(CartScreen());
    pageList.add(ProfileScreen());


  }

  List<Widget> screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BottomNavBarCubit>();
    final currentIndex = cubit.index - 1;

    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: const Offset(0, -.2),
                  blurRadius: 15),
            ],
          ),
          height: 60,
          child: BottomNavigationBarTheme(
            data: const BottomNavigationBarThemeData(
                unselectedItemColor: Colors.black38,
                selectedItemColor: secondaryColor,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (value) {
                cubit.changeTab(value + 1);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(currentIndex == 1 ? Icons.favorite : Icons.favorite_outline),
                    label: 'Favorite'),
                BottomNavigationBarItem(
                    icon: Icon(currentIndex == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined),
                    label: 'My Cart'),
                BottomNavigationBarItem(
                    icon: Icon(currentIndex == 3 ? Icons.person_rounded : Icons.person_outline_rounded),
                    label: 'Profile'),
              ],
            ),
          ),
        )
    );
  }
}
// check