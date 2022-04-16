library dart_lodash;

import './array/chunk.dart' as array;
import './array/compact.dart' as array;
import './array/concat.dart' as array;
import './array/difference.dart' as array;
import './array/difference_with.dart' as array;
import './array/drop.dart' as array;
import './array/drop_right.dart' as array;
import './array/drop_right_while.dart' as array;
import './array/drop_while.dart' as array;
import './array/fill.dart' as array;
import './array/find_index.dart' as array;
import './array/find_last_index.dart' as array;
import './array/flatten.dart' as array;
import './array/flatten_deep.dart' as array;
import './array/flatten_depth.dart' as array;
import './array/from_pairs.dart' as array;
import './array/head.dart' as array;
import './array/index_of.dart' as array;
import './array/initial.dart' as array;
import './array/intersection.dart' as array;
import './array/intersection_with.dart' as array;
import './array/join.dart' as array;
import './array/last.dart' as array;
import './array/last_index_of.dart' as array;
import './array/nth.dart' as array;
import './array/pull.dart' as array;
import './array/pull_all.dart' as array;
import './array/pull_all_with.dart' as array;
import './array/pull_at.dart' as array;
import './array/remove.dart' as array;
import './array/reverse.dart' as array;
import './array/slice.dart' as array;
import './array/sorted_index.dart' as array;
import './array/sorted_index_of.dart' as array;
import './array/sorted_last_index.dart' as array;
import './array/sorted_last_index_of.dart' as array;
import './array/sorted_uniq.dart' as array;
import './array/tail.dart' as array;
import './array/take.dart' as array;
import './array/take_right.dart' as array;
import './array/take_right_while.dart' as array;
import './array/take_while.dart' as array;
import './array/union.dart' as array;
import './array/union_with.dart' as array;
import './array/uniq.dart' as array;
import './array/uniq_with.dart' as array;
import './array/unzip.dart' as array;
import './array/without.dart' as array;
import './array/without_all.dart' as array;
import './array/xor.dart' as array;
import './array/xor_with.dart' as array;
import './array/zip_object.dart' as array;

import './collection/every.dart' as collection;
import './collection/filter.dart' as collection;
import './collection/find.dart' as collection;
import './collection/find_last.dart' as collection;
import './collection/flat_map.dart' as collection;
// import './collection/flat_map_deep.dart' as collection;
// import './collection/flat_map_depth.dart' as collection;
import './collection/for_each.dart' as collection;
import './collection/for_each_right.dart' as collection;
import './collection/group_by.dart' as collection;
// import './collection/includes.dart' as collection;
// import './collection/invoke_map.dart' as collection;
// import './collection/key_by.dart' as collection;
// import './collection/map.dart' as collection;
// import './collection/order_by.dart' as collection;
// import './collection/partition.dart' as collection;
// import './collection/reduce.dart' as collection;
// import './collection/reduce_right.dart' as collection;
// import './collection/reject.dart' as collection;
// import './collection/sample.dart' as collection;
// import './collection/sample_size.dart' as collection;
// import './collection/shuffle.dart' as collection;
// import './collection/size.dart' as collection;
// import './collection/some.dart' as collection;
// import './collection/sort_by.dart' as collection;

import './lang/is_equal.dart' as lang;

import './util/identity.dart' as util;

class Lodash {
  const Lodash();

  /****************************************************************************/
  /*********************** Array **********************************************/
  /****************************************************************************/

  /// Creates an array of elements split into groups the length of [size]. If
  /// array can't be split evenly, the final chunk will be the remaining
  /// elements.
  ///
  /// Returns the new array of filtered values.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.chunk(['a', 'b', 'c', 'd'], 2);
  /// // => [['a', 'b'], ['c', 'd']]
  ///
  /// lo.chunk(['a', 'b', 'c', 'd'], 3);
  /// // => [['a', 'b', 'c'], ['d']]
  /// ```
  List<List<T>> chunk<T>(List<T> list, [int size = 1]) =>
      array.chunk(list, size);

  /// Creates an array with all falsey values removed. The values `false`, `null`,
  /// `0`, `""`, and `double.nan` are falsey.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.compact([0, 1, false, 2, '', 3]);
  /// // => [1, 2, 3]
  /// ```
  List<T> compact<T>(List<T?> list) => array.compact(list);

  /// Creates a new array concatenating array with any additional arrays and/or
  /// values.
  ///
  /// Returns the new concatenated array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = [1];
  /// var other = lo.concat(array, [2, 3, 4]);
  ///
  /// console.log(other);
  /// // => [1, 2, 3, 4]
  ///
  /// console.log(array);
  /// // => [1]
  /// ```
  List<T> concat<T>(List<T> list, List<T> other) => array.concat(list, other);

  /// Creates an array of array values not included in the other given arrays
  /// using [SameValueZero](https://262.ecma-international.org/7.0/#sec-samevaluezero)
  /// for equality comparisons. The order and references of result values are
  /// determined by the first array.
  ///
  /// **Note:** Unlike `lo.pullAll`, this method returns a new array.
  ///
  /// Returns the new array of filtered values.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.difference([2, 1], [2, 3]);
  /// // => [1]
  /// ```
  List<T> difference<T>(List<T> list, List<T> other) =>
      array.difference(list, other);

  // differenceBy() {}

  /// This method is like [difference] except that it accepts comparator which
  /// is invoked to compare elements of array to values. The order and
  /// references of result values are determined by the first array.
  /// The comparator is invoked with two arguments: (arrVal, othVal).
  ///
  /// **Note:** Unlike [pullAllWith], this method returns a new array.
  ///
  /// Returns the new array of filtered values.
  ///
  /// Example:
  ///
  /// ```dart
  /// var objects = [{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }];
  ///
  /// lo.differenceWith(objects, [{ 'x': 1, 'y': 2 }], lo.isEqual);
  /// // => [{ 'x': 2, 'y': 1 }]
  /// ```
  List<T> differenceWith<T>(
    List<T> a,
    List<T> b,
    bool Function(T a, T b) comparator,
  ) =>
      array.differenceWith(a, b, comparator);

  /// Creates a slice of array with [n] elements dropped from the beginning.
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.drop([1, 2, 3]);
  /// // => [2, 3]
  ///
  /// lo.drop([1, 2, 3], 2);
  /// // => [3]
  ///
  /// lo.drop([1, 2, 3], 5);
  /// // => []
  ///
  /// lo.drop([1, 2, 3], 0);
  /// // => [1, 2, 3]
  /// ```
  List<T> drop<T>(List<T> list, [int n = 1]) => array.drop(list, n);

  /// Creates a slice of array with n elements dropped from the end.
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.dropRight([1, 2, 3]);
  /// // => [1, 2]
  ///
  /// lo.dropRight([1, 2, 3], 2);
  /// // => [1]
  ///
  /// lo.dropRight([1, 2, 3], 5);
  /// // => []
  ///
  /// lo.dropRight([1, 2, 3], 0);
  /// // => [1, 2, 3]
  /// ```
  List<T> dropRight<T>(List<T> list, [int n = 1]) => array.dropRight(list, n);

  /// Creates a slice of array excluding elements dropped from the end. Elements
  /// are dropped until predicate returns false. The predicate is invoked with
  /// three arguments: (value, index, array).
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney',  'active': true },
  ///   { 'user': 'fred',    'active': false },
  ///   { 'user': 'pebbles', 'active': false }
  /// ];
  ///
  /// lo.dropRightWhile(users, (o, _, __) => !o['active']);
  /// // => objects for ['barney']
  /// ```
  List<T> dropRightWhile<T>(
    List<T> list,
    bool Function(T value, int index, List<T> list) predicate,
  ) =>
      array.dropRightWhile(list, predicate);

  /// Creates a slice of array excluding elements dropped from the beginning.
  /// Elements are dropped until predicate returns false. The predicate is
  /// invoked with three arguments: (value, index, array).
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney',  'active': false },
  ///   { 'user': 'fred',    'active': false },
  ///   { 'user': 'pebbles', 'active': true }
  /// ];
  ///
  /// lo.dropWhile(users, (o) => !o['active']);
  /// // => objects for ['pebbles']
  /// ```
  List<T> dropWhile<T>(
    List<T> list,
    bool Function(T value, int index, List<T> list) predicate,
  ) =>
      array.dropWhile(list, predicate);

  /// Fills elements of array with value from start up to, but not including,
  /// end.
  ///
  /// **Note:** This method mutates array.
  ///
  /// Returns array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = <dynamic>[1, 2, 3];
  ///
  /// lo.fill(array, 'a');
  /// console.log(array);
  /// // => ['a', 'a', 'a']
  ///
  /// lo.fill(Array(3), 2);
  /// // => [2, 2, 2]
  ///
  /// lo.fill([4, 6, 8, 10], '*', 1, 3);
  /// // => [4, '*', '*', 10]
  /// ```
  List<T> fill<T>(List<T> list, T value, int start, [int? end]) =>
      array.fill(list, value, start, end);

  /// This method is like [find] except that it returns the index of the first
  /// element predicate returns true for instead of the element itself.
  ///
  /// Returns the index of the found element, else -1.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney',  'active': false },
  ///   { 'user': 'fred',    'active': false },
  ///   { 'user': 'pebbles', 'active': true }
  /// ];
  ///
  /// lo.findIndex(users, (o) => o['user'] == 'barney');
  /// // => 0
  /// ```
  int findIndex<T>(
    List<T> list,
    bool Function(T) predicate, [
    int fromIndex = 0,
  ]) =>
      array.findIndex(list, predicate, fromIndex);

  /// This method is like [findIndex] except that it iterates over elements of
  /// collection from right to left.
  ///
  /// Returns the index of the found element, else -1.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney',  'active': true },
  ///   { 'user': 'fred',    'active': false },
  ///   { 'user': 'pebbles', 'active': false }
  /// ];
  ///
  /// lo.findLastIndex(users, (o) => o['user'] == 'pebbles');
  /// // => 2
  /// ```
  int findLastIndex<T>(
    List<T> list,
    bool Function(T) predicate, [
    int? fromIndex,
  ]) =>
      array.findLastIndex(list, predicate, fromIndex);

  /// An alias for [head].
  T? first<T>(List<T> list) => head(list);

  /// Flattens array a single level deep.
  ///
  /// Returns the new flattened array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.flatten([1, [2, [3, [4]], 5]]);
  /// // => [1, 2, [3, [4]], 5]
  /// ```
  List<dynamic> flatten(List<dynamic> list) => array.flatten(list);

  /// Recursively flattens array.
  ///
  /// Returns the new flattened array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.flattenDeep([1, [2, [3, [4]], 5]]);
  /// // => [1, 2, 3, 4, 5]
  /// ```
  List<dynamic> flattenDeep(List<dynamic> list) => array.flattenDeep(list);

  /// Recursively flatten array up to [depth] times.
  ///
  /// Returns the new flattened array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = [1, [2, [3, [4]], 5]];
  ///
  /// lo.flattenDepth(array, 1);
  /// // => [1, 2, [3, [4]], 5]
  ///
  /// lo.flattenDepth(array, 2);
  /// // => [1, 2, 3, [4], 5]
  /// ```
  List<dynamic> flattenDepth(List<dynamic> list, [int depth = 1]) =>
      array.flattenDepth(list, depth);

  /// The inverse of [toPairs]; this method returns an object composed from
  /// key-value pairs.
  ///
  /// **Note:** The generic types of the returned object will be
  /// `<dynamic, dynamic>` unless explicitly specified otherwise.
  ///
  /// Returns the new object.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.fromPairs([['a', 1], ['b', 2]]);
  /// // => { 'a': 1, 'b': 2 }
  /// ```
  Map<TKey, TValue> fromPairs<TKey, TValue>(List<List<dynamic>> pairs) =>
      array.fromPairs(pairs);

  /// Gets the first element of array.
  ///
  /// Returns the first element of array or null if array is empty.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.head([1, 2, 3]);
  /// // => 1
  ///
  /// lo.head([]);
  /// // => null
  /// ```
  T? head<T>(List<T> list) => array.head(list);

  /// Gets the index at which the first occurrence of [value] is found in array
  /// using [SameValueZero](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
  /// for equality comparisons. If [fromIndex] is negative, it's used as the
  /// offset from the end of array.
  ///
  /// Returns the index of the matched value, else -1.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.indexOf([1, 2, 1, 2], 2);
  /// // => 1
  ///
  /// // Search from the `fromIndex`.
  /// lo.indexOf([1, 2, 1, 2], 2, 2);
  /// // => 3
  /// ```
  int indexOf<T>(List<T> list, T value, [int fromIndex = 0]) =>
      array.indexOf(list, value, fromIndex);

  /// Gets all but the last element of array.
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.initial([1, 2, 3]);
  /// // => [1, 2]
  /// ```
  List<T> initial<T>(List<T> list) => array.initial(list);

  /// Creates an array of unique values that are included in all given arrays
  /// using [SameValueZero](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
  /// for equality comparisons. The order and references of result values are
  /// determined by the first array.
  ///
  /// Returns the new array of intersecting values.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.intersection([2, 1], [2, 3]);
  /// // => [2]
  /// ```
  List<T> intersection<T>(List<T> a, List<T> b) => array.intersection(a, b);

  // intersectionBy() {}

  /// This method is like [intersection] except that it accepts [comparator] which
  /// is invoked to compare elements of arrays. The order and references of
  /// result values are determined by the first array. The comparator is invoked
  /// with two arguments: (arrVal, othVal).
  ///
  /// Returns the new array of intersecting values.
  ///
  /// Example:
  ///
  /// ```dart
  /// var objects = [{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }];
  /// var others = [{ 'x': 1, 'y': 1 }, { 'x': 1, 'y': 2 }];
  ///
  /// lo.intersectionWith(objects, others, lo.isEqual);
  /// // => [{ 'x': 1, 'y': 2 }]
  /// ```
  List<T> intersectionWith<T>(
    List<T> a,
    List<T> b,
    bool Function(T a, T b) comparator,
  ) =>
      array.intersectionWith(a, b, comparator);

  /// Converts all elements in array into a string separated by [separator].
  ///
  /// Returns the joined string.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.join(['a', 'b', 'c'], '~');
  /// // => 'a~b~c'
  /// ```
  String join<T>(List<T> list, [String separator = ',']) =>
      array.join(list, separator);

  /// Gets the last element of array.
  ///
  /// Returns the last element of array or null if array is empty.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.last([1, 2, 3]);
  /// // => 3
  ///
  /// lo.last([]);
  /// // => null
  /// ```
  T? last<T>(List<T> list) => array.last(list);

  /// This method is like [indexOf] except that it iterates over elements of
  /// array from right to left.
  ///
  /// Returns the index of the matched value, else -1.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.lastIndexOf([1, 2, 1, 2], 2);
  /// // => 3
  ///
  /// // Search from the `fromIndex`.
  /// lo.lastIndexOf([1, 2, 1, 2], 2, 2);
  /// // => 1
  /// ```
  int lastIndexOf<T>(List<T> list, T value, [int fromIndex = -1]) =>
      array.lastIndexOf(list, value, fromIndex);

  /// Gets the element at index n of array. If n is negative, the nth element
  /// from the end is returned.
  ///
  /// Returns the nth element of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = ['a', 'b', 'c', 'd'];
  ///
  /// lo.nth(array, 1);
  /// // => 'b'
  ///
  /// lo.nth(array, -2);
  /// // => 'c';
  /// ```
  T nth<T>(List<T> list, int n) => array.nth(list, n);

  /// Removes [value] from array using
  /// [SameValueZero](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
  /// for equality comparisons.
  ///
  /// **Note:** Unlike [without], this method mutates array. Use [remove] to
  /// remove elements from an array by predicate.
  ///
  /// Returns array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = ['a', 'b', 'c', 'a', 'b', 'c'];
  ///
  /// lo.pull(array, 'a');
  /// print(array);
  /// // => ['b', 'c', 'b', 'c']
  /// ```
  List<T> pull<T>(List<T> list, T value) => array.pull(list, value);

  /// This method is like [pull] except that it accepts an array of values to
  /// remove.
  ///
  /// **Note:** Unlike [difference], this method mutates array.
  ///
  /// Returns array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = ['a', 'b', 'c', 'a', 'b', 'c'];
  ///
  /// lo.pullAll(array, ['a', 'c']);
  /// print(array);
  /// // => ['b', 'b']
  /// ```
  List<T> pullAll<T>(List<T> list, List<T> values) =>
      array.pullAll(list, values);

  // pullAllBy() {}

  /// This method is like [pullAll] except that it accepts comparator which is
  /// invoked to compare elements of array to values. The comparator is invoked
  /// with two arguments: (arrVal, othVal).
  ///
  /// **Note:** Unlike [differenceWith], this method mutates array.
  ///
  /// Returns array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = [{ 'x': 1, 'y': 2 }, { 'x': 3, 'y': 4 }, { 'x': 5, 'y': 6 }];
  ///
  /// lo.pullAllWith(array, [{ 'x': 3, 'y': 4 }], lo.isEqual);
  /// print(array);
  /// // => [{ 'x': 1, 'y': 2 }, { 'x': 5, 'y': 6 }]
  /// ```
  List<T> pullAllWith<T>(
          List<T> list, List<T> values, bool Function(T, T) comparator) =>
      array.pullAllWith(list, values, comparator);

  /// Removes elements from array corresponding to indexes and returns an array
  /// of removed elements.
  ///
  /// **Note:** Unlike [at], this method mutates array.
  ///
  /// Returns the new array of removed elements.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = ['a', 'b', 'c', 'd'];
  /// var pulled = lo.pullAt(array, [1, 3]);
  ///
  /// print(array);
  /// // => ['a', 'c']
  ///
  /// print(pulled);
  /// // => ['b', 'd']
  /// ```
  List<T> pullAt<T>(List<T> list, List<int> indices) =>
      array.pullAt(list, indices);

  /// Removes all elements from array that predicate returns true for and
  /// returns an array of the removed elements. The predicate is invoked with
  /// three arguments: (value, index, array).
  ///
  /// **Note:** Unlike [filter], this method mutates array. Use [pull] to pull
  /// elements from an array by value.
  ///
  /// Returns the new array of removed elements.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = [1, 2, 3, 4];
  /// var evens = lo.remove(array, function(n, _, __) {
  ///   return n % 2 == 0;
  /// });
  ///
  /// print(array);
  /// // => [1, 3]
  ///
  /// print(evens);
  /// // => [2, 4]
  /// ```
  List<T> remove<T>(List<T> list, bool Function(T, int, List<T>) predicate) =>
      array.remove(list, predicate);

  /// Reverses array so that the first element becomes the last, the second
  /// element becomes the second to last, and so on.
  ///
  /// **Note:** This method mutates array.
  ///
  /// Returns array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = [1, 2, 3];
  ///
  /// lo.reverse(array);
  /// // => [3, 2, 1]
  ///
  /// print(array);
  /// // => [3, 2, 1]
  /// ```
  List<T> reverse<T>(List<T> list) => array.reverse(list);

  /// Creates a slice of array from start up to, but not including, end.
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var array = [1, 2, 3];
  ///
  /// lo.slice(array, 1);
  /// // => [2, 3];
  ///
  /// lo.slice(array, 1, 2);
  /// // => [2];
  /// ```
  List<T> slice<T>(List<T> list, int start, [int? end]) =>
      array.slice(list, start, end);

  /// Uses a binary search to determine the lowest index at which value should
  /// be inserted into array in order to maintain its sort order.
  ///
  /// Returns the index at which value should be inserted into array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.sortedIndex([30, 50], 40);
  /// // => 1
  /// ```
  int sortedIndex<T extends Comparable>(List<T> list, T value) =>
      array.sortedIndex(list, value);

  // sortedIndexBy() {}

  /// This method is like [indexOf] except that it performs a binary search on a
  /// sorted array.
  ///
  /// Returns the index of the matched value, else -1.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.sortedIndexOf([4, 5, 5, 5, 6], 5);
  /// // => 1
  /// ```
  int sortedIndexOf<T extends Comparable>(List<T> list, T value) =>
      array.sortedIndexOf(list, value);

  /// This method is like [sortedIndex] except that it returns the highest index
  /// at which value should be inserted into array in order to maintain its sort
  /// order.
  ///
  /// Returns the index at which value should be inserted into array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.sortedLastIndex([4, 5, 5, 5, 6], 5);
  /// // => 4
  /// ```
  int sortedLastIndex<T extends Comparable>(List<T> list, T value) =>
      array.sortedLastIndex(list, value);

  // sortedLastIndexBy() {}

  /// This method is like [lastIndexOf] except that it performs a binary search
  /// on a sorted array.
  ///
  /// Returns the index of the matched value, else -1.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.sortedLastIndexOf([4, 5, 5, 5, 6], 5);
  /// // => 3
  /// ```
  int sortedLastIndexOf<T extends Comparable>(List<T> list, T value) =>
      array.sortedLastIndexOf(list, value);

  /// This method is like [uniq] except that it's designed and optimized for
  /// sorted arrays.
  ///
  /// Returns the new duplicate free array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.sortedUniq([1, 1, 2]);
  /// // => [1, 2]
  /// ```
  List<T> sortedUniq<T>(List<T> list) => array.sortedUniq(list);

  // sortedUniqBy() {}

  /// Gets all but the first element of array.
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.tail([1, 2, 3]);
  /// // => [2, 3]
  /// ```
  List<T> tail<T>(List<T> list) => array.tail(list);

  /// Creates a slice of array with n elements taken from the beginning.
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.take([1, 2, 3]);
  /// // => [1]
  ///
  /// lo.take([1, 2, 3], 2);
  /// // => [1, 2]
  ///
  /// lo.take([1, 2, 3], 5);
  /// // => [1, 2, 3]
  ///
  /// lo.take([1, 2, 3], 0);
  /// // => []
  /// ```
  List<T> take<T>(List<T> list, [int n = 1]) => array.take(list, n);

  /// Creates a slice of array with n elements taken from the end.
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.takeRight([1, 2, 3]);
  /// // => [3]
  ///
  /// lo.takeRight([1, 2, 3], 2);
  /// // => [2, 3]
  ///
  /// lo.takeRight([1, 2, 3], 5);
  /// // => [1, 2, 3]
  ///
  /// lo.takeRight([1, 2, 3], 0);
  /// // => []
  /// ```
  List<T> takeRight<T>(List<T> list, [int n = 1]) => array.takeRight(list, n);

  /// Creates a slice of array with elements taken from the end. Elements are
  /// taken until predicate returns false. The predicate is invoked with three
  /// arguments: (value, index, array).
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney',  'active': true },
  ///   { 'user': 'fred',    'active': false },
  ///   { 'user': 'pebbles', 'active': false }
  /// ];
  ///
  /// lo.takeRightWhile(users, (o) => !o['active']);
  /// // => objects for ['fred', 'pebbles']
  /// ```
  List<T> takeRightWhile<T>(
    List<T> list,
    bool Function(T, int, List<T>) predicate,
  ) =>
      array.takeRightWhile(list, predicate);

  /// Creates a slice of array with elements taken from the beginning. Elements
  /// are taken until predicate returns false. The predicate is invoked with
  /// three arguments: (value, index, array).
  ///
  /// Returns the slice of array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney',  'active': false },
  ///   { 'user': 'fred',    'active': false },
  ///   { 'user': 'pebbles', 'active': true }
  /// ];
  ///
  /// lo.takeRightWhile(users, (o) => !o['active']);
  /// // => objects for ['barney', 'fred']
  /// ```
  List<T> takeWhile<T>(
    List<T> list,
    bool Function(T, int, List<T>) predicate,
  ) =>
      array.takeWhile(list, predicate);

  /// Creates an array of unique values, in order, from all given arrays using
  /// [SameValueZero](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
  /// for equality comparisons.
  ///
  /// Returns the new array of combined values.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.union([2], [1, 2]);
  /// // => [2, 1]
  /// ```
  List<T> union<T>(List<T> a, List<T> b) => array.union(a, b);

  // unionBy() {}

  /// This method is like [union] except that it accepts comparator which is
  /// invoked to compare elements of arrays. Result values are chosen from the
  /// first array in which the value occurs. The comparator is invoked with two
  /// arguments: (arrVal, othVal).
  ///
  /// Returns the new array of combined values.
  ///
  /// Example:
  ///
  /// ```dart
  /// var objects = [{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }];
  /// var others = [{ 'x': 1, 'y': 1 }, { 'x': 1, 'y': 2 }];
  ///
  /// lo.unionWith(objects, others, lo.isEqual);
  /// // => [{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }, { 'x': 1, 'y': 1 }]
  /// ```
  List<T> unionWith<T>(List<T> a, List<T> b, bool Function(T, T) comparator) =>
      array.unionWith(a, b, comparator);

  /// Creates a duplicate-free version of an array, using
  /// [SameValueZero](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
  /// for equality comparisons, in which only the first occurrence of each
  /// element is kept. The order of result values is determined by the order
  /// they occur in the array.
  ///
  /// Returns the new duplicate free array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.union([2, 1, 2]);
  /// // => [2, 1]
  /// ```
  List<T> uniq<T>(List<T> list) => array.uniq(list);

  // uniqBy() {}

  /// This method is like [uniq] except that it accepts [comparator] which is
  /// invoked to compare elements of array. The order of result values is
  /// determined by the order they occur in the array. The comparator is
  /// invoked with two arguments: (arrVal, othVal).
  ///
  /// Returns the new duplicate free array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var objects = [{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }, { 'x': 1, 'y': 2 }];
  ///
  /// lo.uniqWith(objects, lo.isEqual);
  /// // => [{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }]
  /// ```
  List<T> uniqWith<T>(List<T> list, bool Function(T, T) comparator) =>
      array.uniqWith(list, comparator);

  /// This method is like [zip] except that it accepts an array of grouped
  /// elements and creates an array regrouping the elements to their pre-zip
  /// configuration.
  ///
  /// Returns the new array of regrouped elements.
  ///
  /// Example:
  ///
  /// ```dart
  /// var zipped = lo.zip(['a', 'b'], [1, 2], [true, false]);
  /// // => [['a', 1, true], ['b', 2, false]]
  ///
  /// lo.unzip(zipped);
  /// // => [['a', 'b'], [1, 2], [true, false]]
  /// ```
  List<List<dynamic>> unzip(List<List<dynamic>> list) => array.unzip(list);

  // unzipWith() {}

  /// Creates an array excluding [value] using
  /// [SameValueZero](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
  /// for equality comparisons.
  ///
  /// **Note:** Unlike [pull], this method returns a new array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.without([1, 2, 3], 2);
  /// // => [1, 3]
  /// ```
  List<T> without<T>(List<T> list, T value) => array.without(list, value);

  /// Creates an array excluding all given [values] using
  /// [SameValueZero](http://ecma-international.org/ecma-262/7.0/#sec-samevaluezero)
  /// for equality comparisons.
  ///
  /// **Note:** Unlike [pul1lAll], this method returns a new array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.withoutAll([1, 2, 3], [2, 3]);
  /// // => [1]
  /// ```
  List<T> withoutAll<T>(List<T> list, List<T> values) =>
      array.withoutAll(list, values);

  List<T> xor<T>(List<T> a, List<T> b) => array.xor(a, b);

  // xorBy() {}

  /// This method is like [xor] except that it accepts [comparator] which is
  /// invoked to compare elements of arrays. The order of result values is
  /// determined by the order they occur in the arrays. The comparator is
  /// invoked with two arguments: (arrVal, othVal).
  ///
  /// Returns the new array of filtered values.
  ///
  /// Example:
  ///
  /// ```dart
  /// var objects = [{ 'x': 1, 'y': 2 }, { 'x': 2, 'y': 1 }];
  /// var others = [{ 'x': 1, 'y': 1 }, { 'x': 1, 'y': 2 }];
  ///
  /// lo.xorWith(objects, others, lo.isEqual);
  /// // => [{ 'x': 2, 'y': 1 }, { 'x': 1, 'y': 1 }]
  /// ```
  List<T> xorWith<T>(List<T> a, List<T> b, bool Function(T, T) comparator) =>
      array.xorWith(a, b, comparator);

  /// Creates an array of grouped elements, the first of which contains the
  /// first elements of the given arrays, the second of which contains the
  /// second elements of the given arrays, and so on.
  ///
  /// Returns the new array of grouped elements.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.zip(['a', 'b'], [1, 2], [true, false]);
  /// // => [['a', 1, true], ['b', 2, false]]
  /// ```
  List<List<dynamic>> zip(List<List<dynamic>> list) => unzip(list);

  /// This method is like [fromPairs] except that it accepts two arrays, one of
  /// property identifiers and one of corresponding values.
  ///
  /// Returns the new object.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.zipObject(['a', 'b'], [1, 2]);
  /// // => { 'a': 1, 'b': 2 }
  /// ```
  Map<TKey, TValue> zipObject<TKey, TValue>(
    List<TKey> keys,
    List<TValue> values,
  ) =>
      array.zipObject(keys, values);

  // zipObjectDeep() {}
  // zipWith() {}

  /****************************************************************************/
  /*********************** Collection *****************************************/
  /****************************************************************************/

  // countBy() {}

  /// Iterates over elements of [collection] and invokes [iteratee] for each
  /// element. The iteratee is invoked with three arguments: (value, index,
  /// collection). Iteratee functions may exit iteration early by explicitly
  /// returning false.
  ///
  /// **Note:** This is an alias for [forEach].
  ///
  /// Returns collection.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.each([1, 2], (value, _, __) {
  ///   print(value);
  /// });
  /// // => Logs `1` then `2`.
  /// ```
  Iterable<T> each<T>(
    Iterable<T> iterable,
    bool Function(T, int, Iterable<T>) iteratee,
  ) =>
      forEach(iterable, iteratee);

  /// This method is like [each] except that it iterates over elements of
  /// collection from right to left.
  ///
  /// **Note:** This is an alias for [forEachRight].
  ///
  /// Returns collection.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.eachRight([1, 2], (value, _, __) {
  ///   print(value);
  /// });
  /// // => Logs `2` then `1`.
  /// ```
  Iterable<T> eachRight<T>(
    Iterable<T> iterable,
    bool Function(T, int, Iterable<T>) iteratee,
  ) =>
      forEachRight(iterable, iteratee);

  /// Checks if predicate returns truthy for all elements of collection.
  /// Iteration is stopped once predicate returns falsey. The predicate is
  /// invoked with three arguments: (value, index, collection).
  ///
  /// **Note:** This method returns true for
  /// [empty collections](https://en.wikipedia.org/wiki/Empty_set) because
  /// [everything is true](https://en.wikipedia.org/wiki/Vacuous_truth) of
  /// elements of empty collections.
  ///
  /// Returns true if all elements pass the predicate check, else false.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.every([1, 3, 5, 6], (int x) => x.isOdd);
  /// // => false
  /// ```
  bool every<T>(Iterable<T> iterable, bool Function(T) predicate) =>
      collection.every(iterable, predicate);

  /// Iterates over elements of collection, returning an array of all elements
  /// [predicate] returns true for. The predicate is invoked with three
  /// arguments: (value, index, collection).
  ///
  /// **Note:** Unlike [remove], this method returns a new array.
  ///
  /// Returns the new filtered array.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney', 'age': 36, 'active': true },
  ///   { 'user': 'fred',   'age': 40, 'active': false }
  /// ];
  ///
  /// lo.filter(users, (o, _, __) => !o['active']);
  /// // => objects for ['fred']
  /// ```
  Iterable<T> filter<T>(
    Iterable<T> iterable,
    bool Function(T, int, Iterable<T>) predicate,
  ) =>
      collection.filter(iterable, predicate);

  /// Iterates over elements of collection, returning the first element
  /// [predicate] returns true for. The predicate is invoked with three
  /// arguments: (value, index, collection).
  ///
  /// Returns the matched element, else null.
  ///
  /// Example:
  ///
  /// ```dart
  /// var users = [
  ///   { 'user': 'barney',  'age': 36, 'active': true },
  ///   { 'user': 'fred',    'age': 40, 'active': false },
  ///   { 'user': 'pebbles', 'age': 1,  'active': true }
  /// ];
  ///
  /// lo.find(users, (o, _, __) => o['age'] < 40);
  /// // => object for 'barney'
  /// ```
  T? find<T>(
          Iterable<T> iterable, bool Function(T, int, Iterable<T>) predicate) =>
      collection.find(iterable, predicate);

  /// This method is like [find] except that it iterates over elements of
  /// collection from right to left.
  ///
  /// Returns the matched element, else null.
  ///
  /// Example:
  ///
  /// ```dart
  /// _.findLast([1, 2, 3, 4], (int n, _, __) {
  ///   return n % 2 == 1;
  /// });
  /// // => 3
  /// ```
  T? findLast<T>(
          Iterable<T> iterable, bool Function(T, int, Iterable<T>) predicate) =>
      collection.findLast(iterable, predicate);

  /// Creates a flattened array of values by running each element in collection
  /// thru [iteratee] and flattening the mapped results. The iteratee is invoked
  /// with three arguments: (value, index, collection).
  ///
  /// Returns the new flattened array.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.flatMap([1, 2], (n, _, __) => [n, n]);
  /// // => [1, 1, 2, 2]
  /// ```
  Iterable<TOut> flatMap<TIn, TOut>(
    Iterable<TIn> iterable,
    Iterable<TOut> Function(TIn, int, Iterable<TIn>) iteratee,
  ) =>
      collection.flatMap(iterable, iteratee);

  flatMapDeep() {}
  flatMapDepth() {}

  /// Iterates over elements of [collection] and invokes [iteratee] for each
  /// element. The iteratee is invoked with three arguments: (value, index,
  /// collection). Iteratee functions may exit iteration early by explicitly
  /// returning false.
  ///
  /// Returns collection.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.forEach([1, 2], (value, _, __) {
  ///   print(value);
  /// });
  /// // => Logs `1` then `2`.
  /// ```
  Iterable<T> forEach<T>(
    Iterable<T> iterable,
    bool Function(T, int, Iterable<T>) iteratee,
  ) =>
      collection.forEach(iterable, iteratee);

  /// This method is like [forEach] except that it iterates over elements of
  /// collection from right to left.
  ///
  /// Returns collection.
  ///
  /// Example:
  ///
  /// ```dart
  /// lo.forEachRight([1, 2], (value, _, __) {
  ///   print(value);
  /// });
  /// // => Logs `2` then `1`.
  /// ```
  Iterable<T> forEachRight<T>(
    Iterable<T> iterable,
    bool Function(T, int, Iterable<T>) iteratee,
  ) =>
      collection.forEachRight(iterable, iteratee);

  Map<TKey, List<TValue>> groupBy<TKey, TValue>(
    Iterable<TValue> iterable,
    TKey Function(TValue) iteratee,
  ) =>
      collection.groupBy(iterable, iteratee);

  includes() {}
  invokeMap() {}
  keyBy() {}
  map() {}
  orderBy() {}
  partition() {}
  reduce() {}
  reduceRight() {}
  reject() {}
  sample() {}
  sampleSize() {}
  shuffle() {}
  size() {}
  some() {}
  sortBy() {}

  /****************************************************************************/
  /*********************** Date ***********************************************/
  /****************************************************************************/

  now() {}

  /****************************************************************************/
  /*********************** Function *******************************************/
  /****************************************************************************/

  after() {}
  ary() {}
  before() {}
  bind() {}
  bindKey() {}
  curry() {}
  curryRight() {}
  debounce() {}
  defer() {}
  delay() {}
  flip() {}
  memoize() {}
  negate() {}
  once() {}
  overArgs() {}
  partial() {}
  partialRight() {}
  rearg() {}
  rest() {}
  spread() {}
  throttle() {}
  unary() {}
  wrap() {}

  /****************************************************************************/
  /*********************** Lang ***********************************************/
  /****************************************************************************/

  castArray() {}
  clone() {}
  cloneDeep() {}
  cloneDeepWith() {}
  cloneWith() {}
  conformsTo() {}
  eq() {}
  gt() {}
  gte() {}
  isArguments() {}
  isArray() {}
  isArrayBuffer() {}
  isArrayLike() {}
  isArrayLikeObject() {}
  isBoolean() {}
  isBuffer() {}
  isDate() {}
  isElement() {}
  isEmpty() {}

  /// Performs a deep comparison between two values to determine if they are
  /// equivalent.
  ///
  /// Example:
  ///
  /// ```dart
  /// var object = { 'a': 1 };
  /// var other = { 'a': 1 };
  ///
  /// lo.isEqual(object, other);
  /// // => true
  ///
  /// object == other;
  /// // => false
  /// ```
  bool isEqual(dynamic value, dynamic other) => lang.isEqual(value, other);

  isEqualWith() {}
  isError() {}
  isFinite() {}
  isFunction() {}
  isInteger() {}
  isLength() {}
  isMap() {}
  isMatch() {}
  isMatchWith() {}
  isNaN() {}
  isNative() {}
  isNil() {}
  isNull() {}
  isNumber() {}
  isObject() {}
  isObjectLike() {}
  isPlainObject() {}
  isRegExp() {}
  isSafeInteger() {}
  isSet() {}
  isString() {}
  isSymbol() {}
  isTypedArray() {}
  isUndefined() {}
  isWeakMap() {}
  isWeakSet() {}
  lt() {}
  lte() {}
  toArray() {}
  toFinite() {}
  toInteger() {}
  toLength() {}
  toNumber() {}
  toPlainObject() {}
  toSafeInteger() {}

  /****************************************************************************/
  /*********************** Math ***********************************************/
  /****************************************************************************/

  add() {}
  ceil() {}
  divide() {}
  floor() {}
  max() {}
  maxBy() {}
  mean() {}
  meanBy() {}
  min() {}
  minBy() {}
  multiply() {}
  round() {}
  subtract() {}
  sum() {}
  sumBy() {}

  /****************************************************************************/
  /*********************** Number *********************************************/
  /****************************************************************************/

  clamp() {}
  inRange() {}
  random() {}

  /****************************************************************************/
  /*********************** Object *********************************************/
  /****************************************************************************/

  assign() {}
  assignIn() {}
  assignInWith() {}
  assignWith() {}
  at() {}
  create() {}
  defaults() {}
  defaultsDeep() {}
  entries() => toPairs();
  entriesIn() => toPairsIn();
  extend() => assignIn();
  extendWith() => assignInWith();
  findKey() {}
  findLastKey() {}
  forIn() {}
  forInRight() {}
  forOwn() {}
  forOwnRight() {}
  functions() {}
  functionsIn() {}
  getOr() {} // get
  has() {}
  hasIn() {}
  invert() {}
  invertBy() {}
  invoke() {}
  keys() {}
  keysIn() {}
  mapKeys() {}
  mapValues() {}
  merge() {}
  mergeWith() {}
  omit() {}
  omitBy() {}
  pick() {}
  pickBy() {}
  result() {}
  setOr() {} // set
  setWith() {}
  toPairs() {}
  toPairsIn() {}
  transform() {}
  unset() {}
  update() {}
  updateWith() {}
  values() {}
  valuesIn() {}

  /****************************************************************************/
  /*********************** Seq ************************************************/
  /****************************************************************************/

  chain() {}
  tap() {}
  thru() {}
  // prototype[Symbol.iterator]() {}
  // prototype.at() {}
  // prototype.chain() {}
  // prototype.commit() {}
  // prototype.next() {}
  // prototype.plant() {}
  // prototype.reverse() {}
  // prototype.toJSON -> value() {}
  // prototype.value() {}
  // prototype.valueOf -> value() {}

  /****************************************************************************/
  /*********************** String *********************************************/
  /****************************************************************************/

  camelCase() {}
  capitalize() {}
  deburr() {}
  endsWith() {}
  escape() {}
  escapeRegExp() {}
  kebabCase() {}
  lowerCase() {}
  lowerFirst() {}
  pad() {}
  padEnd() {}
  padStart() {}
  parseInt() {}
  repeat() {}
  replace() {}
  snakeCase() {}
  split() {}
  startCase() {}
  startsWith() {}
  template() {}
  toLower() {}
  toUpper() {}
  trim() {}
  trimEnd() {}
  trimStart() {}
  truncate() {}
  unescape() {}
  upperCase() {}
  upperFirst() {}
  words() {}

  /****************************************************************************/
  /*********************** Util ***********************************************/
  /****************************************************************************/

  attempt() {}
  bindAll() {}
  cond() {}
  conforms() {}
  constant() {}
  defaultTo() {}
  flow() {}
  flowRight() {}

  /// This method returns the first argument it receives.
  ///
  /// Example:
  ///
  /// ```dart
  /// var object = { 'a': 1 };
  ///
  /// console.log(_.identity(object) === object);
  /// // => true
  /// ```
  T identity<T>(T value) => util.identity(value);

  // iteratee() {}
  matches() {}
  matchesProperty() {}
  method() {}
  methodOf() {}
  // mixin() {}
  noConflict() {}
  noop() {}
  nthArg() {}
  over() {}
  overEvery() {}
  overSome() {}
  property() {}
  propertyOf() {}
  range() {}
  rangeRight() {}
  runInContext() {}
  stubArray() {}
  stubFalse() {}
  stubObject() {}
  stubString() {}
  stubTrue() {}
  times() {}
  toPath() {}
  uniqueId() {}
}
