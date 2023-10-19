import 'package:flutter/material.dart';

import '../../utils/new_ui_text.dart';
import '../../utils/ui_design.dart';
import '../../utils/ui_scale.dart';
import 'new_primary_button.dart';

class ArfudyLoadingView extends StatelessWidget {
  const ArfudyLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}

class ArfudyFailureView extends StatelessWidget {
  const ArfudyFailureView(this.errorMessage, {super.key, this.onRetry});

  final String? errorMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: UIScale.width(100),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: UIDesign.primaryBorder,
              boxShadow: UIDesign.primaryShadows,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: const Center(
                child: NewUIText(
              'Oops! Um erro ocorreu...',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
          ),
          const SizedBox(height: 16),
          Container(
            width: UIScale.width(100),
            height: UIScale.height(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: UIDesign.primaryBorder,
              boxShadow: UIDesign.primaryShadows,
            ),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Center(child: NewUIText(errorMessage ?? 'Erro ao carregar os dados.')),
          ),
          const SizedBox(height: 16),
          if (onRetry != null) NewPrimaryButton(buttonText: 'Tentar denovo', onPressed: onRetry)
        ],
      ),
    );
  }
}
