import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final Widget? drawer;
  final PreferredSizeWidget? titleBar;
  final String? color;
  final FloatingActionButton? floatingActionButton;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  const AppScaffold(
      {Key? key,
      required this.child,
      this.drawer,
      this.titleBar,
      this.bottomSheet,
      this.floatingActionButton,
      this.bottomNavigationBar,
      this.color = 'orange'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, BoxDecoration> background = {
      'orange': BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            alignment: Alignment.topCenter,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Theme.of(context).colorScheme.primaryVariant,
              Theme.of(context).colorScheme.primary,
            ],
          )),
      'white': BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              alignment: Alignment.topCenter,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.9), BlendMode.difference)),
          color: Colors.white),
      'purple': BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            alignment: Alignment.topCenter,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.secondaryVariant,
            ],
          )),
    };

    return Container(
      decoration: background[this.color],
      child: SafeArea(
        child: Scaffold(
            appBar: this.titleBar,
            backgroundColor: Colors.transparent,
            body: SafeArea(child: this.child),
            drawer: this.drawer,
            bottomSheet: this.bottomSheet,
            floatingActionButton: this.floatingActionButton,
            bottomNavigationBar: this.bottomNavigationBar),
      ),
    );
  }
}
