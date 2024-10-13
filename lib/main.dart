import 'package:flutter/material.dart';
import 'package:untitled7/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: splashScreen(),
    );
  }
}

class splashScreen extends StatefulWidget{
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen>{
  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MoviesList()));
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text('Welcome to My App'),
      ),
    );
  }
}


// class MyHomePage extends StatelessWidget{
//   final String title;
//   const MyHomePage({required this.title, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Welcome to My App'),
//     );
//   }
// }