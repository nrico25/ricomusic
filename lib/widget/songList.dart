import 'package:flutter/material.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:get/get.dart';
import 'package:ricomusic/widget/detailPage.dart';
import 'package:ricomusic/widget/mycolor.dart'; 
import 'package:ricomusic/widget/detailPage.dart'; // Import the detail page

class MusicCard extends StatelessWidget {
  final ModelListview? musicSearch;
  final ModelListview? musicItem;

  MusicCard({this.musicSearch, this.musicItem});

  @override
  Widget build(BuildContext context) {
    final data = musicItem ?? musicSearch;

    if (data == null) {
      return Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            'No data available',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPage(musicItem: data)); // Navigate to DetailPage
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8), 
              child: Image.asset(
                data.imagePath,
                width: 88,
                height: 88,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12), 
           
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title, 
                    style: TextStyle(
                      fontSize: 16, 
                      fontWeight: FontWeight.w600, 
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4), 
                  Text(
                    data.artist,
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.w400,
                      color: Colors.white70, 
                    ),
                  ),
                  const SizedBox(height: 4), 
                  Text(
                    data.streams, 
                    style: TextStyle(
                      fontSize: 12, 
                      fontWeight: FontWeight.w400,
                      color: Colors.white54, 
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
