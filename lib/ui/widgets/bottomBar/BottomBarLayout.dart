import 'package:flutter/material.dart';
import '../../../utils/Responsive.dart';
import 'BottomBarSmall.dart';


class BottomBarLayout extends StatelessWidget implements PreferredSizeWidget {
  final int itemSelected;


  const BottomBarLayout({super.key,  required this.itemSelected});
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isLargeScreen(context)
        ?
          SizedBox.shrink()
        :
        ResponsiveWidget.isMediumScreen(context)
          ?
          SizedBox.shrink()
          :
          BottomBarSmall(itemSelected: itemSelected);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
