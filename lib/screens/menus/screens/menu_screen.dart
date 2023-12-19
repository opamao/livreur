import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';

import '../../../themes/themes.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  final Widget _home = Container();
  final Widget _commande = Container();
  final Widget _profil = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: getBody(),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.home,
            title: "Accueil",
          ),
          TabData(
            iconData: Icons.search,
            title: "Commande",
          ),
          TabData(
            iconData: Icons.shopping_cart,
            title: "Profil",
          )
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
    );
  }

  Widget getBody() {
    if (currentPage == 0) {
      return _home;
    } else if (currentPage == 1) {
      return _commande;
    } else {
      return _profil;
    }
  }
}
