import 'package:flutter/material.dart';

class Accordion extends StatefulWidget {
  final String title;
  final Widget content;
  final double expandHeight;
  final Widget? leading;

  Accordion(
      {required this.title,
      required this.content,
      this.expandHeight = 200,
      this.leading = null});
  @override
  _AccordionState createState() => _AccordionState();
}

class _AccordionState extends State<Accordion> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      child: Column(children: [
        ListTile(
          title: Text(widget.title),
          onTap: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
          leading: widget.leading,
          trailing:
              Icon(isVisible ? Icons.arrow_drop_up : Icons.arrow_drop_down),
        ),
        isVisible
            ? Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                height: widget.expandHeight,
                alignment: Alignment.center,
                child: widget.content,
              )
            : Container()
      ]),
    );
  }
}
