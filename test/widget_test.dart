import 'package:conversor_moedas/app/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  final homeController = HomeController(toText, fromText);

  test('Converter de real para dolar', (() {
    toText.text = '2.0';
    homeController.Convert();
    expect(fromText.text, '0.36');
  }));
}
