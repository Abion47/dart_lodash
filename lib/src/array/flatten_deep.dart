List<dynamic> flattenDeep(List<dynamic> list) {
  Iterable<dynamic> _recursiveFlatten(List<dynamic> input) sync* {
    for (final elem in input) {
      if (elem is List) {
        yield* _recursiveFlatten(elem);
      } else {
        yield elem;
      }
    }
  }

  return _recursiveFlatten(list).toList();
}
