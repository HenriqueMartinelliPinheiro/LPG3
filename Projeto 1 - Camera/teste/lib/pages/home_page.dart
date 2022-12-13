import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:teste/api.dart';
import 'package:teste/pages/about_page.dart';
import "package:firebase_auth/firebase_auth.dart";

class Frase {

  String frase;
  Frase(this.frase);

  Frase.fromJson(Map json): frase = json['show']['value'];
}
class HomePage extends StatefulWidget {
 
  HomePage({Key? key,this.title, }) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final photos = <File>[];
  String frase="";
    _HomePageState(){
    Api.getFrase().then((value){
      setState((){
        frase = jsonDecode(value.body)['value'];
    });
      });
  }

   void openCamera() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    
                    GallerySaver.saveImage(file.path);
                    photos.add(file);
                    
                    Navigator.pop(context);
                    // setData(file.path);
                    setState(() {});
                  },
                )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title ?? "Câmera"),
        
        leading: IconButton(icon: const Icon(Icons.logout),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
      ),
        actions: <Widget>[
          TextButton(
            onPressed: () {   

              Navigator.push(context, MaterialPageRoute(builder: (context) => About(frase: frase,)));
            },
          child: const Text('About', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    
     body: GridView.builder(
        gridDelegate:
           const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: photos.length,
        itemBuilder: (_, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: size.width,
            child: Image.file(
              photos[index],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),

      
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}