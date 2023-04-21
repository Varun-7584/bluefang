import 'package:flutter/material.dart';

class LifeCycleManager extends StatefulWidget {
  final Widget child;
  const LifeCycleManager({required Key key, required this.child})
      : super(key: key);
  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Timer.periodic(const Duration(seconds: 5), (timer) {
    //   getIt<IBluetoothRepository>().start();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
