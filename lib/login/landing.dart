import 'package:flutter/material.dart';
import 'package:tiktokgov/login/register.dart';
import 'package:tiktokgov/prueba/cl2.dart';
import 'log.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool txtBtnPressed = false;
  int currentpage = 0;
  int nextPage = 0;
  final pageController = PageController(
    initialPage: 0,
  );

  void _onChangePage(int changePage) {
    if (changePage == 0) {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 520),
        curve: Curves.easeOutExpo,
      );
    } else {
      pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 520),
        curve: Curves.easeOutExpo,
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.975,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    (MediaQuery.of(context).size.width * 0.55) / 15),
                child: FadePageView(), /*PageView(
                  onPageChanged: (value) {
                    setState(() {
                      currentpage = value;
                    });
                  },
                  controller: pageController,
                  children: [
                    //log
                    Login(
                      onChangePage: _onChangePage,
                    ),
                    //reg
                    Register(onChangePage: _onChangePage),
                  ],
                ),*/
              ),
            ),
          ],
        ),
      ],
    );
  }
}
