import 'package:flutter/material.dart';

import '../../../utils/Responsive.dart';
import '../../themes/bloopaExtras.dart';
import 'BottomBarSmall.dart';


class BottomBarLayout extends StatelessWidget implements PreferredSizeWidget {
  final int itemSelected;
  final String local;
  final String? listName ;

  const BottomBarLayout({super.key,  required this.itemSelected, required this.local, required this.listName});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ResponsiveWidget.isLargeScreen(context)
        ?
          SizedBox.shrink()
        :
        ResponsiveWidget.isMediumScreen(context)
          ?
          SizedBox.shrink()
          :
          BottomBarSmall(itemSelected: itemSelected, local: local, listName: listName);

  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}
