import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:ricomusic/model/model_listview.dart';

final List<ModelListview> musicTrends = [
  ModelListview(
    title: "",
    artist: "",
    streams: "",
    imagePath: "images/one.png",
  ),
  ModelListview(
    title: "",
    artist: "",
    streams: "",
    imagePath: "images/seven.png",
  ),
  ModelListview(
    title: "",
    artist: "",
    streams: "",
    imagePath: "images/six.png",
  ),
  ModelListview(
    title: "",
    artist: "",
    streams: "",
    imagePath: "images/five.png",
  ),
  ModelListview(
    title: "",
    artist: "",
    streams: "",
    imagePath: "images/four.png",
  ),
  ModelListview(
    title: "",
    artist: "",
    streams: "",
    imagePath: "images/three.png",
  ),
  ModelListview(
    title: "",
    artist: "",
    streams: "",
    imagePath: "images/two.png",
  ),
  // Add more items as needed
];

class Songtrend extends StatelessWidget {
  final ModelListview musicTrends;
  Songtrend({required this.musicTrends});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Row(
        children: [
          Image.asset(
            musicTrends.imagePath,
            width: 160,
            height: 300,
          ),
        ],
      ),
    );
  }
}
