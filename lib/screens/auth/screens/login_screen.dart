import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../../menus/menus.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var telephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Se connecter",
                style: TextStyle(
                  color: colorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
              Gap(4.h),
              InputText(
                hintText: "Téléphone",
                keyboardType: TextInputType.number,
                controller: telephone,
                validatorMessage: "Veuillez téléphone",
              ),
              Gap(2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // padding: EdgeInsets.all(2.w),
                    width: 48.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.w),
                        color: Colors.grey.withOpacity(0.1)),
                    child: Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Code parrainage",
                          border: InputBorder.none,
                          suffix: const Icon(
                            Icons.error,
                            color: Colors.red,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 3.w,
                          ),
                        ),
                        style: TextStyle(fontSize: 12.sp, color: Colors.black),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(6.w),
                    ),
                    child: Text(
                      "Vérifier et ajouter",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(2.h),
              SubmitButton(
                Constants.btnLogin,
                textcouleur: colorWhite,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MenuScreen(),
                    ),
                  );
                },
              ),
              Gap(2.h),
              Text.rich(
                TextSpan(
                  text: "Vous n'avez pas de compte ?",
                  style: TextStyle(fontSize: 10.sp),
                  children: [
                    TextSpan(
                      text: " S'inscrire",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: colorPrimary,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
              Gap(2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: 10.w,
                      child: Divider(
                        thickness: 2,
                        height: 1.w,
                      )),
                  Text(
                    "Ou utilisez votre compte",
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.w,
                    child: Divider(
                      thickness: 2,
                      height: 1.w,
                    ),
                  ),
                ],
              ),
              Gap(2.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.withOpacity(0.8)),
                        borderRadius: BorderRadius.circular(2.w)),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          width: 8.w,
                        ),
                        Gap(2.h),
                        Text(
                          "Google",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Gap(2.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.blue.withOpacity(0.8)),
                        borderRadius: BorderRadius.circular(2.w)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 8.w,
                        ),
                        Gap(2.h),
                        Text(
                          "Apple",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
