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

  List<String> groceries = ['Apple','Orange','Banana'];
  List<double> prices = [0.99,1.09,2.99];
  final textController = TextEditingController();
  final priceController = TextEditingController();
  double getTotalPrice (List<double> p){
    double totalPrice = 0;
    for(var price in p){
      totalPrice += price;
    }
    return totalPrice;
  }


  @override
  Widget build(BuildContext context) {
    //groceries.sort();
    
    return MaterialApp(

    debugShowCheckedModeBanner: false,

    theme: ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      ),
    //darkTheme: ThemeData(brightness: Brightness.dark),
    //themeMode: ThemeMode.system,
    title: 'Grocery App',
    home: Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Grocery App List',),),

        // leading: const Icon(Icons.person),
        // leadingWidth: 56,
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(Icons.list),
        //     tooltip: 'more options',
        //     onPressed: () {
        //       // handle the press
        //     },
        //   ),
        // ],
        backgroundColor: Color(0xFF913175),
          ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: TextField(controller: textController,
            decoration:InputDecoration(labelText: 'Enter the item here',border: OutlineInputBorder(gapPadding: 0)),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 10,right: 10),
            child: TextField(controller: priceController,
            decoration: InputDecoration(labelText: 'Enter the price here',border: OutlineInputBorder(gapPadding: 0)),),
          ),
          //SizedBox(height: 20,),
          Expanded(
            child: groceries.length > 0 ? ListView.separated(
              itemCount: groceries.length,
              itemBuilder: (context, index) {
              return ListTile(
                  subtitle: Text('\$${prices[index].toString()}'),
                  title: Text('${groceries[index]}'),
                  onLongPress: (() {
                    setState(() {
                       groceries.removeAt(index);
                       prices.removeAt(index);
                    });
                  }),
                  
                );
          
          //           return Container(
          //                   margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10,bottom: 10),
          //                   decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   color: Color.fromARGB(66, 245, 205, 144)),
          //                   height: 100,
          //                   width: 100,
          //                   child: Center(child:Text(entries[index])),
                        
          //  );
              },
              separatorBuilder: (context, index) { return Divider();},
              )
            : const Center(
              child: Text('Your list is empty.'),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 30,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(92, 96, 125, 139),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color:Colors.grey)
              ),
              child: Text('Total: \$${getTotalPrice(prices)}'),
              
              
            )
            ),
        ],
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
          backgroundColor: Color(0xFF913175),
          child: const Icon(Icons.add),
          onPressed: (){
            setState(() {
              groceries.add(textController.text);
              prices.add(double.parse(priceController.text));
              priceController.clear();
              textController.clear();
              print(groceries);
              print(prices);
            });
          },
          ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed 
        backgroundColor: Color(0xFF913175), // <-- This works for fixed
        selectedItemColor: Color.fromARGB(255, 110, 30, 86),
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