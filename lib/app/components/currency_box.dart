import 'package:conversor_moedas/app/model/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurrencyBox extends StatelessWidget {
  final List<CurrencyModel> items;
  final TextEditingController controllerText;
  final CurrencyModel selectedItem;
  final void Function(CurrencyModel? model)? onChanged;

  const CurrencyBox(
      {super.key,
      required this.items,
      required this.controllerText,
      this.onChanged,
      required this.selectedItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: SizedBox(
              height: 65,
              child: DropdownButton<CurrencyModel>(
                  value: selectedItem,
                  iconEnabledColor: Colors.amber,
                  isExpanded: true,
                  underline: Container(
                    height: 1,
                    color: Colors.amber,
                  ),
                  items: items
                      .map((e) => DropdownMenuItem(
                            child: Text(e.name),
                            value: e,
                          ))
                      .toList(),
                  onChanged: onChanged),
            )),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: controllerText,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber),
                )),
          ),
        )
      ],
    );
  }
}
