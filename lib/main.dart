import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File image;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pink, Colors.orange],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 1])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Wecome To Oculus",
                      style: TextStyle(
                          color: Colors.white60,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                      elevation: 30,
                      child: Container(
                        height: 70,
                        width: 200,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.pink, Colors.orange],
                                stops: [0.5, 1])),
                        child: Builder(
                          builder: (context) => FlatButton(
                            onPressed: () async{
                              PickedFile pickedFile = await ImagePicker().getImage(
                                source: ImageSource.camera,
                              );
                              if (pickedFile != null) {
                                setState(() {
                                  image = File(pickedFile.path);
                                });
                                print(pickedFile.path);

                              }
                            },
                            child: Text(
                              "Get Started",
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
