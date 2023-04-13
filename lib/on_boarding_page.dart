import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data.dart';

class OnBoardingPge extends StatefulWidget {
  const OnBoardingPge({super.key});

  @override
  State<OnBoardingPge> createState() => _OnBoardingPgeState();
}

class _OnBoardingPgeState extends State<OnBoardingPge> {
  late double _width = MediaQuery.of(context).size.width / 3;
  int _imageIndex = 0;

  void next() {
    if (_width < MediaQuery.of(context).size.width) {
      setState(() {
        _width += MediaQuery.of(context).size.width / 3;
        _imageIndex = (_imageIndex + 1) % list.length;
      });
    } else {
      print("go next");
    }
  }

  // void back() {
  //   if (_width > MediaQuery.of(context).size.width) {
  //     setState(() {
  //       _width -= MediaQuery.of(context).size.width / 3;
  //       _imageIndex = (_imageIndex - 1) % _list.length;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            SizedBox(
              width: double.infinity,
              height: size.height * 0.3,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: Image.asset(
                  list[_imageIndex].image,
                  key: ValueKey<String>(list[_imageIndex].image),
                ),
              ),
            ),
            const Spacer(),
            OverflowBar(
              overflowSpacing: size.height * 0.034,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    list[_imageIndex].title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    list[_imageIndex].dec,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black45,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 5,
                      width: size.width,
                      color: Colors.black38,
                    ),
                    AnimatedContainer(
                      width: _width,
                      height: 5,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Text(
                        "Skip",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: next,
                      child: Text(
                        _imageIndex == 2 ? "Get Started" : "Next",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
