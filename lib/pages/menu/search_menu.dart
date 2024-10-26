import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/listItem1.dart';
import 'package:ricomusic/widget/songList.dart';
import 'package:ricomusic/widget/songTrend.dart';
import 'package:ricomusic/model/model_listview.dart'; 
import 'package:ricomusic/widget/mycolor.dart'; 
import 'package:ricomusic/controlleres/search_controller.dart'; 

class SearchMenu extends StatelessWidget {
  
  const SearchMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchLogic controllersearch = Get.put(SearchLogic());
    return Scaffold(
      backgroundColor: darkBlue, 
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'What song you want?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                onChanged: (value) {
                  controllersearch.updateSearch(value); 
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for songs...',
                  hintStyle: TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controllersearch.filteredMusicList.length,
                itemBuilder: (context, index) {
                  return MusicCard(musicSearch: controllersearch.filteredMusicList[index]);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
