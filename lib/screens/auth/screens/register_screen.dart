import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:livreur/themes/themes.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../widgets/widgets.dart';
import '../../menus/menus.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  void showGuestCodeDialog(BuildContext context) {
    final dialog = AlertDialog(
      backgroundColor: Colors.white,
      title: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
            size: 26.sp,
          ),
        ),
      ),
      content: SizedBox(
        height: 18.h,
        width: 70.w,
        child: Column(
          children: [
            const Gap(10),
            Text(
              "Qu'est ce que le code de parrainage / invitation ?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14.sp),
            ),
            const Gap(10),
            Text(
              "Entrez le code de parrainage qui vous a été fourni, vous et votre parrain gagnerez une récompense lorsque vous paierez un service.",
              style: TextStyle(fontSize: 10.sp, color: Colors.black),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "D'accord",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorPrimary,
                  fontSize: 14.sp),
            ))
      ],
    );
    showDialog(context: context, builder: (context) => dialog);
  }

  var telephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "S'enregistrer",
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
                const CustomTextField(
                  hintText: "Nom complet",
                  keyboardType: TextInputType.name,
                ),
                Gap(2.h),
                const CustomTextField(
                  hintText: "Email(Facultatif)",
                  keyboardType: TextInputType.emailAddress,
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
                            suffix: IconButton(
                                onPressed: () {
                                  showGuestCodeDialog(context);
                                },
                                icon: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                )),
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
                            fontSize: 10.sp),
                      ),
                    ),
                  ],
                ),
                Gap(2.h),
                Row(
                  children: [
                    Checkbox.adaptive(
                      value: true,
                      onChanged: (value) {},
                      checkColor: Colors.white,
                      activeColor: colorPrimary,
                    ),
                    Expanded(
                      child: Text(
                        "Permettre à Fako Drop de vous informer des nouveautés et différentes offres promotionnelles disponibles",
                        style: TextStyle(fontSize: 8.sp),
                      ),
                    )
                  ],
                ),
                Gap(2.h),
                SubmitButton(
                  Constants.btnRegister,
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
                                fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key, this.controller, this.keyboardType, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13.w,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(6.w)),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
        ),
      ),
    );
  }
}
