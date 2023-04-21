import 'package:bluefang/src/domain/core/failures.dart';
import 'package:bluefang/src/domain/logging/logging_value_objects.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group('test logging value object creation', () {
    test('fails when wrong message type is passed', () {
      final MessageType messageType = MessageType.fromString('MOD_L');
      final messageValue = messageType.getValueOrError();
      expect(messageValue, const matcher.TypeMatcher<InvalidMessageType>());
    });
    test('Pass when right message type MOD_V is passed with .fromString method',
        () {
      final MessageType messageType = MessageType.fromString('MOD_V');
      final value = messageType.getOrCrash();
      expect(value, "MOD_V");
    });
    test('Pass when table name is given for site', () {
      final MessageType messageType = MessageType.fromTableName('Site');
      final value = messageType.getOrCrash();
      expect(value, "MOD_T");
    });

    test('Pass when right message type MOD_V is passed', () {
      final MessageType messageType = MessageType(MessageTypeEnum.MOD_D);
      final value = messageType.getOrCrash();
      expect(value, "MOD_D");
    });
  });
}
