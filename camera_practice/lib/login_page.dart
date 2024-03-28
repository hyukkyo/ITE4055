import 'package:camera_practice/main_view_model.dart';
import 'package:flutter/material.dart';
import 'package:camera_practice/view/home_page.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:camera_practice/social_login.dart';
import 'package:camera_practice/kakao_login.dart';
import 'package:camera_practice/main_view_model.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final viewModel = MainViewModel(KakaoTalkLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(

                  child: GestureDetector(
                      onTap: () async {
                        await viewModel.login();
                        setState(() {

                        });
                        // if (await isKakaoTalkInstalled()) {
                        //   try {
                        //     await UserApi.instance.loginWithKakaoTalk();
                        //     print('카카오톡으로 로그인 성공');
                        //   } catch (error) {
                        //     print('카카오톡으로 로그인 실패 $error');
                        //
                        //     // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
                        //     // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
                        //     if (error is PlatformException && error.code == 'CANCELED') {
                        //       return;
                        //     }
                        //     // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
                        //     try {
                        //       await UserApi.instance.loginWithKakaoAccount();
                        //       print('카카오계정으로 로그인 성공');
                        //     } catch (error) {
                        //       print('카카오계정으로 로그인 실패 $error');
                        //     }
                        //   }
                        // } else {
                        //   try {
                        //     await UserApi.instance.loginWithKakaoAccount();
                        //     print('카카오계정으로 로그인 성공');
                        //   } catch (error) {
                        //     print('카카오계정으로 로그인 실패 $error');
                        //   }
                        // }
                      },
                      child: Image.asset(
                      'lib/icons/kakao_login_medium_narrow.png', height: 50, width:200)),
                ),
                SizedBox(height:15),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      await viewModel.logout();
                      setState(() {});
                      },
                    child: Text('LOGOUT', style: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                ),
                SizedBox(height:15),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }, child: Text('Guest', style: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}

// Future<void> LoginKakaoTalk(BuildContext context) async {
//   if (await isKakaoTalkInstalled()) {
//     try {
//       await UserApi.instance.loginWithKakaoTalk();
//       print('카카오톡으로 로그인 성공');
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => HomePage()));
//
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => HomePage()),
//       // );
//
//     } catch (error) {
//       print('카카오톡으로 로그인 실패 $error');
//
//       // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
//       // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
//       if (error is PlatformException && error.code == 'CANCELED') {
//         return;
//       }
//       // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
//       try {
//         await UserApi.instance.loginWithKakaoAccount();
//         print('카카오계정으로 로그인 성공');
//         Navigator.of(context).pushReplacement(MaterialPageRoute(
//             builder: (context) => HomePage()));
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => HomePage()),
//         // );
//       } catch (error) {
//         print('카카오계정으로 로그인 실패 $error');
//       }
//     }
//   } else {
//     try {
//       await UserApi.instance.loginWithKakaoAccount();
//       print('카카오계정으로 로그인 성공');
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (context) => HomePage()));
//       // Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => HomePage()),
//       // );
//     } catch (error) {
//       print('카카오계정으로 로그인 실패 $error');
//     }
//   }
// }
//
