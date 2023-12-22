import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../../auth/auth.dart';
import '../../menus/menus.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final VideoPlayerController _controller =
  VideoPlayerController.asset("assets/videos/video.mp4");
  ChewieController? chewieController;

  @override
  void initState() {
    chewieController = ChewieController(
        videoPlayerController: _controller,
        autoPlay: true,
        looping: true,
        showControls: false,
        allowFullScreen: true,
        allowMuting: true,
        allowPlaybackSpeedChanging: false,
        aspectRatio: 9 / 20);
    super.initState();
  }

  @override
  void dispose() {
    chewieController!.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Chewie(controller: chewieController!),
        Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Le service de livraison a l'ivoirienne",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colorWhite,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
              Image.asset("assets/images/rond.png", height: 25.h,),
              Column(
                children: [
                  SubmitButton(
                    Constants.btnLogin,
                    textcouleur: colorWhite,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                  ),
                  Gap(2.h),
                  SubmitButton(
                    Constants.btnRegister,
                    textcouleur: colorWhite,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RegisterScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
