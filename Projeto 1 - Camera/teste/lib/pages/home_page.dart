import 'package:flutter/material.dart';
import 'dart:io';
import 'package:camera_camera/camera_camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:teste/pages/about_page.dart';
class HomePage extends StatefulWidget {

  HomePage({Key? key,this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

// Future<String> getFilePath() async {
//     Directory appDocumentsDirectory = await getApplicationDocumentsDirectory(); // 1
//     String appDocumentsPath = appDocumentsDirectory.path; // 2
//     String filePath = '$appDocumentsPath/demoTextFile.txt'; // 3
//     print('sla poh: $filePath');

//     return filePath;
//   }

//    void saveFile() async {
//     File file = File(await getFilePath()); // 1
//     file.writeAsString("This is my demo text that will be saved to : demoTextFile.txt"); // 2
//     debugPrint('File Content: $file');
//     debugPrint("oi=====================================================================");
//   }

//   void readFile() async {
//     File file = File(await getFilePath()); // 1
//     String fileContent = await file.readAsString(); // 2
// }

class _HomePageState extends State<HomePage> {
  final photos = <File>[];
  void openCamera() {
    // debugPrint('File Content: $fileContent');
    // print("oi====================================+++++++=================================");
    // saveFile();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => CameraCamera(
                  onFile: (file) {
                    GallerySaver.saveImage(file.path);

                    photos.add(file);
                    Navigator.pop(context);
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
        
        // leading: IconButton(icon: const Icon(Icons.menu),
      //   onPressed: () {
      //   },
      // ),
        actions: <Widget>[
          TextButton(
            onPressed: () {        
              Navigator.push(context, MaterialPageRoute(builder: (context) => const About()));
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


// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late TextEditingController _controller;
//   String n="";
//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 14, 77, 33),
//         title: const Text('Teste',
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//           TextField(
//               controller: _controller,
//               onSubmitted: (String nome) async {
//                 n = nome;
//                 setState(() {});
//               },
//             ),
//             Text("Olá $n"),
//           ],
//         ),
//       ),
//     );
  // }
// }

