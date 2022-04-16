List<T> unionWith<T>(List<T> a, List<T> b, bool Function(T, T) comparator) {
  final ref = <T>{};

  Iterable<T> _findUnique(List<T> list) sync* {
    for (final elem in list) {
      if (ref.contains(elem)) {
        continue;
      }

      bool shouldYield = true;
      for (final other in ref) {
        if (comparator(elem, other)) {
          shouldYield = false;
          break;
        }
      }

      if (shouldYield) {
        ref.add(elem);
        yield elem;
      }
    }
  }

  return [
    ..._findUnique(a),
    ..._findUnique(b),
  ];
}
