//https://api.themoviedb.org/3/discover/movie?api_key=9a1ba21f7104aed688c34f2bcb4a09f4&limit=10


import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Movies {
  final String title;
  final String overview;
  final String releaseDate;
  final String posterPath;
  final double rating; // New field for the rating

  Movies({
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.posterPath,
    required this.rating, // Initialize the rating
  });

  // Method to convert Movie object to Map
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'overview': overview,
      'releaseDate': releaseDate,
      'posterPath': posterPath,
      'rating': rating, // Add rating to the Map
    };
  }

  // Factory constructor to create a Movie object from JSON
  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
      title: json['title'],
      overview: json['overview'],
      releaseDate: json['release_date'], // Correct key: 'release_date'
      posterPath: json['poster_path'],   // Add posterPath from 'poster_path'
      rating: (json['vote_average'] as num).toDouble(), // Add rating from 'vote_average'
    );
  }

  // Factory constructor to create a Movie object from Map
  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      title: map['title'],
      overview: map['overview'],
      releaseDate: map['release_date'], // Correct key: 'release_date'
      posterPath: map['poster_path'],   // Add posterPath from 'poster_path'
      rating: (map['vote_average'] as num).toDouble(), // Add rating from 'vote_average'
    );
  }
}
