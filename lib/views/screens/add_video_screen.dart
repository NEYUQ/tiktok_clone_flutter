import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/confirm_screen.dart';

import '../widgets/item_simple_dialog.dart';

class AddVideoScreen extends StatelessWidget {
  const AddVideoScreen({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);

    if (video != null) {
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (context) => ConfirmScreen(
      //       videoFile: File(video.path),
      //       videoPath: video.path,
      //     ),
      //   ),
      // );
      Get.to(
        () => ConfirmScreen(
          videoFile: File(video.path),
          videoPath: video.path,
        ),
      );
    }
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          ItemSimpleDialog(
            icon: Icons.image,
            press: () => pickVideo(
              ImageSource.gallery,
              context,
            ),
            label: 'Gallery',
          ),
          ItemSimpleDialog(
            icon: Icons.camera,
            press: () => pickVideo(
              ImageSource.camera,
              context,
            ),
            label: 'Camera',
          ),
          ItemSimpleDialog(
            icon: Icons.cancel,
            press: () => Navigator.of(context).pop(),
            label: 'Cancle',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: buttonColor),
            child: const Center(
              child: Text(
                'Add Video',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
