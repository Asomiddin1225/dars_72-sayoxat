// import 'package:dars_72/screens/asosiy.dart';
// import 'package:dars_72/screens/home_screens.dart';
// import 'package:dars_72/services/location_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// // import 'package:permission_handler/permission_handler.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

// //====================== Ruxsad so'rash 1

//   // PermissionStatus comeraPermissiom = await Permission.camera.status;
//   // PermissionStatus locationPermissiom = await Permission.location.status;

//   // print(comeraPermissiom);
//   // if (comeraPermissiom == PermissionStatus.denied) {
//   //   comeraPermissiom = await Permission.camera.request();
//   //   print(comeraPermissiom);
//   // }

//   // if (locationPermissiom == PermissionStatus.denied) {
//   //   locationPermissiom = await Permission.location.request();
//   //   print(locationPermissiom);
//   // }

// //====================== Ruxsad so'rash 2

//   // await [Permission.location,Permission.camera,].request();

//   await LocationSerice.init();

//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: HomeScreen(),
//       home: AsosiyScreen(),
//     );
//   }
// }


import 'package:dars_72/screens/asosiy.dart';
import 'package:dars_72/services/location_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();

  // Request permissions
  await [Permission.camera, Permission.location].request();

  await LocationSerice.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AsosiyScreen(),
    );
  }
}





