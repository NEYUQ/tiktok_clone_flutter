import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/models/video.dart';
import 'package:video_compress/video_compress.dart';

class UploadVideoController extends GetxController {
  //upload video

  uploadVideo(
    String songName,
    String caption,
    String videoPath,
  ) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firebaseFirestore.collection("users").doc(uid).get();
      //get id
      var allDocs = await firebaseFirestore.collection("videos").get();
      int len = allDocs.docs.length;

      String videoUrl = await _uploadVideoToStorage("video $len", videoPath);

      String thumbnail = await _uploadImageToStorage("video $len", videoPath);

      Video video = Video(
        username: (userDoc.data() as Map<String, dynamic>)['name'],
        uid: uid,
        id: "video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        thumbnails: thumbnail,
        profilePhoto: (userDoc.data() as Map<String, dynamic>)['profilePhoto'],
        videoUrl: videoUrl,
      );
      await firebaseFirestore
          .collection('videos')
          .doc('video $len')
          .set(video.toJson());
      Get.back();
    } catch (e) {
      Get.snackbar("Error Upload Video", e.toString());
    }
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);

    UploadTask up = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await up;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _compressVideo(String videoPath) async {
    final compressVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    return compressVideo!.file;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);

    UploadTask up = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await up;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }
}
