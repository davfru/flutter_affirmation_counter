import 'package:flutter/material.dart';
import 'package:flutter_pomodoro_timer/theme/app_colors.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key, required this.title});
  final String title;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late PageController _pageController;
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController()
      ..addListener(() {
        setState(() {
          _progress = _pageController.page ?? 0;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.lightBlue,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 250),
              child: Center(
                child: Image.asset(
                  "assets/images/bg.png",
                  width: MediaQuery.of(context).size.width *
                      0.7, // Adjust the width as needed
                  height: MediaQuery.of(context).size.height *
                      0.5, // Adjust the height as needed
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height:
                    MediaQuery.of(context).size.height * 0.35 + _progress * 150,
                child: Column(
                  children: [
                    Expanded(
                        child: PageView(
                      controller: _pageController,
                      children: [
                        Text("Page")
                      ],
                    ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
