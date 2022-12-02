import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class ArPage extends StatefulWidget {
  const ArPage({super.key});

  @override
  State<ArPage> createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  // UnityWidgetController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      // body: UnityWidget(
      //   onUnityCreated: _onUnityCreated,
      //   useAndroidViewSurface: true,
      //   fullscreen: false,
      // ),
    );
  }

  // _onUnityCreated(controller) {
  //   this.controller = controller;
  // }
}
