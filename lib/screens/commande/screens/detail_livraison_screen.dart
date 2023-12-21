import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';

class DetailLivraisonScreen extends StatefulWidget {
  const DetailLivraisonScreen({super.key});

  @override
  State<DetailLivraisonScreen> createState() => _DetailLivraisonScreenState();
}

class _DetailLivraisonScreenState extends State<DetailLivraisonScreen> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Montant de la facture",
                  style: TextStyle(
                    color: colorBlack,
                    fontWeight: FontWeight.normal,
                    fontSize: 11.sp,
                  ),
                ),
                Text(
                  "9.000 FCFA",
                  style: TextStyle(
                    color: colorTotal,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp,
                  ),
                )
              ],
            ),
            Gap(2.h),
            SubmitButton(
              Constants.btnConfirm,
              couleur: colorButton,
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
                            textStyle: Theme.of(context).textTheme.labelLarge,
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
                            textStyle: Theme.of(context).textTheme.labelLarge,
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
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(3.w),
                  color: colorPrimary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                      ListTile(
                        leading: CircleAvatar(
                          radius: 35.sp,
                          backgroundColor: colorWhite,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            // Border radius
                            child: CircleAvatar(
                              radius: 20.sp,
                              backgroundColor: colorGrey,
                            ),
                          ),
                        ),
                        title: Text(
                          "Pharmacie du Golf",
                          style: TextStyle(
                            color: colorWhite,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          "72Q9+VFQ, Abidjan, Côte d'Ivoire",
                          style: TextStyle(
                            color: colorWhite,
                            fontSize: 8.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Gap(4.h),
                    ],
                  ),
                ),
                Gap(8.h),
                Center(
                  child: Text(
                    "Vend, 27 Oct 2023 à 11:54",
                    style: TextStyle(
                      color: colorGrey,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Card(
                    surfaceTintColor: colorWhite,
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: ListTile(
                        leading: Checkbox(
                          autofocus: true,
                          value: true,
                          onChanged: (bool? value) {},
                        ),
                        title: Text(
                          "SMECTA 3G SUSPENSION BUVABLE",
                          style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                        ),
                        subtitle: Text(
                          "4.500 FCFA",
                          style: TextStyle(
                            color: colorTextPrice,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          "x2",
                          style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 33.w,
              left: 18.w,
              child: Card(
                surfaceTintColor: colorWhite,
                shadowColor: colorWhite,
                color: colorWhite,
                child: Container(
                  height: 8.h,
                  padding: EdgeInsets.all(2.w),
                  margin: EdgeInsets.all(2.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Commande ramassée",
                        style: TextStyle(
                          color: colorBlack,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        "Commande #Fako000123",
                        style: TextStyle(
                          color: colorButton,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
