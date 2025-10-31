import 'package:flutter/material.dart';
import '../../themes/bloopaExtras.dart';
import '../form/IntelligentSearchWidget.dart';


class AppBarMedium extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarMedium({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: kBloopaPrimaryContainer,
        title: Text("app bar Medium")
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
