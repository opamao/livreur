import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../commande.dart';

class LivraisonCommandeScreen extends StatefulWidget {
  const LivraisonCommandeScreen({super.key});

  @override
  State<LivraisonCommandeScreen> createState() =>
      _LivraisonCommandeScreenState();
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Collecter auprès de l'utilisateur",
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/fond2.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                          "Nom client livraison",
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
                      Center(
                        child: CircleAvatar(
                          backgroundColor: colorButton,
                          radius: 25.sp,
                          child: Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: colorWhite,
                              ),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.call_outlined,
                                color: colorBlack,
                                size: 27.sp,
                              ),
                              onPressed: () {},
                            ),
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adresse du store",
                        style: TextStyle(
                          color: colorBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        surfaceTintColor: colorWhite,
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailLivraisonScreen(),
                                ),
                              );
                            },
                            leading: Container(
                              padding: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.w),
                                  color: colorGrey),
                              child: Image.asset("assets/images/pharmacie.png"),
                            ),
                            title: Text(
                              "Store",
                              style: TextStyle(
                                color: colorBlack,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "72Q9+VFQ, Abidjan, Côte d'Ivoire",
                              style: TextStyle(
                                color: colorBlack,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap(2.h),
                      Text(
                        "Détails de l'article",
                        style: TextStyle(
                          color: colorBlack,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Card(
                        surfaceTintColor: colorWhite,
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: ListTile(
                            onTap: () {},
                            leading: Container(
                              padding: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(2.w),
                                color: colorGrey,
                              ),
                              child: Image.asset("assets/images/pharmacie.png"),
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
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 50.w,
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
