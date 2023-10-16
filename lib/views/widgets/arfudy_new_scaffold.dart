import 'package:flutter/material.dart';

import '../../utils/ui_colors.dart';
import '../../utils/ui_scale.dart';
import 'arfudy_drawer.dart';

class ArfudyNewScaffold extends StatelessWidget {
  ArfudyNewScaffold({
    super.key,
    required this.body,
    this.bottomBar,
    this.hasDrawer = false,
  });

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Widget body;
  final Widget? bottomBar;
  final bool hasDrawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: UIColors.primaryBlue,
      drawer: hasDrawer ? const ArfudyDrawer() : null,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(UIScale.topDevicePadding + 40),
        child: Container(
          width: UIScale.width(100),
          decoration: const BoxDecoration(
            color: UIColors.secondaryBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 0,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0, left: 30),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: hasDrawer
                      ? GestureDetector(
                          onTap: () {
                            _scaffoldKey.currentState?.openDrawer();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: UIScale.topDevicePadding),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Icon(
                                Icons.menu_rounded,
                                color: UIColors.secondaryCaramel,
                                size: 45,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(top: UIScale.topDevicePadding),
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/arfudy_new_logo.png',
                        height: UIScale.height(6),
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                  child: body,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: UIScale.height(10) + UIScale.bottomDevicePadding,
                    width: UIScale.width(100),
                    child: Padding(
                      padding: EdgeInsets.only(right: 30.0, left: 30.0, bottom: UIScale.bottomDevicePadding + 20),
                      child: Center(child: bottomBar ?? Container()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
