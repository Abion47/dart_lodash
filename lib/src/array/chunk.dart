List<List<T>> chunk<T>(List<T> list, [int size = 1]) {
  Iterable<List<T>> _chunk() sync* {
    final tmp = <T>[];
    int count = 0;

    for (T elem in list) {
      if (count >= tmp.length) {
        tmp.add(elem);
      } else {
        tmp[count] = elem;
      }

      count++;

      if (count >= size) {
        yield List.from(tmp);
        count = 0;
      }
    }

    if (count > 0) {
      yield tmp.sublist(0, count);
    }
  }

  return _chunk().toList();
}
