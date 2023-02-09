import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Video {
  String username;
  String uid;
  String id;
  List likes;
  int commentCount;
  int shareCount;
  String songName;
  String caption;
  String thumbnails;
  String profilePhoto;
  String videoUrl;
  Video({
    required this.username,
    required this.uid,
    required this.id,
    required this.likes,
    required this.commentCount,
    required this.shareCount,
    required this.songName,
    required this.caption,
    required this.thumbnails,
    required this.profilePhoto,
    required this.videoUrl,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'username': username,
      'uid': uid,
      'id': id,
      'likes': likes,
      'commentCount': commentCount,
      'shareCount': shareCount,
      'songName': songName,
      'caption': caption,
      'thumbnails': thumbnails,
      'profilePhoto': profilePhoto,
      'videoUrl': videoUrl,
    };
  }

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likes: snapshot['likes'],
      commentCount: snapshot['commentCount'],
      shareCount: snapshot['shareCount'],
      songName: snapshot['songName'],
      caption: snapshot['caption'],
      thumbnails: snapshot['thumbnails'],
      profilePhoto: snapshot['profilePhoto'],
      videoUrl: snapshot['videoUrl'],
    );
  }
}
