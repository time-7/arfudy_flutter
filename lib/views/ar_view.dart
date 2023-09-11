import 'package:arfudy_flutter/controllers/ar_view_controller.dart';
import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:provider/provider.dart';

class ArView extends StatelessWidget {
  const ArView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArViewController>(
      builder: (_, contoller, __) {
        contoller.meal =
            ModalRoute.of(context)!.settings.arguments as MealModel;
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              leading: const BackButton(color: Colors.white)),
          backgroundColor: Colors.black,
          // body: UnityWidget(
          //   onUnityCreated: contoller.onUnityCreated,
          //   useAndroidViewSurface: true,
          //   fullscreen: false,
          // ),
        );
      },
    );
  }
}
