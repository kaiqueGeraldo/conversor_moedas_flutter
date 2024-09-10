import 'package:conversor_moedas/app/components/currency_box.dart';
import 'package:conversor_moedas/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  late final HomeController homeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 50),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 50),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 100,
                      child:
                       Text('Escolha os tipos de moedas para conversão:', textAlign: TextAlign.center,)),
                  ),
                  CurrencyBox(
                    selectedItem: homeController.toCurrency,
                    controller: toText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.toCurrency = model;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  CurrencyBox(
                    selectedItem: homeController.fromCurrency,
                    controller: fromText,
                    items: homeController.currencies,
                    onChanged: (model) {
                      setState(() {
                        homeController.fromCurrency = model;
                      });
                    },
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      homeController.converter();
                    },
                    child: Text('CONVERTER'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
