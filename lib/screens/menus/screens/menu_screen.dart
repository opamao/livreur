import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation_2/fancy_bottom_navigation.dart';

import '../../../themes/themes.dart';
import '../../acceuil/accueil.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  final Widget _home = const AccueilScreen();
  final Widget _commande = Container();
  final Widget _profil = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: getBody(),
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: colorPrimary,
        activeIconColor: colorWhite,
        inactiveIconColor: colorGrey,
        textColor: colorPrimary,
        tabs: [
          TabData(
            iconData: Icons.home_filled,
            title: "Accueil",
          ),
          TabData(
            iconData: Icons.reorder_outlined,
            title: "Commande",
          ),
          TabData(
            iconData: Icons.person_4_outlined,
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
