import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class CandleChart extends StatefulWidget {
  //final Map<String, dynamic> stockData;
  final String symbol;
  CandleChart({required this.symbol});
  //CandleChart({required this.stockData});

  @override
  State<CandleChart> createState() => _CandleChartState();

}

class _CandleChartState extends State<CandleChart> {
 List<ChartSampleData> chartData = [];
 late TrackballBehavior _trackballBehavior;

   @override
   void initState() {
  _trackballBehavior = TrackballBehavior(
    enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
    fetchChartData(widget.symbol); // previously used widget.stockData['symbol']
}

@override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: chartData.isEmpty
        ? Center(child: CircularProgressIndicator())
        : SfCartesianChart(
          trackballBehavior: _trackballBehavior,
          series: <CandleSeries<ChartSampleData, DateTime>>[
            CandleSeries<ChartSampleData, DateTime>(
              dataSource: chartData,
              xValueMapper: (ChartSampleData data, _) => data.timestamp,
              lowValueMapper: (ChartSampleData data, _) => data.low,
              highValueMapper: (ChartSampleData data, _) => data.high,
              openValueMapper: (ChartSampleData data, _) => data.open,
              closeValueMapper: (ChartSampleData data, _) => data.close,
            ),
          ],
          primaryXAxis: DateTimeAxis(
            dateFormat: DateFormat.MMM(),
            majorGridLines: MajorGridLines(width: 0)
          ),
          primaryYAxis: NumericAxis(
            minimum: 70,
            interval: 5,
           ),
             
        ),
      ),
    );
  }

    Future<void> fetchChartData(String symbol) async {
    final String url =
        'https://query1.finance.yahoo.com/v8/finance/chart/$symbol?metrics=high&interval=1d&range=1y';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final List<dynamic> timestamps = responseData['chart']['result'][0]['timestamp'];
      final List<dynamic> opens = responseData['chart']['result'][0]['indicators']['quote'][0]['open'];
      final List<dynamic> closes = responseData['chart']['result'][0]['indicators']['quote'][0]['close'];
      final List<dynamic> highs = responseData['chart']['result'][0]['indicators']['quote'][0]['high'];
      final List<dynamic> lows = responseData['chart']['result'][0]['indicators']['quote'][0]['low'];

      chartData = [];

      for (int i = 0; i < timestamps.length; i++) {
        DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(timestamps[i] * 1000);
        num open = opens[i];
        num close = closes[i];
        num high = highs[i];
        num low = lows[i];

        chartData.add(ChartSampleData(timestamp: timestamp, open: open, close: close, high: high, low: low));
      }

      setState(() {
        // Update the UI with the fetched data
        chartData = List<ChartSampleData>.from(chartData);
      });
    } else {
      throw Exception('Failed to load chart data');
    } 
  }
}

class ChartSampleData{
  ChartSampleData({this.timestamp, this.open, this.close,this.high,this.low});
  final DateTime? timestamp;
  final num? open;
  final num? close;
  final num? low;
  final num? high;
}