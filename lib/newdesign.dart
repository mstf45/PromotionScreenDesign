import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'home.dart';
import 'intro_screens/intro_page_1.dart';
import 'intro_screens/intro_page_2.dart';
import 'intro_screens/intro_page_3.dart';

class NewDesign extends StatefulWidget {
  const NewDesign({Key? key}) : super(key: key);

  @override
  State<NewDesign> createState() => _NewDesignState();
}

class _NewDesignState extends State<NewDesign> {
  final PageController _controller = PageController();
  bool _isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                _isLastPage = (value == 2);
              });
            },
            controller: _controller,
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    _controller.animateToPage(
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.orangeAccent.shade400,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: Colors.white,
                    activeDotColor: Colors.orange,
                  ),
                ),
                _isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        child: Text(
                          'done',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.orangeAccent.shade400,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.orangeAccent.shade400,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
