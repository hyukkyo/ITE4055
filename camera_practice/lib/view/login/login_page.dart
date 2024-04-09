import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:camera_practice/view/home_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:camera_practice/view/login/social_login.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'kakao_login.dart';
import 'main_view_model.dart';
import 'package:http/http.dart' as http;


// Future<String?> _get_username() async {
//
//   try {
//     User user = await UserApi.instance.me();
//     return user.kakaoAccount?.profile?.nickname;
//
//   } catch (error) {
//     print('사용자 정보 요청 실패 $error');
//   }
// }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    super.initState();
    // _checkAutoLogin();
  }

  // Future<void> _checkAutoLogin() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool alreadyLoggedIn = prefs.getString('username') != null;
  //   if(alreadyLoggedIn == true){
  //     Navigator.pushReplacement(context,
  //         MaterialPageRoute(builder: (_) => HomePage()));
  //   }
  // }

  // Future<void> user_log() async{
  //   try{
  //     User user = await UserApi.instance.me();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     if(user.id != null && user.kakaoAccount?.profile?.nickname != null) {
  //       await prefs.setString('usercode',
  //           user.id.toString());
  //       await prefs.setString('username',
  //           (user.kakaoAccount?.profile?.nickname).toString());
  //     }
  //     String? value = prefs.getString('username');
  //     print("user_log");
  //     print(value);
  //   }
  //   catch(e) {
  //     print("사용자 정보 저장 실패 $e");
  //   }
  // }

  // void _get_user_info() async {
  //
  //   try {
  //     User user = await UserApi.instance.me();
  //     print('사용자 정보 요청 성공'
  //         '\n회원번호: ${user.id}'
  //         '\n닉네임: ${user.kakaoAccount?.profile?.nickname}');
  //
  //   } catch (error) {
  //     print('사용자 정보 요청 실패 $error');
  //   }
  // }
  //
  Future<String?> loginUser() async {
    try{
      User user = await UserApi.instance.me();
      final response = await http.post(
        Uri.parse('http://218.39.215.36:3000/login'),
        body:{
          'username': user.kakaoAccount?.profile?.nickname,
          'usercode': user.id.toString(),
        },
      );
      print('리스폰스');
      print(response.body);

      if (response.statusCode == 200){
        final Map<String, dynamic> responseData = json.decode(response.body);
        final String token = responseData['token'];

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        return token;
      }
      else{
        throw Exception('로그인 실패');
      }
    }
    catch(error){
      print(error);
    }
    return null;
  }


  Future<void> signInWithKakao() async {
    // print(await KakaoSdk.origin);
    // User user = await UserApi.instance.me();
    // bool alreadyLogined = user.kakaoAccount?.profile?.nickname != null;
    // print("어딨냐고요");
    // print(alreadyLogined);
    // user_log(user.id, user.kakaoAccount?.profile?.nickname);


    // print(await UserApi.instance.me());
    // _get_user_info();

    // 카카오 로그인 구현 예제

    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
        // _get_user_info();
        // user_log();
        loginUser();
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
          // user_log();
          loginUser();
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
        // user_log();
        loginUser();
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('fishdex'), // 로고 들어가야함
                SizedBox(
                  child: GestureDetector(
                      onTap: () async {
                        // await viewModel.login();
                        // setState(() {});
                        signInWithKakao();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                      child: Image.asset(
                      'lib/icons/kakao_login_medium_wide.png'
                      )
                  ),
                ),

                // SizedBox(height:15),
                // SizedBox(
                //   width: 200,
                //   child: ElevatedButton(
                //     onPressed: () async {
                //       await viewModel.logout();
                //       setState(() {});
                //       },
                //     child: Text('LOGOUT', style: TextStyle(color: Colors.lightBlueAccent)),
                //   ),
                // ),
                // SizedBox(height:15),
                // SizedBox(
                //   width: 200,
                //   child: ElevatedButton(
                //     onPressed: () async {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => HomePage()),
                //       );
                //     }, child: Text('Guest', style: TextStyle(color: Colors.lightBlueAccent)),
                //   ),
                // ),
              ]
          ),
        ),
      ),
    );
  }
}

// void user_log(int user_id, String? nickname) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   if(nickname != null) {
//     prefs.setString(user_id.toString(), nickname);
//   }
//   String? value = prefs.getString(user_id.toString());
//   print(value);
// }

void getuser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  Map<String, dynamic> allPrefs = {for (var key in prefs.getKeys()) key: prefs.get(key)};

  print(allPrefs);
}

