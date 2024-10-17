import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:ricomusic/controlleres/likeController.dart';
import 'package:ricomusic/widget/detailPage.dart';

class MusicCard extends StatelessWidget {
  final ModelListview musicItem;
  final Likecontroller likecontroller = Get.put(Likecontroller());

  MusicCard({required this.musicItem});

  @override
  Widget build(BuildContext context) {
    if (musicItem == null) {
      return Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Text(
            'No data available',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        Get.to(() => DetailPage(musicItem: musicItem));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                musicItem!.imagePath,
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
                    musicItem!.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    musicItem!.artist,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    musicItem!.streams,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                if (!musicItem!.isLiked) {
                  likecontroller.addTask(musicItem!);
                  Get.snackbar('Info', '${musicItem!.title} added to favorites');
                } else {
                  Get.snackbar('Info', 'You can only unlike this song in Library Menu');
                }
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  musicItem!.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: musicItem!.isLiked ? Colors.redAccent : Colors.white,
                  key: ValueKey<bool>(musicItem!.isLiked),
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
