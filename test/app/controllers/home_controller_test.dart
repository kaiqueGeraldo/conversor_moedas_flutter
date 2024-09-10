import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test(
    'deve converter de real para dólar',
    () {
      toText.text = '2.0';
      homeController.converter();
      expect(fromText.text, '0.36');
    },
  );
}
