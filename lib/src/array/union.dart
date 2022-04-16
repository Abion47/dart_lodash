List<T> union<T>(List<T> a, List<T> b) {
  final ref = <T>{};

  Iterable<T> _union() sync* {
    for (final elem in a) {
      if (ref.add(elem)) yield elem;
    }
    for (final elem in b) {
      if (ref.add(elem)) yield elem;
    }
  }

  return _union().toList();
}
