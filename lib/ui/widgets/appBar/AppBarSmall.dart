import 'package:flutter/material.dart';
import '../../themes/bloopaExtras.dart';
import '../form/IntelligentSearchWidget.dart';


class AppBarSmall extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarSmall({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBloopaPrimaryContainer,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IntelligentSearchWidget(),
          ]
      ),
      //automaticallyImplyLeading: true,

      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        Icon(
            Icons.menu,
            color: kBloopaPrimary,
            size: 40
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
