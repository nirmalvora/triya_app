import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class UploadResumeController extends GetxController {
  Rx<File?> files = Rx<File?>(null);
  Future getPdf() async {
    File file = File("/dir1/dir2/file.ext");
    file.path;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      result.files.forEach((element) {
        files.value = File(element.path!);
      });
    }
  }
}
