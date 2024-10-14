import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:ricomusic/controlleres/likeController.dart';
import 'package:ricomusic/widget/songList.dart';
import 'package:ricomusic/widget/mycolor.dart';
import 'package:ricomusic/widget/button.dart';

class ProfileMenu extends StatelessWidget {
  final LikeController taskController = Get.put(LikeController());

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
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
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
          SizedBox(height: 60),
          Text(
            "Hi, Taylor Swift",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Liked Songs",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: darkBlue,
            ),
          ),
          Expanded(
            child: Obx(() {
              if (taskController.likedSongs.isEmpty) {
                return Center(
                  child: Text(
                    "No liked songs available",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                );
              }
              

              return ListView.builder(
                itemCount: taskController.likedSongs.length,
                itemBuilder: (context, index) {
                  final likedSong = taskController.likedSongs[index];
                  return MusicCard(
                    musicItem: likedSong,
                    topAlbumSongs: null,
                    musicSearch: null,
                  );
                },
              );
            }),
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
