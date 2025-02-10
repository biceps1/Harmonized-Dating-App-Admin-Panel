import 'package:flutter/material.dart';
import 'package:harmonized_admin/src/core/config/theme/themecolor.dart';

class CustomAnimatedButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final double? width;
  final Color? textColor;
  const CustomAnimatedButton({
    super.key,
    this.width,
    this.textColor,
    required this.text,
    required this.onTap,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CustomAnimatedButtonState createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  double _animatedWidth = 0.0;
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isHover)
          Container(
            height: 52,
            width: widget.width ?? 177,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 52,
          width: _animatedWidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Themecolor.primaryColor),
        ),
        InkWell(
          onHover: (value) {
            setState(() {
              isHover = !isHover;
              _animatedWidth = value ? widget.width ?? 177 : 0.0;
            });
          },
          onTap: () {
            widget.onTap();
          },
          child: SizedBox(
            height: 52,
            width: widget.width ?? 177,
            child: Center(
              child: Text(
                widget.text.toUpperCase(),
                style: TextStyle(color:isHover? Themecolor.white: Themecolor.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
