import 'package:ai_object_detector/controller/scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'JARVIS',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 73, 38, 212),
        // You can add more properties to customize the app bar as needed
      ),
      body: GetBuilder<ScanController>(
        init: ScanController(),
        builder: (controller) {
          return controller.isCameraInitialized.value
              ? Stack(
                  children: [
                    // Camera Preview
                    Positioned.fill(
                      child: CameraPreview(controller.cameraController),
                    ),
                    // Label
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.transparent,
                            child: Text(
                              "${controller.label}",
                              style: const TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 47, 236, 104),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(
                  child: Text("Loading Preview"),
                );
        },
      ),
    );
  }
}
