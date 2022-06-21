import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer(
      {Key? key,
      this.margin = const EdgeInsets.all(8),
      this.padding = const EdgeInsets.all(10),
      this.width,
      this.height,
      this.alignment,
      this.child,
      this.borderRadius = 20,
      this.variant = 'primary'})
      : super(key: key);

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final double? borderRadius;
  final String? variant;

  @override
  Widget build(BuildContext context) {
    Map<String, List<Color>> colorVariant = {
      'primary': [
        Theme.of(context).colorScheme.primaryVariant,
        Theme.of(context).colorScheme.primary,
      ],
      'primaryVariant': [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.primaryVariant,
      ],
      'secondary': [
        Theme.of(context).colorScheme.secondary,
        Theme.of(context).colorScheme.secondaryVariant,
      ],
    };

    return Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            colors: colorVariant[variant]!,
          ),
        ),
        child: child);
  }
}
