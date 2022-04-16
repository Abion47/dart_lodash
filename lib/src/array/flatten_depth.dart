import './flatten.dart';

List<dynamic> flattenDepth(List<dynamic> list, [int depth = 1]) {
  if (depth < 0) {
    throw ArgumentError.value(depth, 'depth', 'depth must be non-negative');
  }
  if (depth == 0) return List.from(list);
  if (depth == 1) {
    return flatten(list);
  }

  Iterable<dynamic> _recursiveFlatten(List<dynamic> input, int level) sync* {
    for (final elem in input) {
      if (elem is List) {
        if (level < depth) {
          yield* _recursiveFlatten(elem, level + 1);
        } else {
          yield elem;
        }
      } else {
        yield elem;
      }
    }
  }

  return _recursiveFlatten(list, 0).toList();
}
