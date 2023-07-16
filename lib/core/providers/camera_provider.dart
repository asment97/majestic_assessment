import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final cameraProvider = ChangeNotifierProvider.autoDispose<CameraProvider>(
  (ref) => CameraProvider(ref),
);

class CameraProvider extends ChangeNotifier {
  CameraProvider(this.ref);

  final Ref ref;

  final List<File> images = [];

  void launchCamera() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.camera,
    );
    if (result != null) {
      File image = File(result.path);
      images.add(image);
      notifyListeners();
    }
  }

  void removeImage(int index) {
    images.removeAt(index);
    notifyListeners();
  }
}
