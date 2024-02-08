import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:camera_practice/camera_page.dart';
import 'package:image_picker/image_picker.dart';
import 'gallery.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fish Classification",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: ElevatedButton(
                      onPressed: () async {
                        await availableCameras().then((value) => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      child: Transform.scale(
                        scale: 0.5,
                        child: Image.asset(
                          'lib/icons/fish.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your logic for Button 2 here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Center(
                            child: IconButton(
                              iconSize: 30,
                              icon: const Icon(Icons.photo_outlined, color: Colors.white),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const Gallery()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      SizedBox(
                        width: 90,
                        height: 90,
                        child: ElevatedButton(
                          onPressed: () {
                            // Add your logic for Button 2 here
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.lightBlueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Transform.scale(
                            scale: 0.8,
                            child: Image.asset(
                              'lib/icons/add-user.png',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(width: 20.0), // Add space between the buttons
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 90,
                    height: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your logic for Button 2 here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Transform.scale(
                        scale: 0.8,
                        child: Image.asset(
                          'lib/icons/encyclopedia.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0), // Add space between the buttons
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your logic for Button 3 here
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Transform.scale(
                        scale: 0.8,
                        child: Image.asset(
                          'lib/icons/north-korea-won.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _openGallery() async{
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null){
    XFile(image.path);
  }
}