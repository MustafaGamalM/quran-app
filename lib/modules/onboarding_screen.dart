import 'package:flutter/material.dart';

import '../layout/Quaran_Home.dart';
import '../shared/constants.dart';
import '../shared/network/cashe_helper.dart';
import '../shared/strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: MyColors.onboardBackground,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .13,
            ),
            Text(
              '${MyStrings.arabicString["on_board_title"]}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: MyColors.textColor),
            ),
            SizedBox(
              height: height * .01,
            ),
            Text(
              '${MyStrings.arabicString["on_board_content"]}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: MyColors.textColor,
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: height * 0.55,
              width: width * 0.8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mosque 2.png'),
                  ),
                  color: MyColors.onboardContainer,
                  borderRadius: BorderRadius.circular(40)),
              child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: -25,
                      child: Container(
                        height: 51,
                        width: 183,
                        child: TextButton(
                          child: Text(
                            '${MyStrings.arabicString["on_board_start"]}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            CasheHelper.saveData(key: 'isClicked', value: true)
                                .then((value) {
                              if (value = true)
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (_) {
                                  return QuaranHome();
                                }));
                            });
                          },
                        ),
                        decoration: BoxDecoration(
                            color: MyColors.buttonColor,
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
