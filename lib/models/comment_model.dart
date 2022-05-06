class Comment {
  Comment({
    required this.commentId,
    required this.isReply,
    required this.commentTitle,
    required this.commentPostTime,
    required this.commentedUserName,
    required this.commentedUserProfileUrl,
    required this.isProUser,
    required this.upvoteCount,
    required this.downvoteCount,
    required this.upvoted,
    required this.downvoted,
    required this.reply,
  });

  int commentId;
  bool isReply;
  String commentTitle;
  DateTime commentPostTime;
  String commentedUserName;
  String commentedUserProfileUrl;
  bool isProUser;
  int upvoteCount;
  int downvoteCount;
  bool upvoted;
  bool downvoted;
  List<Comment> reply;

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        commentId: json["comment_id"],
        isReply: json["is_reply"],
        commentTitle: json["comment_title"],
        commentPostTime: DateTime.parse(json["comment_post_time"]),
        commentedUserName: json["commented_user_name"],
        commentedUserProfileUrl: json["commented_user_profile_url"],
        isProUser: json["is_pro_user"],
        upvoteCount: json["upvote_count"],
        downvoteCount: json["downvote_count"],
        upvoted: json["upvoted"],
        downvoted: json["downvoted"],
        reply: List<Comment>.from(json["reply"].map((x) => Comment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "comment_id": commentId,
        "is_reply": isReply,
        "comment_title": commentTitle,
        "comment_post_time": commentPostTime.toIso8601String(),
        "commented_user_name": commentedUserName,
        "commented_user_profile_url": commentedUserProfileUrl,
        "is_pro_user": isProUser,
        "upvote_count": upvoteCount,
        "downvote_count": downvoteCount,
        "upvoted": upvoted,
        "downvoted": downvoted,
        "reply": List<Comment>.from(reply.map((x) => x)),
      };
}
