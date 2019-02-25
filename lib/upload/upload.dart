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
        title: Text('文件上传'),
      ),
      body: ExcelFileUpload(),
    );
  }
}

/////////////////////////////////////////
// 文件上传
/////////////////////////////////////////

class ExcelFileUpload extends StatefulWidget {
  @override
  _ExcelFileUploadState createState() => _ExcelFileUploadState();
}

class _ExcelFileUploadState extends State<ExcelFileUpload> {
  String _uploadFilePath = '';
  String _uploadProgress = '';

  void getFilePath() async {
    try {
      String filePath = await FilePicker.getFilePath(type: FileType.ANY);
      if (filePath == '') {
        return;
      }

      setState(() {
        _uploadFilePath = filePath;
      });

      // 调用上传服务
      commonService.upload(
        new FormData.from({
          'file': new UploadFileInfo(new File(filePath), 'file.png')
        }),
        (int count, int total) {
          // 设置上传进度
          String progress = ((count / total) * 100).toStringAsFixed(2);
          setState(() {
            _uploadProgress = '$progress%';
          });
        }
      );
    } catch (e) {
      print("Error while picking the file: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: getFilePath,
              child: Text('选择文件'),
            ),
            Text('文件路径：$_uploadFilePath'),
            Text('上传进度：$_uploadProgress')
          ],
        )
      ),
    );
  }
}