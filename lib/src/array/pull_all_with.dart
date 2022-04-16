List<T> pullAllWith<T>(
    List<T> list, List<T> values, bool Function(T, T) comparator) {
  final ref = <T>{};

  for (int i = 0; i < list.length; i++) {
    while (i < list.length && ref.contains(list[i])) {
      list.removeAt(i);
    }

    if (i >= list.length) break;

    bool shouldRemove = false;
    for (final value in values) {
      if (comparator(list[i], value)) {
        ref.add(list[i]);
        shouldRemove = true;
        break;
      }
    }

    if (shouldRemove) {
      list.removeAt(i);
      i--;
    }
  }

  return list;
}
