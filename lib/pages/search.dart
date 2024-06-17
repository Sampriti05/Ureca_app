import 'package:flutter/material.dart';
import 'package:ureca_app/pages/candlechart.dart';
import 'package:ureca_app/pages/selectStock.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

//manually added list of available stocks - no free api endpoint to do a search method
//scrollable list
class _SearchState extends State<Search> {
  List<Map<String, String>> stocks = [
    {"id": "1", "stock": "Apple Inc.", "symbol": "AAPL"},
    {"id": "2", "stock": "Alphabet Inc. (Google)", "symbol": "GOOGL"},
    {"id": "3", "stock": "Amazon.com Inc.", "symbol": "AMZN"},
    {"id": "4", "stock": "Microsoft Corporation", "symbol": "MSFT"},
    {"id": "5", "stock": "Netflix Inc.", "symbol": "NFLX"},
    {"id": "6", "stock": "Meta Platforms, Inc", "symbol": "META"},
    {"id": "7", "stock": "Tesla Inc.", "symbol": "TSLA"},
    {"id": "8", "stock": "Johnson & Johnson", "symbol": "JNJ"},
    {"id": "9", "stock": "Procter & Gamble Co.", "symbol": "PG"},
    {"id": "10", "stock": "Visa Inc.", "symbol": "V"},
    {"id": "11", "stock": "Mastercard Inc.", "symbol": "MA"},
    {"id": "12", "stock": "JPMorgan Chase & Co.", "symbol": "JPM"},
    {"id": "13", "stock": "The Goldman Sachs Group Inc.", "symbol": "GS"},
    {"id": "14", "stock": "Exxon Mobil Corporation", "symbol": "XOM"},
    {"id": "15", "stock": "Chevron Corporation", "symbol": "CVX"},
    //{"id": "16", "stock": "Coca-Cola Company", "symbol": "KO"},
    // Add more stocks if needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: const Color.fromARGB(255, 0, 122, 255),
        actions: [
          IconButton(
              onPressed: () {
                //add action redirect to user profile
                //TODO after syncing with app
              },
              icon: const Icon(Icons.person_rounded)),
        ],
      ),
      body: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          String? stockName = stocks[index]['stock'];
          String? stockSymbol = stocks[index]['symbol'];

          return ListTile(
            title: Text(stockName!),
            subtitle: Text(stockSymbol!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectStock(stockData: stocks[index]),
                ),
              ); //stock details pushed to selectstock to retrieve open,close,high,low for the day
              //ignore -- stock details pushed to candle chart to retrieve year round values for candle chart
            },
          );
        },
      ),
    );
  }
}
