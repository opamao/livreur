import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../commande.dart';

class EtatCommandeScreen extends StatefulWidget {
  const EtatCommandeScreen({super.key});

  @override
  State<EtatCommandeScreen> createState() => _EtatCommandeScreenState();
}

class _EtatCommandeScreenState extends State<EtatCommandeScreen>
    with TickerProviderStateMixin {
  int _duration = 60; // Durée du décompte en secondes
  late AnimationController _controller;
  double _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: _duration),
    )..addListener(() {
        setState(() {
          _progress = 1 - _controller.value;
        });
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get timerText {
    // Convertir le temps restant en format minutes:secondes
    int minutes = (_duration - (_controller.value * _duration)).floor();
    int seconds = (_controller.value * _duration * 60).floor() % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: colorWhite,
          border: Border(
            top: BorderSide(
              color: colorGrey,
              width: 2,
            ),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.w),
            topRight: Radius.circular(5.w),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(2.h),
            Text(
              "Livraison demandée",
              style: TextStyle(
                color: colorBlack,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
              ),
            ),
            Gap(2.h),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LivraisonCommandeScreen(),
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pharmacie du golf",
                    style: TextStyle(
                      color: colorBlack,
                      fontWeight: FontWeight.normal,
                      fontSize: 11.sp,
                    ),
                  ),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    itemSize: 15.sp,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: colorGrey,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
            Gap(2.h),
            Row(
              children: [
                Expanded(
                  child: CancelButton(
                    Constants.btnAnnuler,
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: colorWhite,
                            surfaceTintColor: colorWhite,
                            title: Image.asset(
                              "assets/icons/alarm.png",
                              height: 10.h,
                            ),
                            content: Text(
                              "Êtes-vous sûr de vouloir décliner l'offre ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorBlack,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: Text(
                                  'Annuler',
                                  style: TextStyle(
                                    color: colorGrey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: Text(
                                  'Confirmer',
                                  style: TextStyle(
                                    color: colorButton,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
                Gap(4.w),
                Expanded(
                  child: SubmitButton(
                    Constants.btnAccepte,
                    onPressed: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: colorWhite,
                            surfaceTintColor: colorWhite,
                            title: Image.asset(
                              "assets/icons/bell.png",
                              height: 10.h,
                            ),
                            content: Text(
                              "Êtes-vous sûr de vouloir accepter l'offre ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorBlack,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: Text(
                                  'Annuler',
                                  style: TextStyle(
                                    color: colorGrey,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  textStyle:
                                      Theme.of(context).textTheme.labelLarge,
                                ),
                                child: Text(
                                  'Confirmer',
                                  style: TextStyle(
                                    color: colorButton,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3.w),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/fond1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      color: colorWhite,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.person_4_outlined,
                        color: colorBlack,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "Immeuble blanchard, Rue Marconi",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: colorWhite),
                    ),
                  ),
                  Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.w),
                      color: colorWhite,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_none_outlined,
                        color: colorBlack,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            Gap(2.h),
            Stack(
              children: [
                Container(
                  color: colorWhite,
                  child: Text("Google Maps"),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50.sp,
                      backgroundColor: colorPrimary,
                      child: SizedBox(
                        height: 28.w,
                        width: 28.w,
                        child: CircularProgressIndicator(
                          value: _progress,
                          color: colorWhite,
                        ),
                      ),
                    ),
                    Text(
                      timerText,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: colorWhite,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
