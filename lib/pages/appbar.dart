import 'package:flutter/material.dart';
import 'package:ureca_app/pages/guide.dart';
import 'package:ureca_app/pages/home.dart';
import 'package:ureca_app/pages/search.dart';
import 'package:ureca_app/pages/wallet.dart';




  class Main extends StatefulWidget {
    const Main({Key? key}) : super(key: key);//what purpose?

  @override
  _MainState createState() => _MainState();
}  

class _MainState extends State<Main> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index){//purpose of int index?
    setState(() {
      _selectedIndex = index;
    });
  }

 final List<Widget>_pages =[
  Home(),
  Search(),
  const Wallet(),
  const Guide()
 ];

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 24, 28, 98),
        fixedColor: const Color.fromARGB(255, 0, 122, 255),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: _navigateBottomBar,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label:'Home', ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), 
            label: 'Search'),
            BottomNavigationBarItem(
            icon: Icon(Icons.wallet), 
            label: 'Wallet'),
            BottomNavigationBarItem(
            icon: Icon(Icons.info), 
            label: 'Guide')
        ]
        
          ),
    );
  }
}