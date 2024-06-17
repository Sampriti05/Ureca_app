import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:ureca_app/pages/wallet.dart';

class Sell extends StatefulWidget {
  const Sell({super.key});

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  String _dropdownitem3 = 'AAPL';

  final _items3 = [
    'AAPL',
    "GOOGL",
    "AMZN",
    "MSFT",
    "NFLX",
    "META",
    "TSLA",
    "JNJ",
    "PG",
    "V",
    "MA",
    "JPM",
    "GS",
    "XOM",
    "CVX"
  ];

  String _dropdownitem4 = '1';
  final _items4 = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sell"),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // credit card
          //Row(
          //children: [
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
          //],
          //),
          //creditcardform
          const SizedBox(height: 2),

          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (data) {
                setState(() {
                  cardNumber = data.cardNumber;
                  expiryDate = data.expiryDate;
                  cardHolderName = data.cardHolderName;
                  cvvCode = data.cvvCode;
                });
              },
              formKey: formKey), //creditcardform
          //],
          //row 2
          const SizedBox(
            height: 5,
          ),
          //select stock symbol
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Stock Symbol:',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButton<String>(
                items: _items3.map((String item) {
                  return DropdownMenuItem<String>(
                      value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownitem3 = newValue!;
                  });
                },
                value: _dropdownitem3,
              ),
            ],
          ),
          const SizedBox(
            height: 0.1,
          ),
          // select number of stocks
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Select Amount:',
                style: TextStyle(fontSize: 16),
              ),
              DropdownButton<String>(
                items: _items4.map((String item) {
                  return DropdownMenuItem<String>(
                      value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownitem4 = newValue!;
                  });
                },
                value: _dropdownitem4,
              ),
            ],
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: const Text("Confirm cashback"),
                            content: SingleChildScrollView(
                              child: ListBody(children: [
                                Text("Card Number: $cardNumber"),
                                Text("Expiry Date: $expiryDate"),
                                Text("Card Holder name : $cardHolderName"),
                                Text("CVV: $cvvCode"),
                              ]),
                            ),
                            actions: [
                              // cancel action
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),

                              //yes button
                              TextButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Wallet(),
                                    )),
                                child: const Text("Yes"),
                              )
                            ]));
                /*
                           Navigator.push(
                       context,
                       
                          MaterialPageRoute(
                          builder: (context) => const Wallet(),
                        ),
                        
                  ); */
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 24, 28, 98)),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 40),
                ),
              ),
              child: const Text("Get Credit"),
            ),
          ),
        ]),
      ),
    );
  }
}
