import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/listItem1.dart';
import 'package:ricomusic/widget/songList.dart';
import 'package:ricomusic/widget/songTrend.dart';
import 'package:ricomusic/model/model_listview.dart'; 
import 'package:ricomusic/widget/mycolor.dart'; 

class LibraryMenu extends StatelessWidget {
  const LibraryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue, 
      body: SafeArea( 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                Text(
                  'Favorite Album Songs?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),

               ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), 
                  itemCount: musicItems.length, 
                  itemBuilder: (context, index) {
                    return MusicCard(musicItem: topAlbumSongs[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
