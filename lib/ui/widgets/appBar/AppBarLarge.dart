import 'package:flutter/material.dart';
import '../../themes/bloopaExtras.dart';
import '../form/IntelligentSearchWidget.dart';


class AppBarLarge extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarLarge({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBloopaPrimaryContainer,
      title: Text("app bar large")
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
