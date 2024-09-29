import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/model_listview.dart'; // Import the model

 final List<ModelListview> musicItems = [
    ModelListview(
      title: "We Can't Be Friends",
      artist: "Taylor Swift",
      streams: "3 Million / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "Wildest Dreams",
      artist: "Taylor Swift",
      streams: "560.5k / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "I Have Nothing",
      artist: "Whitney Houston",
      streams: "960.5k / steams",
      imagePath: "images/taylor.jpg",
    ),
    ModelListview(
      title: "We Can't Be Friends",
      artist: "Taylor Swift",
      streams: "3 Million / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "Wildest Dreams",
      artist: "Taylor Swift",
      streams: "560.5k / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "I Have Nothing",
      artist: "Whitney Houston",
      streams: "960.5k / steams",
      imagePath: "images/taylor.jpg",
    ),
    ModelListview(
      title: "We Can't Be Friends",
      artist: "Taylor Swift",
      streams: "3 Million / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "Wildest Dreams",
      artist: "Taylor Swift",
      streams: "560.5k / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "I Have Nothing",
      artist: "Whitney Houston",
      streams: "960.5k / steams",
      imagePath: "images/taylor.jpg",
    ),
    ModelListview(
      title: "We Can't Be Friends",
      artist: "Taylor Swift",
      streams: "3 Million / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "Wildest Dreams",
      artist: "Taylor Swift",
      streams: "560.5k / steams",
      imagePath: "images/ariana.png",
    ),
    ModelListview(
      title: "I Have Nothing",
      artist: "Whitney Houston",
      streams: "960.5k / steams",
      imagePath: "images/taylor.jpg",
    ),
    
    // Add more items as needed
  ];
class MusicCard extends StatelessWidget {
  final ModelListview musicItem;

  MusicCard({required this.musicItem});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ClipRRect to round the corners of the image
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // Adjust for rounded corners
            child: Image.asset(
              musicItem.imagePath,
              width: 88,
              height: 88,
              fit: BoxFit.cover, // Ensures the image fits nicely
            ),
          ),
          const SizedBox(width: 12), // Space between image and text
          // Using Expanded to handle text overflow
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  musicItem.title,
                  style: TextStyle(
                    fontSize: 16, // Based on Figma's font size
                    fontWeight: FontWeight.w600, // Adjusted for a bold title
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4), // Space between title and artist
                Text(
                  musicItem.artist,
                  style: TextStyle(
                    fontSize: 14, // Slightly smaller font for artist name
                    fontWeight: FontWeight.w400,
                    color: Colors.white70, // Slightly faded white for artist
                  ),
                ),
                const SizedBox(height: 4), // Space between artist and streams
                Text(
                  musicItem.streams,
                  style: TextStyle(
                    fontSize: 12, // Smaller font for streams info
                    fontWeight: FontWeight.w400,
                    color: Colors.white54, // Even more faded white for streams
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
