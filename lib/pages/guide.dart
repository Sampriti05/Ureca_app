import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Guide"),backgroundColor: const Color.fromARGB(255, 0, 122, 255),
      actions: [
        IconButton(onPressed: () {
          //add action
        },
         icon: const Icon(Icons.person_rounded)),
      ],
    ),
      body: 
        ListView(
              children: const [
              Column(
                children:[
                   Center(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      
                   children: <Widget>[
                    //homepage instructions 
                    Row(
                      children: [
                        Icon(Icons.home),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Homepage', 
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.start),
                        ),
                      ],
                    ),
                    SizedBox(width: 10,height: 10,),
                    Text('Your Balance',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                     Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Value displayed shows the points gained through the games\n •Monetary value shows the conversion of the points gained through games',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    //withdraw/deposit
                    Text('Withdraw/Deposit',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Value displayed shows the points gained through the games\n •Monetary value shows the conversion of the points gained through games',
                      style: TextStyle(fontSize: 14),),
                    ),
                    //my watchlist
                    Text('My watchlist',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Value displayed shows the points gained through the games\n •Monetary value shows the conversion of the points gained through games',
                      style: TextStyle(fontSize: 14),),
                    ),
                    //trending
                    Text('Trending',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Value displayed shows the points gained through the games\n •Monetary value shows the conversion of the points gained through games',
                      style: TextStyle(fontSize: 14),),
                    ),
                    SizedBox(height: 10,width: 10,),
                    //search 
                    Row(
                      children: [
                        Icon(Icons.search),
                        Text('Search', 
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,)),
                      ],
                    ),
                    SizedBox(width: 10,height: 10,),
                    Text('Filter Options',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Allows you to choose the way existing stocks are displayed alphabetically and popularity wise',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    Text('Search',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Allows you to search for a specific stock to expand view\n •Clicking on a stock will show the charting and options such as buy/sell',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    Text('How to buy of sell stocks ',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('1. Click on a specific stock under the search page\n 2.Click on buy or sell at the bottom of the page\n 3.Ensure you have sufficient funds in your account\n 4. Insert the number of shares you want to buy or sell ',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    SizedBox(height: 10,width: 10,),
                    Row(
                      children: [
                        Icon(Icons.wallet),
                        Text('Wallet',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                      ],
                    ),
                    SizedBox(width: 10,height: 10,),
                    Text('Stocks',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.justify,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Displays the label of the stock you have bought or sold',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    Text('No. of shares',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('Displays the number of share each stock you have bought or sold',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    Text('B/S',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• B represents bought\n •S represent sold',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    Text('Value',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Displays the total value of the stock bought -> Number of stock x Price per share',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                    Text('Date',
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                    Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('• Date of transaction',
                      style: TextStyle(fontSize: 14),textAlign: TextAlign.justify, ),
                    ),
                   ]
                    )
                   )
                ]
              )
              ]
      )
      );
      
      
  }
}