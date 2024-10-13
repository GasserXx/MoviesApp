import 'package:flutter/material.dart';
import 'Movies.dart';

class DetailedScreen extends StatelessWidget {
  final Movies movie;

  DetailedScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Color(0xFF1B1D1F),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Color(0xFF272B31),
        child: ListView(
          children: [
            Stack(
              children: [
                // Movie Poster
                FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                  fit: BoxFit.cover,
                  fadeInDuration: Duration(milliseconds: 300),
                  fadeOutDuration: Duration(milliseconds: 300),
                ),
                Positioned(
                  bottom: 20,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Text color
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2003 | Adventure | 3h 21m',
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.yellow),
                                SizedBox(width: 4),
                                Text(
                                  '${movie.rating}',
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent, // Button color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.play_arrow, color: Colors.white),
                              SizedBox(width: 8),
                              Text('Watch Now', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Additional Content Below
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Story Section
                  Text(
                    'Story',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    movie.overview,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  SizedBox(height: 16),
                  // Cast Section
                  Text(
                    'Cast',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text('Actor 1, Actor 2, Actor 3', style: TextStyle(fontSize: 16, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
