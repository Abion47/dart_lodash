import 'dart:collection';

import 'package:collection/collection.dart';

import 'package:dart_lodash/dart_lodash.dart';
import 'package:dart_lodash/src/lang/is_equal.dart';
import 'package:test/test.dart';

void main() {
  Function listEquals = const ListEquality().equals;
  Function listDeepEquals = const DeepCollectionEquality().equals;
  Function mapEquals = const MapEquality().equals;

  const testArrayAlpha = ['a', 'b', 'c', 'd', 'e', 'f'];
  const testArrayAlpha2 = ['g', 'h', 'i'];
  const testArrayDyn = [null, 0, 1, false, true, '', 'a', 0.0, 1.0, double.nan];

  group('Array -', () {
    test('chunk', () {
      final result = lo.chunk(testArrayAlpha, 2);
      expect(
        listDeepEquals(
          result,
          [
            ['a', 'b'],
            ['c', 'd'],
            ['e', 'f']
          ],
        ),
        isTrue,
      );

      final result2 = lo.chunk(testArrayAlpha, 4);
      expect(
        listDeepEquals(
          result2,
          [
            ['a', 'b', 'c', 'd'],
            ['e', 'f']
          ],
        ),
        isTrue,
      );
    });

    test('compact', () {
      final result = lo.compact(testArrayDyn);
      expect(listEquals(result, [1, true, 'a', 1.0]), isTrue);

      final result2 = lo.compact(testArrayAlpha);
      expect(listEquals(result2, testArrayAlpha), isTrue);
    });

    test('concat', () {
      final result = lo.concat(testArrayAlpha, testArrayAlpha2);
      expect(
        listEquals(result, ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']),
        isTrue,
      );
    });

    test('difference', () {
      final list = ['e', 'f', 'g', 'h'];
      final result = lo.difference(testArrayAlpha, list);
      expect(listEquals(result, ['a', 'b', 'c', 'd']), isTrue);
    });

    test('differenceWith', () {
      final list = ['e', 'F', 'g', 'h'];

      final result = lo.differenceWith(testArrayAlpha, list, lo.isEqual);
      expect(listEquals(result, ['a', 'b', 'c', 'd', 'f']), isTrue);

      final result2 = lo.differenceWith(
        testArrayAlpha,
        list,
        (String a, String b) => a.toLowerCase() == b.toLowerCase(),
      );
      expect(listEquals(result2, ['a', 'b', 'c', 'd']), isTrue);
    });

    test('drop', () {
      final result = lo.drop(testArrayAlpha);
      expect(listEquals(result, ['b', 'c', 'd', 'e', 'f']), isTrue);

      final result2 = lo.drop(testArrayAlpha, 3);
      expect(listEquals(result2, ['d', 'e', 'f']), isTrue);

      final result3 = lo.drop(testArrayAlpha, 6);
      expect(listEquals(result3, []), isTrue);

      final result4 = lo.drop(testArrayAlpha, 7);
      expect(listEquals(result4, []), isTrue);

      expect(
        () => lo.drop(testArrayAlpha, -1),
        throwsA(isA<ArgumentError>()),
      );
    });

    test('dropRight', () {
      final result = lo.dropRight(testArrayAlpha);
      expect(listEquals(result, ['a', 'b', 'c', 'd', 'e']), isTrue);

      final result2 = lo.dropRight(testArrayAlpha, 3);
      expect(listEquals(result2, ['a', 'b', 'c']), isTrue);

      final result3 = lo.dropRight(testArrayAlpha, 6);
      expect(listEquals(result3, []), isTrue);

      final result4 = lo.dropRight(testArrayAlpha, 7);
      expect(listEquals(result4, []), isTrue);

      expect(() => lo.drop(testArrayAlpha, -1), throwsArgumentError);
    });

    test('dropRightWhile', () {
      final list = ['a', 'b', 'C', 'D'];

      final result =
          lo.dropRightWhile(list, (String c, _, __) => c.toUpperCase() == c);
      expect(listEquals(result, ['a', 'b']), isTrue);

      final result2 = lo.dropRightWhile(list, (String c, _, __) => true);
      expect(listEquals(result2, []), isTrue);

      final result3 = lo.dropRightWhile(list, (_, i, __) => i >= 3);
      expect(listEquals(result3, ['a', 'b', 'C']), isTrue);
    });

    test('dropWhile', () {
      final list = ['a', 'b', 'C', 'D'];

      final result =
          lo.dropWhile(list, (String c, _, __) => c.toLowerCase() == c);
      expect(listEquals(result, ['C', 'D']), isTrue);

      final result2 = lo.dropWhile(list, (String c, _, __) => true);
      expect(listEquals(result2, []), isTrue);

      final result3 = lo.dropWhile(list, (_, i, __) => i < 3);
      expect(listEquals(result3, ['D']), isTrue);
    });

    test('fill', () {
      var list = [0, 1, 2, 3, 4];

      final result = lo.fill(list, 2, 1);
      expect(listEquals(result, [0, 2, 2, 2, 2]), isTrue);
      expect(list, equals(result));

      list = [0, 1, 2, 3, 4];
      final result2 = lo.fill(list, 5, 1, 3);
      expect(listEquals(result2, [0, 5, 5, 3, 4]), isTrue);

      list = [0, 1, 2, 3, 4];
      final result3 = lo.fill(list, 5, 1, 1);
      expect(listEquals(result3, [0, 1, 2, 3, 4]), isTrue);

      expect(() => lo.fill(list, 5, 2, 1), throwsArgumentError);
    });
  });

  test('findIndex', () {
    final list = ['a', 'b', 'c', 'c', 'd'];
    final result = lo.findIndex(list, (c) => c == 'c');
    expect(result, equals(2));

    final result2 = lo.findIndex(list, (c) => c == 'c', 3);
    expect(result2, equals(3));

    final result3 = lo.findIndex(list, (c) => c == 'g');
    expect(result3, equals(-1));
  });

  test('findLastIndex', () {
    final list = ['a', 'b', 'c', 'c', 'd'];
    final result = lo.findLastIndex(list, (c) => c == 'c');
    expect(result, equals(3));

    final result2 = lo.findLastIndex(list, (c) => c == 'c', 2);
    expect(result2, equals(2));

    final result3 = lo.findLastIndex(list, (c) => c == 'g');
    expect(result3, equals(-1));
  });

  test('first', () {
    expect(lo.first(testArrayAlpha), equals(lo.head(testArrayAlpha)));
  });

  test('flatten', () {
    final list = [
      1,
      [
        2,
        [
          3,
          [4]
        ],
        5
      ]
    ];

    final result = lo.flatten(list);
    expect(
        listDeepEquals(result, [
          1,
          2,
          [
            3,
            [4]
          ],
          5
        ]),
        isTrue);

    final result2 = lo.flatten(testArrayAlpha);
    expect(listEquals(result2, testArrayAlpha), isTrue);
  });

  test('flattenDeep', () {
    final list = [
      1,
      [
        2,
        [
          3,
          [4]
        ],
        5
      ]
    ];

    final result = lo.flattenDeep(list);
    expect(listDeepEquals(result, [1, 2, 3, 4, 5]), isTrue);

    final result2 = lo.flattenDeep(testArrayAlpha);
    expect(listEquals(result2, testArrayAlpha), isTrue);
  });

  test('flattenDepth', () {
    final list = [
      1,
      [
        2,
        [
          3,
          [4]
        ],
        5
      ]
    ];

    final result = lo.flattenDepth(list);
    expect(
        listDeepEquals(result, [
          1,
          2,
          [
            3,
            [4]
          ],
          5
        ]),
        isTrue);

    final result2 = lo.flattenDepth(list, 2);
    expect(
        listDeepEquals(result2, [
          1,
          2,
          3,
          [4],
          5
        ]),
        isTrue);

    final result3 = lo.flattenDepth(list, 3);
    expect(listDeepEquals(result3, [1, 2, 3, 4, 5]), isTrue);

    final result4 = lo.flattenDepth(testArrayAlpha, 5);
    expect(listEquals(result4, testArrayAlpha), isTrue);

    expect(() => lo.flattenDepth(list, -1), throwsArgumentError);
  });

  test('fromPairs', () {
    final list = [
      ['a', 1],
      ['b', 2]
    ];

    final result = lo.fromPairs(list);
    expect(result, isA<Map<dynamic, dynamic>>());
    expect(mapEquals(result, {'a': 1, 'b': 2}), isTrue);

    final result2 = lo.fromPairs<String, int>(list);
    expect(result2, isA<Map<String, int>>());
    expect(mapEquals(result2, {'a': 1, 'b': 2}), isTrue);

    expect(
      () => lo.fromPairs<String, int>([
        ['a', 1, 2]
      ]),
      throwsArgumentError,
    );

    expect(
      () => lo.fromPairs<String, int>([
        ['a', 1.0]
      ]),
      throwsArgumentError,
    );
  });

  test('head', () {
    final result = lo.head(testArrayAlpha);
    expect(result, equals('a'));

    final result2 = lo.head([]);
    expect(result2, isNull);
  });

  test('indexOf', () {
    final list = [1, 2, 1, 2, 1, 2];

    final result = lo.indexOf(list, 2);
    expect(result, equals(1));

    final result2 = lo.indexOf(list, 2, 2);
    expect(result2, equals(3));

    final result3 = lo.indexOf(list, 2, -1);
    expect(result3, equals(5));

    final result4 = lo.indexOf(list, 3);
    expect(result4, equals(-1));
  });

  test('initial', () {
    final result = lo.initial(testArrayAlpha);
    expect(listEquals(result, ['a', 'b', 'c', 'd', 'e']), isTrue);

    final result2 = lo.initial(['a']);
    expect(listEquals(result2, []), isTrue);

    final result3 = lo.initial([]);
    expect(listEquals(result3, []), isTrue);
  });

  test('intersection', () {
    final list = ['e', 'f', 'g', 'h'];
    final result = lo.intersection(testArrayAlpha, list);
    expect(listEquals(result, ['e', 'f']), isTrue);
  });

  test('intersectionWith', () {
    final list = ['e', 'F', 'g', 'h'];

    final result = lo.intersectionWith(testArrayAlpha, list, lo.isEqual);
    expect(listEquals(result, ['e']), isTrue);

    final result2 = lo.intersectionWith(
      testArrayAlpha,
      list,
      (String a, String b) => a.toLowerCase() == b.toLowerCase(),
    );
    expect(listEquals(result2, ['e', 'f']), isTrue);
  });

  test('join', () {
    final result = lo.join(testArrayAlpha);
    expect(result, equals('a,b,c,d,e,f'));

    final result2 = lo.join(testArrayAlpha, '~');
    expect(result2, equals('a~b~c~d~e~f'));
  });

  test('last', () {
    final result = lo.last(testArrayAlpha);
    expect(result, equals('f'));

    final result2 = lo.last([]);
    expect(result2, isNull);
  });

  test('lastIndexOf', () {
    final list = [1, 2, 1, 2, 1, 2];

    final result = lo.lastIndexOf(list, 2);
    expect(result, equals(5));

    final result2 = lo.lastIndexOf(list, 2, 4);
    expect(result2, equals(3));

    final result3 = lo.lastIndexOf(list, 2, -4);
    expect(result3, equals(1));

    final result4 = lo.lastIndexOf(list, 3);
    expect(result4, equals(-1));
  });

  test('nth', () {
    final result = lo.nth(testArrayAlpha, 2);
    expect(result, equals('c'));

    final result2 = lo.nth(testArrayAlpha, -2);
    expect(result2, equals('e'));

    expect(() => lo.nth(testArrayAlpha, 6), throwsRangeError);

    expect(() => lo.nth(testArrayAlpha, -7), throwsRangeError);
  });

  test('pull', () {
    final list = [1, 2, 1, 2, 1, 2];

    final result = lo.pull(List.from(list), 1);
    expect(result, orderedEquals([2, 2, 2]));

    final result2 = lo.pull(List.from(list), 3);
    expect(result2, orderedEquals([1, 2, 1, 2, 1, 2]));
  });

  test('pullAll', () {
    final list = [1, 2, 3, 1, 2, 3, 1, 2];

    final result = lo.pullAll(List.from(list), [1, 2]);
    expect(result, orderedEquals([3, 3]));

    final result2 = lo.pullAll(List.from(list), [1, 4]);
    expect(result2, orderedEquals([2, 3, 2, 3, 2]));
  });

  test('pullAllWith', () {
    final list = [1, 2, 3, 1, 2, 3, 1, 2];

    final result =
        lo.pullAllWith<int>(List.from(list), [4, 6], (a, b) => b ~/ 2 == a);
    expect(result, orderedEquals([1, 1, 1]));
  });

  test('pullAt', () {
    final list = ['a', 'b', 'c', 'd'];

    final removed = lo.pullAt(list, [1, 3]);
    expect(list, orderedEquals(['a', 'c']));
    expect(removed, orderedEquals(['b', 'd']));

    expect(() => lo.pullAt(list, [1, -1]), throwsRangeError);

    expect(() => lo.pullAt(list, [1, 3]), throwsRangeError);

    expect(list, orderedEquals(['a', 'c']));
  });

  test('remove', () {
    final list = [1, 2, 3, 4];

    final removed = lo.remove<int>(list, (n, _, __) => n % 2 == 0);
    expect(list, orderedEquals([1, 3]));
    expect(removed, orderedEquals([2, 4]));

    final list2 = [1, 2, 3, 4, 5, 6];
    final indices = <int>[];
    final removed2 = lo.remove<int>(list2, (n, i, _) {
      indices.add(i);
      return n % 2 == 0;
    });

    expect(list2, orderedEquals([1, 3, 5]));
    expect(removed2, orderedEquals([2, 4, 6]));
    expect(indices, orderedEquals([0, 1, 2, 3, 4, 5]));
  });

  test('reverse', () {
    final list = [1, 2, 3, 4];
    lo.reverse(list);
    expect(list, orderedEquals([4, 3, 2, 1]));

    final list2 = [1, 2, 3, 4, 5];
    lo.reverse(list2);
    expect(list2, orderedEquals([5, 4, 3, 2, 1]));

    final result = lo.reverse([]);
    expect(result, orderedEquals([]));
  });

  test('sortedIndex', () {
    final list = List.generate(100, (i) => i * 10);

    expect(lo.sortedIndex(list, 625), equals(63));
    expect(lo.sortedIndex(list, -50), equals(0));
    expect(lo.sortedIndex(list, 5000), equals(100));

    expect(lo.sortedIndex(<int>[], 10), equals(0));

    final list2 = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 5];

    expect(lo.sortedIndex(list2, 2), equals(1));
    expect(lo.sortedIndex(list2, 4), equals(13));
  });

  test('sortedIndexOf', () {
    final list = List.generate(100, (i) => i * 10);

    expect(lo.sortedIndexOf(list, 620), equals(62));
    expect(lo.sortedIndexOf(list, 0), equals(0));
    expect(lo.sortedIndexOf(list, 990), equals(99));
    expect(lo.sortedIndexOf(list, -1), equals(-1));
    expect(lo.sortedIndexOf(list, 621), equals(-1));
    expect(lo.sortedIndexOf(list, 1000), equals(-1));

    expect(lo.sortedIndexOf(<int>[], 10), equals(-1));

    final list2 = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 5];

    expect(lo.sortedIndexOf(list2, 2), equals(1));
    expect(lo.sortedIndexOf(list2, 4), equals(13));
  });

  test('sortedLastIndex', () {
    final list = List.generate(100, (i) => i * 10);

    expect(lo.sortedLastIndex(list, 625), equals(63));
    expect(lo.sortedLastIndex(list, -50), equals(0));
    expect(lo.sortedLastIndex(list, 5000), equals(100));

    expect(lo.sortedLastIndex(<int>[], 10), equals(0));

    final list2 = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 5];

    expect(lo.sortedLastIndex(list2, 2), equals(13));
    expect(lo.sortedLastIndex(list2, 4), equals(14));
  });

  test('sortedLastIndexOf', () {
    final list = List.generate(100, (i) => i * 10);

    expect(lo.sortedLastIndexOf(list, 620), equals(62));
    expect(lo.sortedLastIndexOf(list, 0), equals(0));
    expect(lo.sortedLastIndexOf(list, 990), equals(99));
    expect(lo.sortedLastIndexOf(list, -1), equals(-1));
    expect(lo.sortedLastIndexOf(list, 621), equals(-1));
    expect(lo.sortedLastIndexOf(list, 1000), equals(-1));

    expect(lo.sortedLastIndexOf(<int>[], 10), equals(-1));

    final list2 = [1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 5];

    expect(lo.sortedLastIndexOf(list2, 2), equals(12));
    expect(lo.sortedLastIndexOf(list2, 4), equals(13));
  });

  test('sortedUniq', () {
    final list = [0, 1, 1, 2];

    expect(lo.sortedUniq(list), orderedEquals([0, 1, 2]));

    expect(lo.sortedUniq([]), orderedEquals([]));
  });

  test('tail', () {
    expect(lo.tail(testArrayAlpha), orderedEquals(['b', 'c', 'd', 'e', 'f']));

    expect(lo.tail([]), orderedEquals([]));
  });

  test('take', () {
    final list = [1, 2, 3];

    expect(lo.take(list, 0), orderedEquals([]));
    expect(lo.take(list, 1), orderedEquals([1]));
    expect(lo.take(list, 2), orderedEquals([1, 2]));
    expect(lo.take(list, 5), orderedEquals([1, 2, 3]));

    expect(lo.take([], 1), orderedEquals([]));
  });

  test('takeRight', () {
    final list = [1, 2, 3];

    expect(lo.takeRight(list, 0), orderedEquals([]));
    expect(lo.takeRight(list, 1), orderedEquals([3]));
    expect(lo.takeRight(list, 2), orderedEquals([2, 3]));
    expect(lo.takeRight(list, 5), orderedEquals([1, 2, 3]));

    expect(lo.takeRight([], 1), orderedEquals([]));
  });

  test('takeRightWhile', () {
    final list = [1, 2, 4];

    expect(
      lo.takeRightWhile<int>(list, (i, _, __) => i.isEven),
      orderedEquals([2, 4]),
    );

    expect(
      lo.takeRightWhile<int>(list, (_, i, __) => i.isEven),
      orderedEquals([4]),
    );

    expect(
      lo.takeRightWhile<int>([], (i, _, __) => i.isEven),
      orderedEquals([]),
    );
  });

  test('takeWhile', () {
    final list = [2, 4, 5];

    expect(
      lo.takeWhile<int>(list, (i, _, __) => i.isEven),
      orderedEquals([2, 4]),
    );

    expect(
      lo.takeWhile<int>(list, (_, i, __) => i.isEven),
      orderedEquals([2]),
    );

    expect(
      lo.takeWhile<int>([], (i, _, __) => i.isEven),
      orderedEquals([]),
    );
  });

  test('union', () {
    expect(lo.union([1, 2, 3], [2, 3, 4]), orderedEquals([1, 2, 3, 4]));
    expect(lo.union([1, 2], [3, 4]), orderedEquals([1, 2, 3, 4]));
  });

  test('unionWith', () {
    final list = ['e', 'F', 'g', 'h'];

    final result = lo.unionWith(testArrayAlpha, list, lo.isEqual);
    expect(
      result,
      orderedEquals(['a', 'b', 'c', 'd', 'e', 'f', 'F', 'g', 'h']),
    );

    final result2 = lo.unionWith(
      testArrayAlpha,
      list,
      (String a, String b) => a.toLowerCase() == b.toLowerCase(),
    );
    expect(
      result2,
      orderedEquals(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']),
    );
  });

  test('uniq', () {
    expect(lo.uniq([1, 2, 3, 2]), orderedEquals([1, 2, 3]));
    expect(lo.uniq([]), orderedEquals([]));
  });

  test('uniqWith', () {
    final list = ['f', 'F', 'g', 'h'];

    expect(lo.uniqWith(list, lo.isEqual), orderedEquals(['f', 'F', 'g', 'h']));

    expect(
      lo.uniqWith(
        list,
        (String a, String b) => a.toLowerCase() == b.toLowerCase(),
      ),
      orderedEquals(['f', 'g', 'h']),
    );
  });

  test('unzip', () {
    final list = [
      ['a', 'b'],
      [1, 2],
      [true, false]
    ];

    final result = lo.unzip(list);
    expect(
      listDeepEquals(result, [
        ['a', 1, true],
        ['b', 2, false]
      ]),
      isTrue,
    );

    final result2 = lo.unzip(result);
    expect(listDeepEquals(result2, list), isTrue);
  });

  test('without', () {
    expect(lo.without([1, 2, 3], 2), orderedEquals([1, 3]));
  });

  test('withoutAll', () {
    expect(lo.withoutAll([1, 2, 3], [2, 3]), orderedEquals([1]));
  });

  test('xor', () {
    expect(lo.xor([0, 1, 2], [1, 2, 3]), orderedEquals([0, 3]));
  });

  test('xorWith', () {
    expect(
      lo.xorWith(['a', 'b', 'c'], ['B', 'C', 'D'], lo.isEqual),
      orderedEquals(['a', 'b', 'c', 'B', 'C', 'D']),
    );

    expect(
      lo.xorWith(
        ['a', 'b', 'c'],
        ['B', 'C', 'D'],
        (String a, String b) => a.toLowerCase() == b.toLowerCase(),
      ),
      orderedEquals(['a', 'D']),
    );
  });

  test('zip', () {
    final list = [
      ['a', 'b'],
      [1, 2],
      [true, false]
    ];

    final result = lo.zip(list);
    expect(
      listDeepEquals(result, [
        ['a', 1, true],
        ['b', 2, false]
      ]),
      isTrue,
    );
  });

  test('zipObject', () {
    final result = lo.zipObject(['a', 'b', 'c'], [1, 2, 3]);
    expect(mapEquals(result, {'a': 1, 'b': 2, 'c': 3}), isTrue);
  });
}
