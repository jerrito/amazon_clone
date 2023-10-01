import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void showSnack({
  required BuildContext context,
  required String message,
}){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message))
  );
}

Future<List<File>> getCameraImage() async {
  ImagePicker picker = ImagePicker();
  List<File> get=[];
  try{
    List<XFile?> pickedFile;
    pickedFile = (await picker.pickMultiImage(
    ));
    if (pickedFile.isNotEmpty) {
      for(int i=0;i<pickedFile.length;i++){
        get.add(File(pickedFile[i]!.path));
      }
    } }
  catch(e) {
    // showSnack(context: context,
    //     message: "${e.toString()}\n No images selected");
  }
  return get;
}

Future<List<File>> getFileImage() async {
  List<File> paths=[];
  try {

    //FilePicker picker = FilePicker.platform;
    var pickedFile = await FilePicker.platform.pickFiles(
        type:FileType.image,
        allowMultiple: true
    );
    if(pickedFile!=null && pickedFile.files.isNotEmpty) {
      for (int i=0;i < pickedFile.files.length;i++) {
        paths.add(File(pickedFile.files[i].path!));
      }}
  } catch(e){
   // showSnack(context:context,message: e.toString());

  }
  return paths;
}
