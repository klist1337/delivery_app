import 'dart:io';

import 'package:delivery_app/const.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: Platform.isAndroid ? 16 : 0,
      ),
      child: BottomAppBar(
        height: 95,
        color: color5,
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Container(
            height: 60,
            color: color2,
            child: Row(children: [
              navItem(Icons.home_outlined, 
              pageIndex == 0,
              onTap: () => onTap(0)),
              navItem(Icons.shopping_bag_outlined, 
              pageIndex == 1,
              onTap: () => onTap(1)),
              navItem(Icons.search_outlined, 
              pageIndex == 2,
              onTap: () => onTap(2)),
              navItem(Icons.check_box_outlined, 
              pageIndex == 3,
              onTap: () => onTap(3)),
              navItem(Icons.person_2_outlined, 
              pageIndex == 4,
              onTap: () => onTap(4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? color1 : Colors.white70,
        size: 28,
      ),
    ));
}