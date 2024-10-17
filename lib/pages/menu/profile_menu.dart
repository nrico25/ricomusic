import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/controlleres/likeController.dart';
import 'package:ricomusic/widget/mycolor.dart';
import 'package:ricomusic/widget/button.dart';

class ProfileMenu extends StatelessWidget {

  ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Menu"),
        backgroundColor: darkBlue,
      ),
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
              ),
              Positioned(
                bottom: -50,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/ariana.png'),
                ),
              ),
            ],
          ),
          SizedBox(height: 60),
          Text(
            "Hi, Taylor Swift",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: CustomButton(
              text: 'Exit',
              onPressed: () {
                Get.toNamed('/');
              },
              backgroundColor: darkBlue,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
