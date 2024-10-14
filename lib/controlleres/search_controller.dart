import 'package:get/get.dart';
import 'package:ricomusic/model/listItem1.dart';

class SearchLogic extends GetxController {
  var searchQuery = ''.obs; // Menyimpan query search
  var filteredMusicList = musicSearch.obs; 
  // Fungsi untuk memperbarui pencarian
  void updateSearch(String query) {
    searchQuery.value = query;
    // Filter daftar musik berdasarkan huruf depan dari kueri pencarian
    filteredMusicList.value = musicSearch.where((music) {
      return music.title.toLowerCase().startsWith(query.toLowerCase());
    }).toList();
  }
}
