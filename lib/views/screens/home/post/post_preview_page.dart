import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stayfit/models/post_model.dart';
import 'package:stayfit/views/constants/constants.dart';
import 'package:stayfit/views/screens/home/post/post_container.dart';
import 'package:stayfit/views/wigdets/appbar.dart';

class PostViewPage extends StatefulWidget {
  const PostViewPage({Key? key, required this.post}) : super(key: key);
  final PostModel post;
  @override
  State<PostViewPage> createState() => _PostViewPageState();
}

class _PostViewPageState extends State<PostViewPage> {
  bool favourite = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: white,
      appBar: appBarCustom(title: "Post"),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.vertical -
              56,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                child: PostContainer(
                  size: size,
                  post: widget.post,
                  isPostviewPage: true,
                  expandCaption: true,
                ),
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: primaryPurple.withOpacity(0.05),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
