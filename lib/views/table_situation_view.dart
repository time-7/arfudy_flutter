import 'package:arfudy_flutter/utils/new_ui_text.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_new_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/new_primary_button.dart';
import 'package:flutter/material.dart';

import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';

class TableSituationView extends StatelessWidget {
  const TableSituationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ArfudyNewScaffold(
      hasDrawer: true,
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(name: 'Felippe', items: [
                  '3x macarrão enjoado',
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Marcos',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Daniel',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Isabela',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Steven',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Gabriel',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Julia',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'Adrian',
                  items: [
                    '3x macarrão enjoado',
                    '1x macarrão enjoado',
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: PersonOrdersContainer(
                  name: 'João',
                  items: [],
                ),
              ),
              SizedBox(height: 70),
            ],
          ),
        ),
      ),
      bottomBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NewPrimaryButton(
            buttonText: 'Finalizar atendimento',
            onPressed: () async {},
          ),
          Container(
            height: 62,
            width: 62,
            decoration: BoxDecoration(
              color: UIColors.secondaryCaramel,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.room_service,
              color: UIColors.tertiaryCaramel,
              size: 32,
            ),
          )
        ],
      ),
    );
  }
}

class PersonOrdersContainer extends StatefulWidget {
  const PersonOrdersContainer({
    super.key,
    this.items = const [],
    required this.name,
  });

  final List<String> items;
  final String name;

  @override
  State<PersonOrdersContainer> createState() => _PersonOrdersContainerState();
}

class _PersonOrdersContainerState extends State<PersonOrdersContainer> {
  bool _isOpened = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: _isOpened == false ? 0 : 1,
          duration: const Duration(milliseconds: 80),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            curve: Curves.bounceInOut,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 7,
            ),
            height: _isOpened == false ? 38 : 38 + (22 * widget.items.length) + 38,
            width: UIScale.width(100),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.black,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 38),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var item in widget.items)
                      NewUIText(
                        item,
                        fontSize: 16,
                      )
                  ],
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _isOpened = !_isOpened;
            setState(() {});
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 7,
            ),
            height: 38,
            width: UIScale.width(100),
            decoration: BoxDecoration(
              color: UIColors.secondaryCaramel,
              border: Border.all(
                color: Colors.black,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NewUIText(
                  widget.name,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontColor: UIColors.tertiaryCaramel,
                ),
                AnimatedRotation(
                  turns: _isOpened == false ? 0 : 1 / 4,
                  duration: const Duration(milliseconds: 100),
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: UIColors.tertiaryCaramel,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
