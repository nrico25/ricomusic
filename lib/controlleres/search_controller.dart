import 'package:get/get.dart';
import 'package:ricomusic/model/listItem1.dart';

class SearchLogic extends GetxController {
  var searchQuery = ''.obs; // Menyimpan kueri pencarian
  var filteredMusicList = musicSearch.obs; // Asumsi `musicSearch` adalah daftar yang ada

  // Fungsi untuk memperbarui pencarian
  void updateSearch(String query) {
    searchQuery.value = query;
    // Filter daftar musik berdasarkan kueri pencarian
    filteredMusicList.value = musicSearch.where((music) {
      return music.title.toLowerCase().contains(query.toLowerCase()); 
    }).toList();
  }
}
