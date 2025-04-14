import 'package:delivery_app/const.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        title: Text("HomePage",
        style: TextStyle(
          color: color2
        ),),
        backgroundColor: color1,
      ),
      body: Center(
        child: Text("HomePage", 
        style: TextStyle(
          color: color2
        ),),
        )
      );
      
  }
}