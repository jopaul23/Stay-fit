import 'package:flutter/material.dart';
import 'package:stayfit/views/constants/constants.dart';

class BioField extends StatefulWidget {
  const BioField(
      {Key? key,
      this.width = double.maxFinite,
      required this.textEditingController})
      : super(key: key);

  @override
  State<BioField> createState() => _BioFieldState();
  final double width;
  final TextEditingController textEditingController;
}

class _BioFieldState extends State<BioField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: defaultPadding),
      width: widget.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: primaryPurple.withOpacity(0.1),
            )
          ]),
      child: Form(
        child: TextFormField(
          controller: widget.textEditingController,
          maxLines: 5,
          maxLength: 500,
          decoration: const InputDecoration(
            hintText: "Express yourself",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
