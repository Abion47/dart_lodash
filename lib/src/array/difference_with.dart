List<T> differenceWith<T>(
  List<T> a,
  List<T> b,
  bool Function(T a, T b) comparator,
) {
  final ref = <T>{};

  Iterable<T> _differenceWith() sync* {
    for (final elem in a) {
      if (ref.contains(elem)) continue;

      bool shouldYield = true;
      for (final other in b) {
        if (comparator(elem, other)) {
          ref.add(elem);
          ref.add(other);
          shouldYield = false;
          break;
        }
      }

      if (shouldYield) yield elem;
    }
  }

  return _differenceWith().toList();
}
