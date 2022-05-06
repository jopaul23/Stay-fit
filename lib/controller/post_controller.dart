import 'package:get/get.dart';
import 'package:stayfit/database/post_db.dart';
import 'package:stayfit/models/post_model.dart';

class PostController extends GetxController {
  List<PostModel> posts = [];
  void getPosts() {
    posts.clear();
    for (Map<String, dynamic> post in PostDB.postList) {
      posts.add(PostModel.fromMap(post));
    }
  }

  static String toTimeFromNow(DateTime time) {
    // DateTime time = DateTime.parse(formattedTime);
    Duration timeDiff = DateTime.now().difference(time);
    if (timeDiff.inSeconds == 0) {
      return "Just Now";
    } else if (timeDiff.inMinutes == 0) {
      return "${timeDiff.inSeconds} seconds";
    } else if (timeDiff.inHours == 0) {
      return "${timeDiff.inMinutes} minutes";
    } else if (timeDiff.inDays == 0) {
      return "${timeDiff.inHours} hours";
    } else if (timeDiff.inDays <= 7) {
      return "${timeDiff.inDays} days";
    } else if (timeDiff.inDays <= 30) {
      return "${(timeDiff.inDays / 7).floor()} weeks";
    } else if (timeDiff.inDays <= 365) {
      return "${(timeDiff.inDays / 30).floor()} months";
    } else {
      return "${(timeDiff.inDays / 365.25).floor()} years";
    }
  }
}
