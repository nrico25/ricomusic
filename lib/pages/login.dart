import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/widget/mycolor.dart';

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
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: darkBlue, 
                  ),
                  onPressed: () {
                    Get.toNamed('/dashboard'); 
                  },
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900, 
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
