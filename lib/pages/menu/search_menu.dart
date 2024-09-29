import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/widget/songList.dart'; // Import the reusable widget
import 'package:ricomusic/widget/songTrend.dart';
import 'package:ricomusic/model/model_listview.dart'; // Import the model
import 'package:ricomusic/widget/mycolor.dart'; // Custom Color class

class SearchMenu extends StatelessWidget {
  const SearchMenu({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: darkBlue, // Warna background dari custom color
      body: SafeArea( // Tambahkan SafeArea di sini
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding umum untuk konten
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Memastikan konten rata kiri
              children: [

                SizedBox(height: 20),

                Text(
                  'What song you want?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),

                // ListView untuk MusicCard di bawah SongTrend
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), // ListView tidak scrollable secara independen
                  itemCount: musicItems.length, // Array dari MusicCard
                  itemBuilder: (context, index) {
                    return MusicCard(musicItem: musicItems[index]);
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
