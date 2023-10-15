import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/menu_container.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';

import '../utils/ui_scale.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return ArfudyNewScaffold(
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: MenuContainer(),
            ),
          ],
        ),
      ),
      bottomBar: const NewPrimaryButton(),
    );
  }
}
