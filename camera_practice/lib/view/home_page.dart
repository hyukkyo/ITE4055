import 'package:camera/camera.dart';
import 'package:camera_practice/view/login/kakao_login.dart';
import 'package:camera_practice/view/login/main_view_model.dart';
import 'package:camera_practice/view/upload/camera_page.dart';
import 'package:camera_practice/view/upload/gallery.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'encyclopedia_page.dart';
import 'package:camera_practice/view/login/login_page.dart';
import 'package:camera_practice/view/login/social_login.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  // final viewModel = MainViewModel(KakaoTalkLogin());

  String nickname = '';

  getuser() async{
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      Map<String, dynamic> allPrefs = {for (var key in prefs.getKeys()) key: prefs.get(key)};
      String? username = prefs.getString('username');
      print("ㅇㅋㅇㅋㅇㅋㅇㅋㅇㅋㅇㅋㅇㅋㅇ");
      print(allPrefs);
      print("Nickname: $username");
      return username;
    }
    catch(e){
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {


  getuser();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("전설의 낚시꾼"),
              // Text('$nickname님 반갑습니다'),
              // Text(nickname.isNotEmpty ? '$nickname님 반갑습니다' : "게스트님 반갑습니다"),
              Text("이미지를 업로드해주세요\n\n"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ElevatedButton(
                      onPressed: () async {
                        await availableCameras().then((value) => Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CameraPage(cameras: value))));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
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
                  const SizedBox(width: 20.0),
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Gallery()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlueAccent,
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



                ]
              ),
              const SizedBox(height: 20.0), // Add space between the buttons

              SizedBox(
                width: 320,
                height: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EncyclopediaPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
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

// get_user_info() async{
//   try{
//     User user = await UserApi.instance.me();
//     print(user.kakaoAccount?.profile?.nickname);
//     return user.kakaoAccount?.profile?.nickname;
//   }
//   catch(e){
//     print("사용자 정보 요청 실패");
//   }
// }

// Future<String?> getuser() async {
//   try{
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     Map<String, dynamic> allPrefs = {for (var key in prefs.getKeys()) key: prefs.get(key)};
//     String? nickname = prefs.getString('nickname');
//     print("ㅇㅋㅇㅋㅇㅋㅇㅋㅇㅋㅇㅋㅇㅋㅇ");
//     print(allPrefs);
//     print("Nickname: $nickname");
//     return nickname;
//
//   }
//   catch(e){
//     print(e);
//     return null;
//   }
// }

