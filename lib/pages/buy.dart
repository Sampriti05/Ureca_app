import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Buy extends StatelessWidget {
   const Buy({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: AppBar(title: const Text("Buy"),backgroundColor: const Color.fromARGB(255, 0, 122, 255),
      actions: [
        IconButton(onPressed: () {
          //add action after integration with app (user profile)
        },
         icon: const Icon(Icons.person_rounded)),
      ],
    )
    );
  }
}