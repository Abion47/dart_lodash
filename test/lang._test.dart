import 'package:collection/collection.dart';

import 'package:dart_lodash/dart_lodash.dart';
import 'package:test/test.dart';

void main() {
  Function listEquals = const ListEquality().equals;
  Function listDeepEquals = const DeepCollectionEquality().equals;

  const testArrayAlpha = ['a', 'b', 'c', 'd', 'e', 'f'];
  const testArrayAlpha2 = ['g', 'h', 'i'];
  const testArrayDyn = [null, 0, 1, false, true, '', 'a', 0.0, 1.0, double.nan];

  group('Lang -', () {
    test('isEqual', () {
      final list = ['g', 'h', 'i'];
      final result = lo.isEqual(list, testArrayAlpha);
      expect(result, isFalse);

      final result2 = lo.isEqual(list, testArrayAlpha2);
      expect(result2, isTrue);

      expect(list == testArrayAlpha2, isFalse);
    });
  });
}
