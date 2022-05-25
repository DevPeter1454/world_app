import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  final Widget desktop;
  final Widget native;
  const Layout({
    Key? key,
    required this.desktop,
    required this.native,
  }) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > 850) {
        return widget.desktop;
      }else{
        return widget.native;
      }
    })));
  }
}
