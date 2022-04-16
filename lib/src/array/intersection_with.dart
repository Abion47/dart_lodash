List<T> intersectionWith<T>(
  List<T> a,
  List<T> b,
  bool Function(T a, T b) comparator,
) {
  final ref = <T>{};

  Iterable<T> _differenceWith() sync* {
    for (final elem in a) {
      if (ref.contains(elem)) {
        yield elem;
        continue;
      }

      bool shouldYield = false;
      for (final other in b) {
        if (comparator(elem, other)) {
          ref.add(elem);
          ref.add(other);
          shouldYield = true;
          break;
        }
      }

      if (shouldYield) yield elem;
    }
  }

  return _differenceWith().toList();
}
