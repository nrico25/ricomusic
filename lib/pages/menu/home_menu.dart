import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/listItem1.dart';
import 'package:ricomusic/widget/songList.dart';
import 'package:ricomusic/widget/songTrend.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:ricomusic/widget/mycolor.dart';

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/ariana.png'),
                        radius: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.notifications,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Top Album',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: musicTrends.length,
                    itemBuilder: (context, index) {
                      // return Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Image.asset(
                      //     musicTrends[index].imagePath,
                      //     width: 150,
                      //     height: 150,
                      //     fit: BoxFit.cover,
                      //   ),
                      // );
                      return Songtrend(musicTrends: musicTrends[index]);
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Recommend for you',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: topMusic.length,
                      itemBuilder: (context, index) {
                        return MusicCard(musicItem: topMusic[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(
    home: HomeMenu(),
  ));
}
