import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:ricomusic/controlleres/likeController.dart';
import 'package:ricomusic/widget/detailPage.dart';

class MusicCard extends StatelessWidget {
  final ModelListview? musicSearch;
  final ModelListview? musicItem;
  final ModelListview? topAlbumSongs;

  final LikeController taskController = Get.put(LikeController());

  MusicCard({this.musicSearch, this.musicItem, this.topAlbumSongs});

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
        Get.to(() => DetailPage(musicItem: data));
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
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                if (!data.isLiked) {
                  taskController.likeSong(data);
                } else {
                  Get.defaultDialog(
                    title: 'Confirmation',
                    content: Text('Are you sure you want to unlike this song?'),
                    onConfirm: () {
                      taskController.unlikeSong(data);
                      Get.back();
                    },
                    textCancel: 'No',
                    textConfirm: 'Yes',
                  );
                }
              },
              child: Obx(()=>AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  data.isLiked ? Icons.favorite : Icons.favorite_border,
                  color: data.isLiked ? Colors.red : Colors.redAccent,
                  key: ValueKey<bool>(data.isLiked),
                  size: 24,
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
