import 'dart:math';

// import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../lib/services/coolor.dart';

// class _Random extends Mock implements Random {}

void main() {
  test('Test if random is generating random colors', () {
    // final _random = _Random();

    final _coolor = Coolor(random: Random());

    // when(_random.nextInt(255)).thenReturn(1);

    final _color = _coolor.randomColor();

    expect(_color.red, isA<int>());
    expect(_color.green, isA<int>());
    expect(_color.blue, isA<int>());
  });
}
