import 'package:flutter/material.dart';
import 'package:ureca_app/pages/home.dart';
import 'package:ureca_app/pages/appbar.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Intropage"),backgroundColor: const Color.fromARGB(255, 0, 122, 255),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            ElevatedButton(
          child: const Text("Get Started"),
          onPressed:() {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => const Main(),
                ),
                );
          },
          ),
          const SizedBox(height: 20),
          //children   
            ],//children
        )
      )
      );
  }
}