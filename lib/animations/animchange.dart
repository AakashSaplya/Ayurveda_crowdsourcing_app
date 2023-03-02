import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimChange extends StatefulWidget {
  final int b;
  const AnimChange({Key? key, required this.b}) : super(key: key);
  @override
  State<AnimChange> createState() => _AnimChangeState();
}

class _AnimChangeState extends State<AnimChange> {
  @override
  Widget build(BuildContext context) {
    return widget.b == 0
        ? Lottie.asset("assets/lottie/yoga_pose1.json")
        : widget.b == 1
            ? Lottie.asset("assets/lottie/yoga_pose2.json")
            : widget.b == 2
                ? Lottie.asset("assets/lottie/yoga_pose3.json")
                : Lottie.asset("assets/lottie/yoga_pose4.json");
  }
}
