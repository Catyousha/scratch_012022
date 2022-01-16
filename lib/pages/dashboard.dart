import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scratch_012022/routes/dashboard_route_observer.dart';
import 'package:scratch_012022/routes/routes.dart';
import 'package:scratch_012022/widgets/bottom_navbar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentIndex = 0;
  bool isBotNavVisible = true;
  List<int> historyIndex = [];
  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Back-button to pop
        if (SubRoutes.key.currentState!.canPop()) {
          SubRoutes.key.currentState!.pop();

          // setState(() {
          //   currentIndex = historyIndex.removeLast();
          // });
          return false;
        }

        // back button to exit
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= const Duration(seconds: 2);
        pre_backpress = DateTime.now();
        if (cantExit) {
          Fluttertoast.showToast(msg: "Press again to exit");
          return false;
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return true;
        }
      },
      child: Scaffold(
        body: Navigator(
          key: SubRoutes.key,
          onGenerateRoute: RouteHandler.generateSubRoute,
          initialRoute: SubRoutes.home,
          observers: [
            DashboardRouteObserver(
              checkBotNavVisible: (val) {
                setState(() {
                  isBotNavVisible = val;
                });
              },
              changeIndex: (val) {
                setState(() {
                  historyIndex.add(currentIndex);
                  currentIndex = val;
                });
              },
            )
          ],
        ),
        bottomNavigationBar: Visibility(
          visible: isBotNavVisible,
          child: BottomNavbar(
            currentIndex: currentIndex,
          ),
        ),
      ),
    );
  }
}
