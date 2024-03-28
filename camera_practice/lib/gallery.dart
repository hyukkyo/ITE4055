import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  void _uploadImage() async{
    if (_image != null){
      var uri = Uri.parse('http://221.146.69.102:5000/predict');
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path.toString()));

      var response = await request.send();

      if(response.statusCode == 200){
        String species = await response.stream.bytesToString();

        print('species: $species');
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
    return Scaffold(
      appBar: AppBar(title: const Text('Image')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            if(_image != null)
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Image.file(
                  File(_image!.path),
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ElevatedButton(onPressed: () => getImage(ImageSource.gallery), child: Text('Select Image')),
            if (_image != null)
              ElevatedButton(onPressed: _uploadImage, child: Text('UPLOAD'),
              ),
          ],
        ),
      ),
    );
  }
}
//
// void _uploadImage() async{
//   XFile? image;
//   final ImagePicker picker = ImagePicker();
//
//   if (image != null){
//     var uri = Uri.parse('http://221.146.69.102:5000/predict');
//     var request = http.MultipartRequest('POST', uri);
//     request.files.add(await http.MultipartFile.fromPath('image', image!.path.toString()));
//
//     var response = await request.send();
//
//     if(response.statusCode == 200){
//       String species = await response.stream.bytesToString();
//
//       print('species: $species');
//     }
//     else{
//       print('UPLOAD FAILED');
//     }
//   }
//   else{
//     print('NO IMAGE SELECTED');
//   }
// }
