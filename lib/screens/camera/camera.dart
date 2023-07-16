import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:majestic_assessment/core/providers/camera_provider.dart';

class CameraPage extends ConsumerWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(cameraProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Camera"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                camera.launchCamera();
              },
              child: const Icon(Icons.camera_alt),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: Stack(
                        children: [
                          Image.file(camera.images[index]),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                camera.removeImage(index);
                              },
                              child: const Icon(
                                Icons.close_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: camera.images.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
