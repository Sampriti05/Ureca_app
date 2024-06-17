import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ureca_app/pages/wallet.dart';

class Buy extends StatefulWidget {
  const Buy({super.key});

  @override
  State<Buy> createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  String _dropdownitem1 = 'AAPL';
  final _items1 = [
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

  String _dropdownitem2 = '1';
  final _items2 = [
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

  //user wants to pay
  /*
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid 
      showDialog(
         context: context,
         builder: (context) => AlertDialog(
          title: const Text("Confirm payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
              Text("Card Number: $cardNumber"),
              Text("Expiry Date: $expiryDate"),
              Text("Card Holder name : $cardHolderName"),
              Text("CVV: $cvvCode"),
              ]
            ),
            ),
            actions: [
              // cancel action 
              TextButton(
                onPressed:() => Navigator.pop(context),
                child: const Text("Cancel"),
              ),

              //yes button 
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Wallet(),
                    )
                ), 
                child: const Text("Yes"),)
            ]
         )
      );
    }
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buy"),
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
                items: _items1.map((String item) {
                  return DropdownMenuItem<String>(
                      value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownitem1 = newValue!;
                  });
                },
                value: _dropdownitem1,
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
                items: _items2.map((String item) {
                  return DropdownMenuItem<String>(
                      value: item, child: Text(item));
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _dropdownitem2 = newValue!;
                  });
                },
                value: _dropdownitem2,
              ),
            ],
          ),

          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                            title: const Text("Confirm payment"),
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
              child: const Text("Pay Now"),
            ),
          ),
        ]),
      ),
    );

    //],
  }
}

/* const SizedBox(height: 10),
          //Row(
           // children: 
            Row(
              children : DropdownButton(
              items: _items.map((String item)){
                return DropDownMenuItem(
                  value: item,
                  child: Text(item)
            );
              }).toList(),
              onChanged: (String? newValue){
                setState((){

                _dropdownValue = newValue!;
                  
              });
              },
              value; _dropdownitem1,
                ]//children
              }
            ) 
            children : DropdownButton(
              items: _items.map((String item)){
                return DropDownMenuItem(
                  value: item,
                  child: Text(item)
            );
              }).toList(),
              onChanged: (String? newValue){
                setState((){

                _dropdownValue = newValue!;
                  
              });
              },
              value; _dropdownitem1,
                //]//children
              }
              
            //)
          //)
        ]
        ),
        
      );
    

  }
} 
*/
