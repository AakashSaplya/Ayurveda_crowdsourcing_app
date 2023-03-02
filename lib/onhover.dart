import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;

  const OnHoverButton({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _OnHoverButtonState createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hoveredTransform = Matrix4.identity()..scale(5.0);
    final transform = isHovered ? hoveredTransform : Matrix4.identity();

    return MouseRegion(
        onEnter: ((event) => onEntered(true)),
        onExit: (event) => onEntered(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: transform,
          child: widget.child,
        ));
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
