// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class UploadsScreen extends StatefulWidget {
//   const UploadsScreen({super.key});

//   @override
//   State<UploadsScreen> createState() => _UploadsScreenState();
// }

// class _UploadsScreenState extends State<UploadsScreen> {
//   List<Map<String, dynamic>> _uploads = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchUploads();
//   }

//   void fetchUploads() {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("uploads");
//     ref.onValue.listen((event) {
//       final List<Map<String, dynamic>> uploads = [];
//       final data = event.snapshot.value as Map<dynamic, dynamic>?;

//       if (data != null) {
//         data.forEach((key, value) {
//           uploads.add({
//             "key": key,
//             ...value as Map<dynamic, dynamic>,
//           });
//         });
//       }

//       setState(() {
//         _uploads = uploads;
//       });
//     });
//   }

//   void deleteUpload(String key) {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("uploads/$key");
//     ref.remove();
//   }

//   void updateUpload(String key, String newText) {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("uploads/$key");
//     ref.update({"text": newText});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Uploads")),
//       body: ListView.builder(
//         itemCount: _uploads.length,
//         itemBuilder: (context, index) {
//           final upload = _uploads[index];
//           return ListTile(
//             leading: Image.file(File(upload["imagePath"])),
//             title: Text(upload["text"]),
//             subtitle:
//                 Text("Lat ${upload["latitude"]}  va  ${upload["longitude"]}"),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.edit),
//                   onPressed: () {
//                     TextEditingController textController =
//                         TextEditingController(text: upload["text"]);
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text("Update Text"),
//                           content: TextField(
//                             controller: textController,
//                             decoration: InputDecoration(labelText: "New text"),
//                           ),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 updateUpload(
//                                     upload["key"], textController.text);
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text("Save"),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     deleteUpload(upload["key"]);
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class UploadsScreen extends StatefulWidget {
//   const UploadsScreen({super.key});

//   @override
//   State<UploadsScreen> createState() => _UploadsScreenState();
// }

// class _UploadsScreenState extends State<UploadsScreen> {
//   List<Map<String, dynamic>> _uploads = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchUploads();
//   }

//   void fetchUploads() {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("uploads");
//     ref.onValue.listen((event) {
//       final List<Map<String, dynamic>> uploads = [];
//       final data = event.snapshot.value as Map<dynamic, dynamic>?;

//       if (data != null) {
//         data.forEach((key, value) {
//           uploads.add({
//             "key": key,
//             ...value as Map<dynamic, dynamic>,
//           });
//         });
//       }

//       setState(() {
//         _uploads = uploads;
//       });
//     });
//   }

//   void deleteUpload(String key) {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("uploads/$key");
//     ref.remove();
//   }

//   void updateUpload(String key, String newText) {
//     DatabaseReference ref = FirebaseDatabase.instance.ref("uploads/$key");
//     ref.update({"text": newText});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Uploads")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           shrinkWrap: true, // Important to make GridView take only the necessary space
//           physics: NeverScrollableScrollPhysics(), // Prevent GridView from scrolling
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Adjust the number of columns
//             crossAxisSpacing: 10.0,
//             mainAxisSpacing: 10.0,
//             childAspectRatio: 1.0, // Adjust the aspect ratio as needed
//           ),
//           itemCount: _uploads.length,
//           itemBuilder: (context, index) {
//             final upload = _uploads[index];
//             return Card(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: Image.file(
//                       File(upload["imagePath"]),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(upload["text"]),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text("Lat ${upload["latitude"]}  va  ${upload["longitude"]}"),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       IconButton(
//                         icon: Icon(Icons.edit),
//                         onPressed: () {
//                           TextEditingController textController = TextEditingController(text: upload["text"]);
//                           showDialog(
//                             context: context,
//                             builder: (context) {
//                               return AlertDialog(
//                                 title: Text("Update Text"),
//                                 content: TextField(
//                                   controller: textController,
//                                   decoration: InputDecoration(labelText: "New text"),
//                                 ),
//                                 actions: [
//                                   TextButton(
//                                     onPressed: () {
//                                       updateUpload(upload["key"], textController.text);
//                                       Navigator.of(context).pop();
//                                     },
//                                     child: Text("Save"),
//                                   ),
//                                 ],
//                               );
//                             },
//                           );
//                         },
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.delete),
//                         onPressed: () {
//                           deleteUpload(upload["key"]);
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class UploadsScreen extends StatefulWidget {
  const UploadsScreen({super.key});

  @override
  State<UploadsScreen> createState() => _UploadsScreenState();
}

class _UploadsScreenState extends State<UploadsScreen> {
  List<Map<String, dynamic>> _uploads = [];

  @override
  void initState() {
    super.initState();
    fetchUploads();
  }

  void fetchUploads() {
    DatabaseReference ref = FirebaseDatabase.instance.ref("uploads");
    ref.onValue.listen((event) {
      final List<Map<String, dynamic>> uploads = [];
      final data = event.snapshot.value as Map<dynamic, dynamic>?;

      if (data != null) {
        data.forEach((key, value) {
          uploads.add({
            "key": key,
            ...value as Map<dynamic, dynamic>,
          });
        });
      }

      setState(() {
        _uploads = uploads;
      });
    });
  }

  void deleteUpload(String key) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("uploads/$key");
    ref.remove();
  }

  void updateUpload(String key, String newText) {
    DatabaseReference ref = FirebaseDatabase.instance.ref("uploads/$key");
    ref.update({"text": newText});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Uploads")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemCount: _uploads.length,
          itemBuilder: (context, index) {
            final upload = _uploads[index];
            return Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                    width: 80,
                    child: Image.file(
                      File(upload["imagePath"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(upload["text"]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                        "Lat ${upload["latitude"]}  va  ${upload["longitude"]}"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          TextEditingController textController =
                              TextEditingController(text: upload["text"]);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Update Text"),
                                content: TextField(
                                  controller: textController,
                                  decoration:
                                      InputDecoration(labelText: "New text"),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      updateUpload(
                                          upload["key"], textController.text);
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Save"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteUpload(upload["key"]);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
