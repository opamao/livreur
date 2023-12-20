import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';

class AccueilScreen extends StatefulWidget {
  const AccueilScreen({super.key});

  @override
  State<AccueilScreen> createState() => _AccueilScreenState();
}

class _AccueilScreenState extends State<AccueilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3.w),
              color: colorPrimary,
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
                  LiteRollingSwitch(
                    value: true,
                    width: 35.w,
                    textOn: 'En ligne',
                    textOff: 'Inactif',
                    colorOn: Colors.green,
                    colorOff: Colors.red,
                    iconOn: Icons.lightbulb_outline,
                    iconOff: Icons.power_settings_new,
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (bool state) {
                      print('turned ${(state) ? 'on' : 'off'}');
                    },
                    onDoubleTap: () {},
                    onSwipe: () {},
                    onTap: () {},
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
                          "Voyage(s)",
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
            Gap(2.h),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: colorGrey,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.w),
                      topRight: Radius.circular(5.w),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Carte Google Maps",
                      style: TextStyle(color: colorBlack),
                    ),
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
