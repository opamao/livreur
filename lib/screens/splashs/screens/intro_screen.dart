import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../../menus/menus.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  final int _maxPage = 3;
  Timer? _timer;
  final int _progressSteps = 100;
  int _currentStep = 0;

  @override
  void initState() {
    super.initState();
    startAutoPageChange();
  }

  void startAutoPageChange() {
    const totalDurationSeconds = 5;
    const duration = Duration(seconds: totalDurationSeconds);

    _timer = Timer.periodic(duration ~/ _progressSteps, (timer) {
      setState(() {
        if (_currentStep < _progressSteps) {
          _currentStep++;
        } else {
          if (_currentPage < _maxPage) {
            _currentPage++;
            _currentStep = 0;
            _pageController.animateToPage(
              _currentPage,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          } else {
            _currentPage = 0;
            _currentStep = 0;
            _pageController.jumpToPage(0);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  final List<Map<String, dynamic>> pageData = [
    {
      'titre': "Découvrez les Havres de Beauté à proximité",
      'description':
          "Découvrez les secrets de beauté cachés dans votre quartier !",
      'assets': 'assets/images/chemin.png',
    },
    {
      'titre': "Prise de rendez-vous sans effort",
      'description':
          "Choisissez le salon de vos rêves, la date de votre choix et réservez votre place en quelques clics.",
      'assets': 'assets/images/livraison.png',
    },
    {
      'titre': "Se connecter et converser avec les salons",
      'description':
          "Des chats en temps réel pour des consultations beauté sans effort.",
      'assets': 'assets/images/personnel.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      body: Padding(
        padding: EdgeInsets.all(4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(5.h),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: _currentPage == 0
                          ? _currentStep / _progressSteps.toDouble()
                          : _currentPage > 0
                              ? 1.0
                              : 0.0,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                    ),
                  ),
                  Gap(1.w),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: _currentPage == 1
                          ? _currentStep / _progressSteps.toDouble()
                          : _currentPage > 1
                              ? 1.0
                              : 0.0,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                    ),
                  ),
                  Gap(1.w),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: _currentPage == 2
                          ? _currentStep / _progressSteps.toDouble()
                          : 0.0,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(colorPrimary),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _handleTap();
                },
                child: Center(
                  child: PageView(
                    controller: _pageController,
                    children: pageData.map((page) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(
                                page['assets'],
                                height: 40.h,
                              ),
                            ),
                            Gap(4.h),
                            Text(
                              page['titre'],
                              style: TextStyle(
                                color: colorBlack,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Gap(2.h),
                            Text(
                              page['description'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: colorGrey,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Gap(2.h),
                          ],
                        ),
                      );
                    }).toList(),
                    onPageChanged: (index) {
                      _currentPage = index;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ),
            Divider(
              height: 2.h,
              thickness: 1,
              color: Colors.grey.withOpacity(.4),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SubmitButton(
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
                ),
                Gap(2.w),
                Expanded(
                  child: CancelButton(
                    Constants.btnRegister,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool get _hasNext {
    return _currentPage < 2;
  }

  void _handleTap() {
    if (_currentPage < _maxPage) {
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _currentPage = 0;
      _pageController.jumpToPage(0);
    }
  }
}
