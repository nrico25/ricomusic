import 'package:flutter/material.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:ricomusic/widget/mycolor.dart'; 

class DetailPage extends StatelessWidget {
  final ModelListview musicItem;

  const DetailPage({Key? key, required this.musicItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue, // Using your reusable darkBlue color
      appBar: AppBar(
        backgroundColor: darkBlue,
        title: Text(musicItem.title, style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  musicItem.imagePath,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              musicItem.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              musicItem.artist,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Streams: ${musicItem.streams}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'More details about the song can go here.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
