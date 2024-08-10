import 'package:flutter/material.dart';
import 'package:music_app/constants/screen_key.dart';
import 'package:music_app/constants/style.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  void goToLogin(BuildContext context) {
    Navigator.pushNamed(context, loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/landingpage.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(50),
              child: Text(
                "Welcome to music play app",
                style: textBoldStyle.merge(const TextStyle(
                    fontSize: 32, color: Color.fromRGBO(35, 202, 108, 1))),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: InkWell(
                  onTap: () => goToLogin(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Started',
                        style: textBoldStyle.merge(const TextStyle(
                            fontSize: 26,
                            color: Color.fromRGBO(35, 202, 108, 1))),
                      ),
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: Color.fromRGBO(35, 202, 108, 1),
                        size: 30,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
