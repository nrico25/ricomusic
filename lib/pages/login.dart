import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/widget/mycolor.dart';
import 'package:ricomusic/widget/button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkBlue, 
        child: Stack(
          children: [
            Positioned(
              top: -200,
              right: 0,
              left: 30,
              child: Image.asset(
                'images/loginMusics.png', 
                height: 900,
                width: 800,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: CustomButton(
                  text: 'Continue',
                  onPressed: () {
                    Get.toNamed('/dashboard'); 
                  },
                  backgroundColor: darkBlue,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
