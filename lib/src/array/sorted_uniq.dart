List<T> sortedUniq<T>(List<T> list) {
  if (list.isEmpty) return [];

  Iterable<T> _sortedUniq() sync* {
    T lastElem = list.first;
    yield lastElem;

    for (final elem in list.skip(1)) {
      if (elem != lastElem) {
        yield elem;
        lastElem = elem;
      }
    }
  }

  return _sortedUniq().toList();
}
