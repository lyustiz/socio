import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? body;
  final VoidCallback? onTap;
  final Color color;
  const HomeButton(
      {Key? key,
      required this.icon,
      required this.title,
      this.body,
      this.onTap,
      this.color = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: this.onTap,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
            width: double.infinity,
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Text(
                      this.title.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                      color: this.color,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: double.infinity,
                    padding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20)),
                    ),
                    child: this.body,
                  )
                ],
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Theme.of(context).colorScheme.secondary,
                          Theme.of(context).colorScheme.secondaryVariant
                        ],
                      )),
                  child: Icon(
                    this.icon,
                    size: 75,
                    color: Colors.white,
                  ),
                ),
              )
            ])
            /* ListTile(
            contentPadding: EdgeInsets.all(3),
            leading: Icon(this.icon, size: 80),
            title: */
            ));
  }
}
