import 'package:arfudy_flutter/models/meal_model.dart';
import 'package:arfudy_flutter/views/widgets/ar_button.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_button.dart';
import 'package:arfudy_flutter/views/widgets/arfudy_scaffold.dart';
import 'package:arfudy_flutter/views/widgets/price_tag.dart';
import 'package:flutter/material.dart';

import '../controllers/home_view_controller.dart';
import '../utils/ui_colors.dart';
import '../utils/ui_scale.dart';
import '../utils/ui_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    HomeViewController.init();
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return ArfudyScaffold(
      body: ValueListenableBuilder<HomeViewState>(
          valueListenable: HomeViewController.state,
          builder: (context, state, _) {
            switch (state) {
              case HomeViewState.initial:
                return const SizedBox();
              case HomeViewState.loading:
                return const LoadingView();
              case HomeViewState.success:
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: HomeViewController.meals.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(UIScale.width(1)),
                      child: MealCard(meal: HomeViewController.meals[index]),
                    );
                  },
                );
              case HomeViewState.failure:
                return const FailureHomeView();
            }
          }),
    );
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const UIText('Carregando cardápio...'),
          SizedBox(
            height: UIScale.height(5),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}

class FailureHomeView extends StatelessWidget {
  const FailureHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_rounded, size: UIScale.width(10), color: UIColors.badRed),
          SizedBox(
            height: UIScale.height(5),
          ),
          SizedBox(
            width: UIScale.width(80),
            child: const UIText(
              'Ops... Por algum motivo não conseguimos carregar o cardápio.',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: UIScale.height(5),
          ),
          ArfudyButton(
            text: 'Tente novamente!',
            onTap: () => HomeViewController.init(),
          )
        ],
      ),
    );
  }
}

class MealCard extends StatelessWidget {
  const MealCard({Key? key, required this.meal}) : super(key: key);
  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      alignment: Alignment.topLeft,
                      child: UIText(meal.name),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(UIScale.width(3)),
                    child: Row(children: [
                      PriceTag(meal.mealPrice),
                      SizedBox(
                        width: UIScale.width(2),
                      ),
                      meal.has3d == true ? const ARButton() : const SizedBox(),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          meal.imageUrl,
                          height: UIScale.width(30),
                          width: UIScale.width(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
