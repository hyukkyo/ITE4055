import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:aws_s3_upload/aws_s3_upload.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  _uploadImage() async{
    if (_image != null){
      var uri = Uri.parse('http://218.39.215.36:5000/predict');
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path.toString()));

      var response = await request.send();

      if(response.statusCode == 200){
        String species = await response.stream.bytesToString();
        print('species: $species');
        return species;
      }
      else{
        print('UPLOAD FAILED');
      }
    }
    else{
      print('NO IMAGE SELECTED');
    }
  }

  Future getImage(ImageSource imageSource) async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null){
      setState(() {
        _image = XFile(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var _text = '';

    return Scaffold(
      // appBar: AppBar(title: const Text('Image')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            if(_image != null)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                // padding: const EdgeInsets.all(8.0),
                child: Image.file(
                  File(_image!.path),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),

            Text(
              _text,

            ),
            //이거 빼기
            ElevatedButton(onPressed: () => getImage(ImageSource.gallery), child: Text('Select Image', style: TextStyle(color: Colors.lightBlueAccent))),
            if (_image != null)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _text = _uploadImage();
                      });
                    },
                    child: Text('UPLOAD', style: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      AwsS3.uploadFile(
                          accessKey: "AKxxxxxxxxxxxxx",
                          secretKey: "xxxxxxxxxxxxxxxxxxxxxxxxxx",
                          file: File(_image!.path),
                          bucket: "fishdex",
                          region: "ap-northeast-2",
                          // metadata: {"test": "test"} // optional
                      );
                      
                    });
                  },
                    child: Text('도감에 저장', style: TextStyle(color: Colors.lightBlueAccent)),

                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
