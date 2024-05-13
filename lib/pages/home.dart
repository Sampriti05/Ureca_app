import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatelessWidget {
   const Home({super.key});

  @override
  Widget build(BuildContext context) {
   
    return  Scaffold(
      appBar: AppBar(title: const Text("Home"),backgroundColor: const Color.fromARGB(255, 0, 122, 255),
      actions: [
        IconButton(onPressed: () {
          //add action after integration with app (user profile)
        },
         icon: const Icon(Icons.person_rounded)),
      ],
    ),
      body: Container(
        width: double.infinity,
        decoration:const BoxDecoration(
          color:  Color.fromARGB(255, 0, 122, 255)
        ),
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height / 2.6,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Container(
                      width:450,
                      height: 220,
                      child: Image.asset('assets/MyBalanceholder.png'), //placeholder for my activity, sync after backend is completed
                    )
                  ]
                )
              )
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: 700,
                padding: const EdgeInsets.symmetric(horizontal:25, vertical: 25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(65),
                    topRight: Radius.circular(65),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Most Active Stocks'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                      ), 
                    ),
                    const SizedBox(height: 5),
                    // List of common stocks, manually added, no API endpoint to retrieve top stocks of the day
                    StockList(
                      stockSymbols: const ['AAPL', 'GOOGL', 'AMZN', 'MSFT', 'NFLX'],
                    ),
                  ],
                ),
              )
            )
          ]
        )
      )
    );
  }
}

// to retrieve regular market price from api based on stock list provided above  
class StockList extends StatelessWidget {
  final List<String> stockSymbols;

  const StockList({required this.stockSymbols});

  Future<Map<String, dynamic>> fetchStockData(String symbol) async {
    final response = await http.get(Uri.parse(
        'https://query1.finance.yahoo.com/v8/finance/chart/$symbol?interval=1d&range=1d'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load stock data for $symbol');
    }
  }
//TODO fix issue 
//latest code but sizing is off used column renderflex error overflow 

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height / 3.5, // Adjust the height as needed
        child: ListView.builder(
          itemCount: stockSymbols.length,
          itemBuilder: (context, index) {
            final symbol = stockSymbols[index];
            return FutureBuilder(
              future: fetchStockData(symbol),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final stockData = snapshot.data as Map<String, dynamic>;
                  final regularMarketPrice = double.parse(stockData['chart']['result'][0]['meta']
                      ['regularMarketPrice'].toString());

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/$symbol.png'),
                      radius: 20,
                    ),
                    title: Text(symbol),
                    subtitle: Text(
                      'Regular Market Price: ${regularMarketPrice.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    ],
  );
}











  /* @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Column(
        children: stockSymbols.map((symbol) {
          return FutureBuilder(
          future: fetchStockData(symbol),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final stockData = snapshot.data as Map<String, dynamic>;
              final regularMarketPrice = double.parse(stockData['chart']['result'][0]['meta']
                  ['regularMarketPrice'].toString());

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/$symbol.png'),
                  radius: 20,
                ),
                title: Text(symbol),
                subtitle: Text(
                  'Regular Market Price: ${regularMarketPrice.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.black),
                ),
              );
            } 
          },
        );
      }).toList(),
    ),
  );
}
        }
    */
}