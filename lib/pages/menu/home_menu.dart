import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/widget/songList.dart'; // Import the reusable widget
import 'package:ricomusic/widget/songTrend.dart';
import 'package:ricomusic/model/model_listview.dart'; // Import the model
import 'package:ricomusic/widget/mycolor.dart'; // Custom Color class

class HomeMenu extends StatelessWidget {
  HomeMenu({super.key});

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
                SizedBox(height: 20), // Jarak atas lebih besar agar tidak terlalu mepet

                // Bagian atas: Foto profil dan ikon
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0), // Tambahkan padding agar lebih jauh dari tepi
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/whitney.jpg'), // Gambar profil
                        radius: 20,
                      ),
                    ),
                    // Ikon di pojok kanan atas
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0), // Tambahkan padding agar lebih jauh dari tepi
                      child: Icon(
                        Icons.notifications, // Menggunakan ikon notifikasi
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                // Teks "Top Album"
                Text(
                  'Top Album',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10),

                // ListView untuk SongTrend di bagian atas, tampil secara horizontal
                Container(
                  height: 150, // Sesuaikan tinggi container untuk gambar
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // Scroll ke samping
                    itemCount: musicTrends.length, // Dari array SongTrend
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0), // Padding untuk gambar
                        child: Image.asset(
                          musicTrends[index].imagePath, // Hanya menampilkan gambar
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20), // Jarak antara SongTrend dan MusicCard

                // Teks "Recommend for you"
                Text(
                  'Recommend for you',
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

void main() {
  runApp(GetMaterialApp(
    home: HomeMenu(),
  ));
}
