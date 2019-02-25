import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'dart:io';
import 'package:dio/dio.dart';
import '../common/service.dart' as commonService;

class UploadPage extends StatefulWidget {
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('上传'),
      ),
      body: ExcelFileUpload(),
    );
  }
}

/////////////////////////////////////////
// Excel文件上传
/////////////////////////////////////////

class ExcelFileUpload extends StatefulWidget {
  @override
  _ExcelFileUploadState createState() => _ExcelFileUploadState();
}

class _ExcelFileUploadState extends State<ExcelFileUpload> {
  String _filePath = '';

  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath(type: FileType.ANY);
      if (filePath == '') {
        return;
      }

      commonService.upload(
        new FormData.from({
          'file': new UploadFileInfo(new File(filePath), 'file.png')
        })
      );
      
      print("File path: " + filePath);

      setState((){
        _filePath = filePath;
      });
    } catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: getFilePath,
            child: Text('选择文件'),
          ),
          Text(_filePath)
        ],
      )
    );
  }
}