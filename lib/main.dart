import 'package:flutter/material.dart';

void main() {
  runApp(homePage());
}

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  final List<String> entries = ['Apple','Orange'];
  final textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    entries.sort();
    
    return MaterialApp(

    debugShowCheckedModeBanner: false,

    theme: ThemeData(brightness: Brightness.light),
    //darkTheme: ThemeData(brightness: Brightness.dark),
    //themeMode: ThemeMode.system,

    home: Scaffold(
      appBar: AppBar(
        title: TextField( controller: textController,),

        leading: const Icon(Icons.person),
        leadingWidth: 56,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'more options',
            onPressed: () {
              // handle the press
            },
          ),
        ],
        backgroundColor: Colors.deepOrange[100],
          ),
      body: entries.length > 0 ? ListView.separated(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Center(child: Text('${entries[index]}')),
            //tileColor: Color.fromARGB(255, 247, 242, 241),
            
            onLongPress: (() {
              setState(() {
                 entries.removeAt(index);
              });
            }),
            
          );
        },
        separatorBuilder: (context, index) {
    return Divider();
  },)
      : Center(
        child: Text("Your list is empty."),
        ),
      
      drawer: Drawer(
        child: ListView(
              //shrinkWrap: true,
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("Add"),
                ),
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Delete"),
                ),
                ListTile(
                  leading: Icon(Icons.system_update),
                  title: Text("Modify"),
                ),
              ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[900],
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              entries.add(textController.text);
              textController.clear();
            });
          },
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
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Setting",
          ),

        ],

      ),
      ), 
  );
  }
}