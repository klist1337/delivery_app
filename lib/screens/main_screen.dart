import 'package:delivery_app/nav_bar.dart';
import 'package:delivery_app/nav_model.dart';
import 'package:delivery_app/screens/home.dart';
import 'package:delivery_app/screens/order.dart';
import 'package:delivery_app/screens/search.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final orderNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  int selectedScreen = 0;
  List<NavModel> items = [];
  @override
  void initState() {
    super.initState();
    items = [
      NavModel(page: const HomePage(), navKey: homeNavKey),
      NavModel(page: const Order() , navKey: orderNavKey),
      NavModel(page: const Search(), navKey: searchNavKey),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: customLogic(),
      child: Scaffold(
        body: IndexedStack(
          index: selectedScreen,
          children: items.
          map((item) => Navigator(
            onGenerateInitialRoutes: (navigator, initialRoute) {
              return [
                MaterialPageRoute(builder: (context) => item.page)
              ];
            },
            key:item.navKey,
          )).toList(),
        ),
        bottomNavigationBar: NavBar(
          pageIndex: selectedScreen, 
          onTap: (index) {
            if (index == selectedScreen) {
              items[index].
              navKey.currentState?.popUntil((route) => route.isFirst);
            }
            else {
              setState(() {
                selectedScreen = index;
              });
            }
          }),
      ),
    );
  }
  customLogic() {
    if (items[selectedScreen].navKey.currentState?.canPop() ?? false) {
      items[selectedScreen].navKey.currentState?.pop();
      return false;
    }
    return true;
  }
}