import 'package:flutter/material.dart';

class ScrollLayoutExpander extends StatelessWidget {
  const ScrollLayoutExpander(
      {required this.child,
      this.controller,
      this.padding,
      this.physics =
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      super.key});

  final Widget child;
  final ScrollController? controller;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          controller: controller ?? ScrollController(),
          padding: padding,
          physics: physics,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight - (padding?.vertical ?? 0),
              minWidth: constraints.maxWidth,
            ),
            child: child,
          ),
        ),
      );
}
