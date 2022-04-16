List<dynamic> flatten(List<dynamic> list) {
  Iterable<dynamic> _flatten() sync* {
    for (final elem in list) {
      if (elem is List) {
        yield* elem;
      } else {
        yield elem;
      }
    }
  }

  return _flatten().toList();
}
