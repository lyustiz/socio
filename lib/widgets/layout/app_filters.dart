import 'package:flutter/material.dart';

Future<bool?> appFilters(context, String title, List<Widget> content,
    {String action = 'Ok', bool accept = false, bool active = true}) async {
  return await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            backgroundColor: Colors.blueAccent,
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
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
              accept
                  ? ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.green)),
                      onPressed: () =>
                          active ? Navigator.pop(context, true) : null,
                      child: Text(action))
                  : const Text(''),
            ],
          ));
}
