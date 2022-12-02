import 'package:arfudy_flutter/views/widgets/ar_button.dart';
import 'package:arfudy_flutter/views/widgets/price_tag.dart';
import 'package:flutter/material.dart';

import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';
import '../utils/ui_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      backgroundColor: UIColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Arfudy"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: UIScale.width(2),
          right: UIScale.width(2),
          top: UIScale.width(2),
        ),
        child: ListView(
          children: [
            Container(
              height: UIScale.height(20),
              decoration: BoxDecoration(
                color: UIColors.offWhite,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.all(UIScale.width(3)),
                            child: Container(
                              child: UIText("Macarrão com alho ao molho sugo"),
                              alignment: Alignment.topLeft,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(UIScale.width(3)),
                            child: Row(children: [
                              PriceTag("69,99"),
                              SizedBox(
                                width: UIScale.width(2),
                              ),
                              ARButton(),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.only(right: UIScale.width(2)),
                      child: Column(
                        children: [
                          Flexible(
                            child: Center(
                              child: Image.network(
                                  'https://i2.wp.com/files.agro20.com.br/uploads/2020/03/comidabrasileira3.jpg?fit=1024%2C585&ssl=1'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
