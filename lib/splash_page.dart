import 'package:flutter/material.dart';
import 'const.dart';
import 'home_page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: kHorizontalMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DSC Flutter Weekly",
              textAlign: TextAlign.center,
              style: kBlackTextStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 32.0),
            ),
            Image(
              height: 250,
              image: AssetImage("images/logo.png"),
            ),
            SizedBox(
              height: 75,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: kAccentColor1,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Go to Home Page",
                  style: kWhiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
