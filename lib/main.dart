import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Oman Tour"),
          ),
          backgroundColor: Colors.deepOrange[100],
          ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed 
        backgroundColor: Colors.deepOrange[100], // <-- This works for fixed
        selectedItemColor: Colors.red[900],
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],

      ),
      ),
    
  ),);
}