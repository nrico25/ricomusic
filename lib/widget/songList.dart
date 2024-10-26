import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/model_listview.dart';
import 'package:ricomusic/controlleres/likeController.dart';
import 'package:ricomusic/widget/detailPage.dart';

class MusicCard extends StatelessWidget {
  final ModelListview musicItem;
  final bool isInLibraryMenu;
  final Likecontroller likecontroller = Get.put(Likecontroller());

  MusicCard({required this.musicItem, this.isInLibraryMenu = false});

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
            SizedBox(width: 8),
            //  Obx(() =>GestureDetector(
            //   onTap: () {
            //     if (isInLibraryMenu) {
            //       likecontroller.deleteTask(musicItem.id!);
            //     } else {
            //       likecontroller.addTask(musicItem);
            //     }
            //     Get.snackbar('Info', '${musicItem.title} ditambahkan dari favorit');
            //   },
            //   child: Icon(
            //       isInLibraryMenu ? Icons.favorite : Icons.favorite_border,
            //       color: isInLibraryMenu ? Colors.redAccent : Colors.white,
            //       key: ValueKey<bool>(isInLibraryMenu),
            //       size: 24,
            //     ),
            //  )),
            GestureDetector(
              onTap: () {
                if(isInLibraryMenu) {
                  likecontroller.deleteTask(musicItem.id!);
                } else {
                  likecontroller.addTask(musicItem!);
                }
                Get.snackbar('Info', '${musicItem.title} ditambahkan dari favorit');

              },
              
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: Icon(
                  isInLibraryMenu ? Icons.favorite : Icons.favorite_border,
                  color: isInLibraryMenu ? Colors.redAccent : Colors.white,
                  key: ValueKey<bool>(isInLibraryMenu),
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
