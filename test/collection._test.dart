import 'package:collection/collection.dart';

import 'package:dart_lodash/dart_lodash.dart';
import 'package:test/test.dart';

void main() {
  Function listEquals = const ListEquality().equals;
  Function listDeepEquals = const DeepCollectionEquality().equals;

  const testArrayAlpha = ['a', 'b', 'c', 'd', 'e', 'f'];
  const testArrayAlpha2 = ['g', 'h', 'i'];
  const testArrayDyn = [null, 0, 1, false, true, '', 'a', 0.0, 1.0, double.nan];

  group('Collection -', () {
    test('every', () {
      expect(lo.every([1, 3, 5], (int x) => x.isOdd), isTrue);
      expect(lo.every([1, 3, 5, 6], (int x) => x.isOdd), isFalse);
    });

    test('filter', () {
      expect(
        lo.filter([1, 2, 3, 4], (int i, _, __) => i.isEven),
        orderedEquals([2, 4]),
      );
    });

    test('find', () {
      expect(
        lo.find([1, 2, 3, 4, 5], (int i, _, __) => i.isEven),
        equals(2),
      );
    });

    test('findLast', () {
      expect(
        lo.findLast([1, 2, 3, 4, 5], (int i, _, __) => i.isEven),
        equals(4),
      );
    });

    test('flatMap', () {
      expect(
        lo.flatMap([1, 2], (int i, _, __) => [i, i]),
        orderedEquals([1, 1, 2, 2]),
      );
    });

    test('forEach', () {
      final responses = <int>[];

      lo.forEach([1, 2, 3, 4], (int x, _, __) {
        responses.add(x);
        return true;
      });
      expect(responses, orderedEquals([1, 2, 3, 4]));

      final responses2 = <int>[];

      lo.forEach([1, 2, 3, 4], (int x, _, __) {
        responses2.add(x);
        return x.isOdd;
      });
      expect(responses2, orderedEquals([1, 2]));
    });

    test('forEachRight', () {
      final responses = <int>[];

      lo.forEachRight([1, 2, 3, 4], (int x, _, __) {
        responses.add(x);
        return true;
      });
      expect(responses, orderedEquals([4, 3, 2, 1]));

      final responses2 = <int>[];

      lo.forEachRight([1, 2, 3, 4], (int x, _, __) {
        responses2.add(x);
        return x.isEven;
      });
      expect(responses2, orderedEquals([4, 3]));
    });
  });
}
