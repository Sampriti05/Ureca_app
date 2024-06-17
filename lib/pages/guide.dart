import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Guide"),
          backgroundColor: const Color.fromARGB(255, 0, 122, 255),
          actions: [
            IconButton(
                onPressed: () {
                  //add action
                },
                icon: const Icon(Icons.person_rounded)),
          ],
        ),
        body: ListView(children: const [
          Column(children: [
            Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  //homepage instructions
                  Row(
                    children: [
                      Icon(Icons.home),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Homepage',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Your Balance',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '• Value displayed shows the points gained through the games\n •Monetary value shows the conversion of the points gained through games',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  //withdraw/deposit
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Withdraw/Deposit',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '• Value displayed shows the points gained through the games\n •Monetary value shows the conversion of the points gained through games',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  //my watchlist -> removed as not added in

                  //trending
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Trending',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '• Value displayed shows the points gained through the games\n •Monetary value shows the conversion of the points gained through games',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  //search
                  Row(
                    children: [
                      Icon(Icons.search),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Search',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'How to buy/sell stocks',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '1. Click on a specific stock under the search page\n2. Click on buy or sell at the bottom of the page\n3. Ensure you have sufficient funds in your account\n4. Insert the number of shares you want to buy or sell ',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                    width: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.wallet),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text('Wallet',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                            textAlign: TextAlign.justify),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Date',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '• Displays the date of transaction',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Symbol',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '• Displays the symbol of each stock you have bought or sold',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'No.',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '• Displays the number of share each stock you have bought or sold',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Value',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      '• Displays the total value of the stock bought -> Number of stock x Price per share \n• Red value represents bought and Green value represents sold',
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ]))
          ])
        ]));
  }
}
