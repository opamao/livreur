import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class LivraisonCommandeScreen extends StatefulWidget {
  const LivraisonCommandeScreen({super.key});

  @override
  State<LivraisonCommandeScreen> createState() => _LivraisonCommandeScreenState();
}

class _LivraisonCommandeScreenState extends State<LivraisonCommandeScreen> {
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
            Row(
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
              color: colorPrimary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: colorWhite,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "Livraison",
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: colorWhite,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
