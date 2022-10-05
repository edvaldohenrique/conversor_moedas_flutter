import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController toText = TextEditingController();
  late TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 150, left: 30, right: 30, bottom: 20),
            child: Column(children: [
              Image.asset(
                'assets/conversao.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 20),
              CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  controllerText: toText,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  }),
              SizedBox(height: 15),
              CurrencyBox(
                  selectedItem: homeController.fromCurrency,
                  items: homeController.currencies,
                  controllerText: fromText,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  }),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  homeController.Convert();
                },
                child: Text('Converter'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
