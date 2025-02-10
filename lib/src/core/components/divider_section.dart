
import 'package:flutter/material.dart';

class DividerSection extends StatelessWidget {
  const DividerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color(0XFFAFAFAF),
        indent: 6,
      ),
    );
  }
}
