import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ureca_app/pages/buy.dart';
import 'package:ureca_app/pages/candlechart.dart';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';

import 'package:ureca_app/pages/sell.dart';

class SelectStock extends StatefulWidget {
  final Map<String, dynamic> stockData; //values passed from search screen

  const SelectStock({required this.stockData});

  @override
  State<SelectStock> createState() => _SelectStockstate();
}

class _SelectStockstate extends State<SelectStock> {
  late Future<Map<String, dynamic>> stockInfo;
  double? price;
  int? volume;
  double? open;
  double? close;
  double? high;
  double? low;

  //late TrackballBehavior trackballBehavior;
  //late List<ChartSampleData> chartData;

//initState when stateful widget called in a widget tree for the first time
  @override
  void initState() {
    //chartData = fetchChartData();
    super.initState();
    //getChart();
    //trackballBehavior = TrackballBehavior(
    //enable: true, activationMode: ActivationMode.singleTap
    //);
    stockInfo = fetchStockInfo(widget.stockData['symbol']);
  }

  Future<Map<String, dynamic>> fetchStockInfo(String symbol) async {
    String apiUrl =
        'https://query1.finance.yahoo.com/v8/finance/chart/$symbol?metrics=high&interval=1d&range=1d';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        throw Exception('Failed to load stock info');
      }
    } catch (e) {
      print('Failed to load chart data: $e');
      return {};
    }
  }

  @override
  Widget build(BuildContext context) {
    String stockName = widget.stockData['stock'];
    String stockSymbol = widget.stockData['symbol'];

    double myHeight;
    myHeight = MediaQuery.of(context).size.height;
    double myWidth;
    myWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            body: Container(
                height: myHeight,
                width: myWidth,
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0, vertical: myHeight * 0.02),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.navigate_before,
                                  size: 15,
                                  color: Colors.black,
                                ),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      stockName,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: myHeight * 0.01,
                                    ),
                                    Text(
                                      stockSymbol,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey),
                                    ),
                                  ])
                            ])
                          ])),

                  // Display stock information using FutureBuilder
                  FutureBuilder(
                      future: stockInfo,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return const Text('Error loading stock info');
                        } else {
                          // Extract values from the response and store in local variables
                          Map<String, dynamic>? chartData =
                              snapshot.data?['chart'];
                          List<dynamic>? result = chartData?['result'];

                          if (result != null && result.isNotEmpty) {
                            Map<String, dynamic>? metaData = result[0]['meta'];
                            Map<String, dynamic>? indicators =
                                result[0]['indicators'];
                            List<dynamic>? quote = indicators?['quote'];

                            if (quote != null && quote.isNotEmpty) {
                              Map<String, dynamic>? quoteData = quote[0];

                              price =
                                  metaData?['regularMarketPrice']?.toDouble() ??
                                      0.0;
                              high = quoteData?['high']?[0].toDouble() ?? 0.0;
                              low = quoteData?['low']?[0].toDouble() ?? 0.0;
                              open = quoteData?['open']?[0].toDouble() ?? 0.0;
                              close = quoteData?['close']?[0].toDouble() ?? 0.0;
                              volume = quoteData?['volume']?[0] ?? 0;

                              // Round off to 3 decimal places
                              high = double.parse(high!.toStringAsFixed(3));
                              low = double.parse(low!.toStringAsFixed(3));
                              open = double.parse(open!.toStringAsFixed(3));
                              close = double.parse(close!.toStringAsFixed(3));
                            }
                          }

                          return Column(
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text('Price: $price'),
                                        Text('High: $high'),
                                        Text('Open: $open'),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Volume: $volume'),
                                        Text('Low: $low'),
                                        Text('Close: $close'),
                                      ],
                                    ),
                                  ]),
                              const SizedBox(height: 20, width: 10),
                              Row(
                                children: [
                                  Container(
                                      height: myHeight * 0.4,
                                      width: myWidth,
                                      //color: Colors.amber,
                                      //stockData parameter is passed to the CandleChart widget using the constructor
                                      child: CandleChart(
                                          symbol: widget.stockData['symbol'])),
                                ],
                              ),
                              const SizedBox(height: 40, width: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Buy(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 24, 28, 98)),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        EdgeInsets.symmetric(horizontal: 40),
                                      ),
                                    ),
                                    child: const Text("Buy"),
                                  ),
                                  SizedBox(width: 30),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Sell(),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color.fromARGB(
                                                  255, 24, 28, 98)),
                                      padding: MaterialStateProperty.all<
                                          EdgeInsetsGeometry>(
                                        EdgeInsets.symmetric(horizontal: 40),
                                      ),
                                    ),
                                    child: const Text("Sell"),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                      })
                ]))));
  }
}
