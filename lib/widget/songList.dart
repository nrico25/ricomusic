import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ricomusic/model/model_listview.dart'; // Import the model

class MusicCard extends StatelessWidget {
  final ModelListview? musicSearch;
  final ModelListview? musicItem;

  MusicCard({this.musicSearch, this.musicItem});

  @override
  Widget build(BuildContext context) {
    // Use `musicItem` primarily, and fall back to `musicSearch` if available
    final data = musicItem ?? musicSearch;

    // Ensure that `data` is not null, otherwise provide a fallback or an error widget
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

    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ClipRRect to round the corners of the image
          ClipRRect(
            borderRadius: BorderRadius.circular(8), // Adjust for rounded corners
            child: Image.asset(
              data.imagePath, // Use the non-null `data` object
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
                  data.title, // Use the title from the `data`
                  style: TextStyle(
                    fontSize: 16, // Based on Figma's font size
                    fontWeight: FontWeight.w600, // Adjusted for a bold title
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4), // Space between title and artist
                Text(
                  data.artist, // Use the artist name from the `data`
                  style: TextStyle(
                    fontSize: 14, // Slightly smaller font for artist name
                    fontWeight: FontWeight.w400,
                    color: Colors.white70, // Slightly faded white for artist
                  ),
                ),
                const SizedBox(height: 4), // Space between artist and streams
                Text(
                  data.streams, // Use the streams info from the `data`
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
