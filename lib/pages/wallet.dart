import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Wallet"),
          backgroundColor: const Color.fromARGB(255, 0, 122, 255),
          actions: [
            IconButton(
                onPressed: () {
                  //add action after integration with app (user profile)
                },
                icon: const Icon(Icons.person_rounded)),
          ],
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Text(
                      'Symbol',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'No.',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      'Value',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 1.0,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ))
                  ],
                ),
              ],
            )));
  }
}
