import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FlutterBlueInjectableModule {
  FlutterBluePlus get flutterblue => FlutterBluePlus.instance;
}
