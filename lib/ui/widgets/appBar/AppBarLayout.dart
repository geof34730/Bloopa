import 'package:flutter/material.dart';
import '../../../utils/Responsive.dart';
import 'AppBarLarge.dart';
import 'AppBarMedium.dart';
import 'AppBarSmall.dart';


class AppBarLayout extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarLayout({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ?
        PreferredSize(preferredSize: Size(screenSize.width,150), child: AppBarLarge(scaffoldKey: scaffoldKey))
        :
        ResponsiveWidget.isMediumScreen(context)
          ?
          AppBarMedium(scaffoldKey: scaffoldKey,)
          :
          AppBarSmall(scaffoldKey: scaffoldKey,);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}
