import 'package:flutter/material.dart';

class RerenderWidget extends StatefulWidget {
  const RerenderWidget({super.key, required this.child});

  final Widget child;

  static void rerenderApp(BuildContext context) {
    context.findAncestorStateOfType<RerenderWidgetState>()?.rerenderApp();
  }

  @override
  RerenderWidgetState createState() => RerenderWidgetState();
}

class RerenderWidgetState extends State<RerenderWidget> {
  Key key = UniqueKey();

  void rerenderApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
