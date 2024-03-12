import 'package:camera/camera.dart';
import 'package:camera_practice/friend_page.dart';
import 'package:flutter/material.dart';
import 'package:camera_practice/camera_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'encyclopedia_page.dart';
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FriendPage()),
                            );
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EncyclopediaPage()),
                        );
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
                      onPressed: _openSite,
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

_openSite() async {
  final Uri url = Uri.parse('https://tpirates.com/%EC%8B%9C%EC%84%B8');
  if (!await launchUrl(url)){
    print("Can't open URL");
  }
}

// black sea sprat - 흑해 청어
// gilt-head bream - 도미
// horse mackerel - 전갱이
// red mullet - 불은 숭어
// red sea bream - 참돔
// sea bass - 농어(바닷고기)
// shrimp - 새우
// striped red mullet - 줄무늬 붉은돔
// trout - 송어


void _openGallery() async{
  final ImagePicker _picker = ImagePicker();
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image != null){
    XFile(image.path);
  }
}