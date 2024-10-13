import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled7/Detailedscreen.dart';
import 'Movies.dart';
import 'Detailedscreen.dart';

class MoviesList extends StatefulWidget {
  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  late Future<List<Movies>> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchMovies();
  }

  Future<List<Movies>> fetchMovies() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=9a1ba21f7104aed688c34f2bcb4a09f4&page=1'),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((data) => Movies.fromJson(data)).toList();
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272B31), // Set the background color here
      appBar: AppBar(
        backgroundColor: Color(0xFF1B1D1F),
        title: Center(
          child: Text(
            'Movies List',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: FutureBuilder<List<Movies>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No movies found'));
          }

          List<Movies> movies = snapshot.data!;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailedScreen(movie: movies[index]),
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  elevation: 4, // Shadow effect
                  color: Color(0xFF2B2D2F), // Card background color
                  child: Row(
                    children: [
                      // Poster Image
                      Container(
                        height: 150, // Adjust the height as needed
                        width: 100, // Adjust the width as needed
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12), // Rounded corners
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w200${movies[index].posterPath}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 10), // Space between image and text
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0), // Padding around text
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movies[index].title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    movies[index].releaseDate,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '⭐ ${movies[index].rating.toString()}',
                                    style: TextStyle(color: Colors.yellow),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                movies[index].overview,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
