import 'package:flutter/material.dart';
import 'package:organico/view/screen/cart_screen_page.dart';
import 'package:organico/view/screen/explore_screen_page.dart';
import 'package:organico/view/screen/home_screen_page.dart';
import 'package:organico/view/screen/profile_screen_page.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],



      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        fixedColor: Colors.black,
        selectedIconTheme:const IconThemeData(size: 35),
        unselectedIconTheme:const IconThemeData(color: Colors.blueGrey),
        selectedLabelStyle:const TextStyle(color:Colors.black54,fontStyle: FontStyle.normal ),
        items:[
          
          BottomNavigationBarItem(icon: Image(image:const AssetImage("assets/home.png"),
          fit: BoxFit.fill,color:_currentIndex==0? Colors.black:Colors.blueGrey), label: "Home",),
         
        const  BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "Explore"),
          
          const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
         const  BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: "Profile"),

        ],
        onTap: (v) {
          setState(() {
            _currentIndex = v.toInt();
          });
        },
      ),
    
    );
  }

 final List<Widget>  _screens = [
 const  HomeScreen(),
  const ExplorerScrean(),
     const CartScreen(),
     const ProfileScreen()
  ];
}