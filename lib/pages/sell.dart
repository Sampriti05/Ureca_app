import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Sell extends StatelessWidget {
   const Sell({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: AppBar(title: const Text("Sell"),backgroundColor: const Color.fromARGB(255, 0, 122, 255),
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