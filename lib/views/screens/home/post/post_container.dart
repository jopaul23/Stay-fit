import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/models/post_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/home/post/post_preview_page.dart';

class PostContainer extends StatefulWidget {
  const PostContainer({
    Key? key,
    required this.size,
    required this.post,
    required this.expandCaption,
    this.titleSuffix = "",
    this.isPostviewPage = false,
  }) : super(key: key);

  final Size size;
  final bool expandCaption;
  final bool isPostviewPage;
  final PostModel post;
  final String titleSuffix;
  @override
  State<PostContainer> createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  GlobalKey menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: defaultPadding, horizontal: defaultPadding),
      width: double.maxFinite,
      // height: 55,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: primaryPurple.withOpacity(0.1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.post.userProfileUrl),
                        ),
                      ),
                    )),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          if (widget.post.isBusinessPost)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.post.heading,
                style: TextStyle(
                  color: primaryPurple,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          GestureDetector(
            onTap: () => Get.to(
              PostViewPage(post: widget.post),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.post.caption,
                maxLines: widget.expandCaption ? 100 : 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: primaryPurple,
                  fontWeight: widget.post.isBusinessPost
                      ? FontWeight.w300
                      : FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Image.network(
            widget.post.imagesUrl[0],
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return SizedBox(
                height: 100,
                width: widget.size.width,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
            width: widget.size.width,
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
