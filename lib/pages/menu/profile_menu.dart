import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ricomusic/widget/mycolor.dart'; 
class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
         
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              
              Container(
                height: 250, 
                decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
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

          // Text Section
          SizedBox(height: 60), 
          Text(
            "Hi, Taylor Swift",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkBlue, 
            ),
          ),

          Spacer(), 

          // Exit Button
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              onPressed: () {
                // Exit functionality
                    Get.toNamed('/'); 
                  
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                backgroundColor: darkBlue, 
              ),
              child: Text(
                'Exit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
