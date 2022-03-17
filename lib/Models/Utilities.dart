import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:csv/csv.dart';

import 'package:flutter/services.dart' show rootBundle;




class Utilities{

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }


}





// void _openFileExplorer() async {
//
//   try {
//
//     _paths = (await FilePicker.platform.pickFiles(
//       type: _pickingType,
//       allowMultiple: false,
//       allowedExtensions: (_extension?.isNotEmpty ?? false)
//           ? _extension?.replaceAll(' ', '').split(',')
//           : null,
//     ))
//         ?.files;
//   } on PlatformException catch (e) {
//     print("Unsupported operation" + e.toString());
//   } catch (ex) {
//     print(ex);
//   }
//   if (!mounted) return;
//   setState(() {
//     openFile(_paths![0].path);
//     print(_paths);
//     print("File path ${_paths![0]}");
//     print(_paths!.first.extension);
//
//   });
// }