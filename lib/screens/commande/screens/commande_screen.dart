import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';
import '../commande.dart';

class CommandeScreen extends StatefulWidget {
  const CommandeScreen({super.key});

  @override
  State<CommandeScreen> createState() => _CommandeScreenState();
}

class _CommandeScreenState extends State<CommandeScreen> {
  bool valideCommande = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w,
          bottom: 10.w,
        ),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Acceptation des commandes",
              style: TextStyle(
                color: colorBlack,
                fontWeight: FontWeight.normal,
                fontSize: 11.sp,
              ),
            ),
            Switch(
              value: valideCommande,
              activeColor: colorButton,
              onChanged: (bool value) {
                setState(() {
                  valideCommande = value;
                });
              },
            )
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
                    onPressed: () {},
                  ),
                  Text(
                    "Commandes",
                    style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.refresh_outlined,
                      color: colorWhite,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Gap(2.h),
            Center(
              child: Text(
                "Aujourd'hui",
                style: TextStyle(
                  color: colorGrey,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Gap(2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      width: 2,
                      color: colorTotal,
                    ),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VoirCommandeScreen(),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "5",
                            style: TextStyle(
                              color: colorBlack,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ),
                          Text(
                            "Commande(s)",
                            style: TextStyle(
                              color: colorGrey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.w),
                    border: Border.all(
                      width: 2,
                      color: colorBlack,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "3",
                          style: TextStyle(
                            color: colorBlack,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          "Moy. Evaluation",
                          style: TextStyle(
                            color: colorGrey,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
