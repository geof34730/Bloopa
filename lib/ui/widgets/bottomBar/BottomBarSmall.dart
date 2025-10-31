import 'package:flutter/material.dart';

import '../../themes/bloopaExtras.dart';


class BottomBarSmall extends StatelessWidget implements PreferredSizeWidget {
  final int itemSelected;
  final String local;
  final String? listName ;

  const BottomBarSmall({super.key,  required this.itemSelected, required this.local, required this.listName});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.75)
            )
          ],
        ),
        child:BottomNavigationBar(
          backgroundColor:  kBloopaPrimaryContainer,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 35,
          type: BottomNavigationBarType.fixed,
          // Change to fixed for better control
          selectedIconTheme: IconThemeData(color: kBloopaPrimary),
          unselectedIconTheme: IconThemeData(color: kBloopaPrimary),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          items: <BottomNavigationBarItem>[
            _buildBottomNavigationBarItem(Icons.home_outlined, 0),
            _buildBottomNavigationBarItem(Icons.person_outline,  1),
            _buildBottomNavigationShoppingBarItem(2),
            _buildBottomNavigationNotificationBarItem(3),

          ],
          currentIndex: itemSelected,
          // Set the initial selected index

          onTap: (value) {
            switch (value) {
              case 0:
                print('link to home');
                break;
              case 1:
                print('link to profile');
                break;
              case 2:
                print('link to panier');
                break;
              case 3:
                print('link to menu');
                break;
            }
          },
        )
    );
  }





  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, int index) {

    return BottomNavigationBarItem(
        icon: Container(
          padding: EdgeInsets.all(4.0), // Add padding for the background
          child: Icon(icon),
        ),
        label:""
    );
  }
  BottomNavigationBarItem _buildBottomNavigationShoppingBarItem(int index) {
    return BottomNavigationBarItem(
        icon: _buildCartIcon(5,Icons.shopping_cart_outlined),
        label:""
    );
  }
  BottomNavigationBarItem _buildBottomNavigationNotificationBarItem(int index) {
    return BottomNavigationBarItem(
        icon: _buildCartIcon(5,Icons.notifications_outlined),
        label:""
    );
  }
  Widget _buildCartIcon(int cartItemCount,IconData icon) {
    return Stack(
      children: <Widget>[
        Icon(icon),
        if (cartItemCount > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                '$cartItemCount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);


}
