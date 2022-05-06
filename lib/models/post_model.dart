import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:stayfit/models/comment_model.dart';

PostModel postModelFromMap(String str) => PostModel.fromMap(json.decode(str));

String postModelToMap(PostModel data) => json.encode(data.toMap());

class PostModel {
  PostModel({
    required this.postId,
    required this.heading,
    required this.imagesUrl,
    required this.videoUrl,
    required this.favourite,
    required this.upvoted,
    required this.upvoteCount,
    required this.downvoted,
    required this.downvoteCount,
    required this.publishTime,
    required this.postUrl,
    required this.caption,
    required this.catagory,
    required this.userName,
    required this.isProUser,
    required this.userProfileUrl,
    required this.comments,
    required this.isBusinessPost,
  });

  int postId;
  List<String> imagesUrl;
  String videoUrl;
  bool favourite;
  bool upvoted;
  int upvoteCount;
  bool downvoted;
  int downvoteCount;
  DateTime publishTime;
  String postUrl;
  String caption;
  String heading;
  String catagory;
  String userName;
  bool isProUser;
  bool isBusinessPost;
  String userProfileUrl;
  List<Comment> comments;

  factory PostModel.fromMap(Map<String, dynamic> json) => PostModel(
        postId: json["post_id"],
        imagesUrl: List<String>.from(json["images_url"].map((x) => x)),
        videoUrl: json["video_url"],
        favourite: json["favourite"],
        upvoted: json["upvoted"],
        upvoteCount: json["upvote_count"],
        downvoted: json["downvoted"],
        downvoteCount: json["downvote_count"],
        publishTime: DateTime.parse(json["publish_time"]),
        postUrl: json["post_url"],
        heading: json["heading"],
        caption: json["caption"],
        catagory: json["catagory"],
        userName: json["user_name"],
        isProUser: json["is_pro_user"],
        isBusinessPost: json["is_business_post"],
        userProfileUrl: json["user_profile_url"],
        comments:
            List<Comment>.from(json["comments"].map((x) => Comment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "post_id": postId,
        "images_url": List<dynamic>.from(imagesUrl.map((x) => x)),
        "video_url": videoUrl,
        "favourite": favourite,
        "upvoted": upvoted,
        "upvote_count": upvoteCount,
        "downvoted": downvoted,
        "downvote_count": downvoteCount,
        "publish_time": publishTime.toIso8601String(),
        "post_url": postUrl,
        "caption": caption,
        "catagory": catagory,
        "user_name": userName,
        "is_pro_user": isProUser,
        "is_business_post": isBusinessPost,
        "user_profile_url": userProfileUrl,
        "comments": List<dynamic>.from(comments.map((x) => x.toMap())),
      };
}
