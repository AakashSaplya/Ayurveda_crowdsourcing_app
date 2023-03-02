import 'package:ayurveda/config/palette.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Palette.primaryColor,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 28.0,
          onPressed: () {},
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
