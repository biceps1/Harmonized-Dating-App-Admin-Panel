import 'package:flutter/material.dart';
import 'package:harmonized_admin/src/core/extension/media_query.dart';


class ButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  const ButtonWidget(
      {super.key, required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.widthPercentage(50),
        height: context.heightPercentage(6.5),
        decoration: BoxDecoration(
            color: const Color(0xff2874F0), borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16),
          ),
        ),
      ),
    );
  }
}

class FullSizeButtonWidget extends StatelessWidget {
  final String buttonTitle;
  final VoidCallback onTap;
  const FullSizeButtonWidget(
      {super.key, required this.buttonTitle, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.widthPercentage(90),
        height: context.heightPercentage(6.5),
        decoration: BoxDecoration(
            color: const Color(0xff2874F0), borderRadius: BorderRadius.circular(50)),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
