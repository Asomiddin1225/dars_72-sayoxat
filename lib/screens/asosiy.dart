


import 'package:dars_72/screens/uploaded_screen.dart';
import 'package:flutter/material.dart';
import 'home_screens.dart';


class AsosiyScreen extends StatefulWidget {
  const AsosiyScreen({super.key});

  @override
  State<AsosiyScreen> createState() => _AsosiyScreenState();
}

class _AsosiyScreenState extends State<AsosiyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => HomeScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.camera_alt),
              ),
            ),
            SizedBox(width: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => UploadsScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.remove_red_eye),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






