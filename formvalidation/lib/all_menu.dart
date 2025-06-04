import 'package:flutter/material.dart';
import 'package:formvalidation/main.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyMenuScreen(),
    );
  }
}
class MyMenuScreen extends StatefulWidget {
  const MyMenuScreen({super.key});

  @override
  State<MyMenuScreen> createState() => _MyMenuScreenState();
}

class _MyMenuScreenState extends State<MyMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      //Option Menu
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,title: Text("Menu"),
        actions: [
          PopupMenuButton(
            itemBuilder:(context) =>[
            PopupMenuItem(child:Text("Cart"),value: "Cart",),
            PopupMenuItem(child:Text("Order"),value: "Order",),
            PopupMenuItem(child:Text("Whitelist"),value: "Whitelist",),

          ],
            onSelected:(value) {
              //navigator
              print(value);
            }
            ,)

        ],
      ),
      //Contax Menu
      body: Column(
        children: [
          ElevatedButton(onPressed: () {
            showMenu(context: context, items: [
              PopupMenuItem(child: Text("account"),value: "account",),
              PopupMenuItem(child: Text("Status"),value: "Status",),
            ]).then((value) {
              print(value);
            },);
          }, child: Text("Show Menu"))
        ],
      ) ,

      //Popup Menu

    ));
  }
}

