import 'package:flutter/material.dart';
import '../../../utils/Responsive.dart';
import 'AppBarLarge.dart';
import 'AppBarMedium.dart';
import 'AppBarSmall.dart';

class AppBarLayout extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double preferredHeight;

  const AppBarLayout({
    super.key,
    required this.scaffoldKey,
    required this.preferredHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isLargeScreen(context)) {
      return  AppBarLarge(preferredHeight:preferredHeight);
    } else if (ResponsiveWidget.isMediumScreen(context)) {
      // Tu peux remettre AppBarMedium si besoin
      return  AppBarLarge(preferredHeight:preferredHeight);
      // return AppBarMedium(scaffoldKey: scaffoldKey);
    } else {
      return AppBarSmall(scaffoldKey: scaffoldKey);
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
