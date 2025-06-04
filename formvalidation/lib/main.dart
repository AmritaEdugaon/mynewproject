import 'package:flutter/material.dart';
import 'package:formvalidation/home_page.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: flutter(),
    );
  }
}

class flutter extends StatefulWidget {
  const flutter({super.key});

  @override
  State<flutter> createState() => _flutterState();
}

class _flutterState extends State<flutter> {
  var namecontroller= TextEditingController();
  var forkey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("data"),
      ),
      body: Column(
        children: [
          Form(
            key: forkey,
              child: Column(
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: InputDecoration(hintText: "enter your name"),

                validator: (value) {
                  if(value==null||value.isEmpty){
                    return "Plesse Enter your name";
                  }
                  return null;
                },
              ),

              ElevatedButton(onPressed: () {
                if(forkey.currentState!.validate()){
                  print("form is vailited");
                  Navigator.push(context, MaterialPageRoute(builder:
                      (context) => HomePage
                    (name:namecontroller.text,),));
                }



              }, child: Text("save button"))

            ],
          ),
          ),
        ],
      ),
    ));
  }
}
