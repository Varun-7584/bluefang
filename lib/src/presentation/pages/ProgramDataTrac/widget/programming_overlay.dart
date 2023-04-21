import 'package:bluefang/package/bluefang_ui/bluefang_ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConnectingToBluetoothOverlay extends StatelessWidget {
  final bool isSubmitting;
  final Widget buttonWidget;
  const ConnectingToBluetoothOverlay({
    Key? key,
    required this.isSubmitting,
    required this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSubmitting,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSubmitting ? kcWhite : Colors.transparent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Visibility(
          visible: isSubmitting,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Lottie.asset(
                    'assets/lottie/bluetooth_animation.json',
                  ),
                  buttonWidget
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
