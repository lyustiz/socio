import 'package:flutter/material.dart';

Future<bool?> appDialog(context, String title, List<Widget> content,
    {String action = 'Ok', bool active = true}) async {
  return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: Text(title),
            content: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: content)),
            actions: <Widget>[
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green)),
                  onPressed: () => active ? Navigator.pop(context, true) : null,
                  child: Text(action)),
            ],
          ));
}
