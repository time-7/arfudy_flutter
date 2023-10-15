import 'package:arfudy_flutter/delegate/arfudy_views_routes.dart';
import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/utils/ui_colors.dart';
import 'package:arfudy_flutter/utils/ui_scale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSplashView extends StatefulWidget {
  const AppSplashView({Key? key}) : super(key: key);

  @override
  State<AppSplashView> createState() => _AppSplashViewState();
}

class _AppSplashViewState extends State<AppSplashView> {
  bool _positionWasTriggered = false;
  bool _opacityWasTriggered = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 500));
      _positionWasTriggered = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 100));
      _opacityWasTriggered = true;
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 2000));
      handleInitialView();
    });
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Material(
      child: Container(
        color: UIColors.primaryBlue,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: _positionWasTriggered == false
                  ? MediaQuery.of(context).size.height / 2 - 35
                  : (MediaQuery.of(context).size.height / 2) - 100,
              left: _positionWasTriggered == false ? 10 : MediaQuery.of(context).size.width / 2 - 110,
              right: _positionWasTriggered == false ? 10 : MediaQuery.of(context).size.width / 2 - 110,
              child: SizedBox(
                child: Image.asset(
                  'assets/images/arfudy_new_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 2,
              left: 0,
              right: 0,
              bottom: 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _opacityWasTriggered == false ? 0 : 1,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 200,
                          child: NewUIText(
                            'Onde o seu pedido se torna realidade!',
                            fontColor: Colors.white,
                            fontSize: 18,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  handleInitialView() async {
    Get.offNamed(ArfudyRoutes.test);
  }
}
