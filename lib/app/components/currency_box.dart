import 'package:conversor_moedas/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel model) onChanged;

  const CurrencyBox({
    super.key,
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton<CurrencyModel>(
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              value: selectedItem,
              isExpanded: true,
              items: items.map((CurrencyModel e) {
                return DropdownMenuItem<CurrencyModel>(
                  value: e,
                  child: Text(e.name),
                );
              }).toList(),
              onChanged: (CurrencyModel? model) {
                if (model != null) {
                  onChanged(model);
                }
              },
            ),
          ),
        ),
        SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
