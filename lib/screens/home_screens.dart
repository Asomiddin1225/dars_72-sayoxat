// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:camera/camera.dart';
// import 'package:dars_72/screens/take_picture_screen.dart';
// import 'package:dars_72/services/location_service.dart';
// import 'package:firebase_database/firebase_database.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   LocationData? myLocation;
//   TextEditingController _textController = TextEditingController();
//   XFile? _image;

//   @override
//   void initState() {
//     super.initState();
//     _initializeLocation();
//   }

//   void _initializeLocation() async {
//     await LocationSerice.fetchCurruntLocation();
//     LocationSerice.fetchLiveLocation().listen((location) {
//       setState(() {
//         myLocation = location;
//       });
//     });
//   }

//   Future<void> captureImage() async {
//     final cameras = await availableCameras();
//     final firstCamera = cameras.first;

//     final image = await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => TakePictureScreen(camera: firstCamera),
//       ),
//     );

//     setState(() {
//       _image = image;
//     });
//   }

//   void saveToFile() {
//     if (_image != null &&
//         myLocation != null &&
//         _textController.text.isNotEmpty) {
//       DatabaseReference ref = FirebaseDatabase.instance.ref("uploads").push();
//       ref.set({
//         "imagePath": _image!.path,
//         "text": _textController.text,
//         "latitude": myLocation!.latitude,
//         "longitude": myLocation!.longitude,
//       }).then((_) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Data saved successfully!')));
//       }).catchError((error) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to save data: $error')));
//       });
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Please capture an image and enter text')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Home Screen")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             if (_image != null)
//               Image.file(File(_image!.path), height: 200, fit: BoxFit.cover),
//             TextField(
//               controller: _textController,
//               decoration: InputDecoration(labelText: "Enter text"),
//               maxLines: 3,
//             ),
//             if (myLocation != null)
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: Text(
//                     "Lat: ${myLocation!.latitude}, Long: ${myLocation!.longitude}"),
//               ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: captureImage,
//               child: Icon(Icons.camera_alt),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: saveToFile,
//               child: Text("OK"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:camera/camera.dart';
import 'package:dars_72/screens/take_picture_screen.dart';
import 'package:dars_72/services/location_service.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LocationData? myLocation;
  TextEditingController _textController = TextEditingController();
  XFile? _image;

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  void _initializeLocation() async {
    await LocationSerice.fetchCurruntLocation();
    LocationSerice.fetchLiveLocation().listen((location) {
      setState(() {
        myLocation = location;
      });
    });
  }

  Future<void> captureImage() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    final image = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TakePictureScreen(camera: firstCamera),
      ),
    );

    setState(() {
      _image = image;
    });
  }

  void saveToFile() {
    if (_image != null &&
        myLocation != null &&
        _textController.text.isNotEmpty) {
      DatabaseReference ref = FirebaseDatabase.instance.ref("uploads").push();
      ref.set({
        "imagePath": _image!.path,
        "text": _textController.text,
        "latitude": myLocation!.latitude,
        "longitude": myLocation!.longitude,
      }).then((_) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Data saved successfully!')));
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save data: $error')));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please capture an image and enter text')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_image != null)
              Image.file(File(_image!.path), height: 200, fit: BoxFit.cover),
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: "Enter text"),
              maxLines: 3,
            ),
            if (myLocation != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                    "Lat: ${myLocation!.latitude}, Long: ${myLocation!.longitude}"),
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: captureImage,
              child: Icon(Icons.camera_alt),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveToFile,
              child: Text("OK"),
            ),
          ],
        ),
      ),
    );
  }
}
