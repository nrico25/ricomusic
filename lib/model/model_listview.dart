class ModelListview {
  int? id;
  final String title;
  final String artist;
  final String streams;
  final String imagePath;
  bool isLiked; // New field to indicate liked status

  ModelListview({
    this.id,
    required this.title,
    required this.artist,
    required this.streams,
    required this.imagePath,
    this.isLiked = false,
  });

  // Convert a ModelListview object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'streams': streams,
      'imagePath': imagePath,
      'isLiked': isLiked ? 1 : 0,
    };
  }

  // Convert a Map object into a ModelListview object
  factory ModelListview.fromMap(Map<String, dynamic> map) {
    return ModelListview(
      id: map['id'],
      title: map['title'],
      artist: map['artist'],
      streams: map['streams'],
      imagePath: map['imagePath'],
      isLiked: map['isLiked'] == 1,
    );
  }
}
