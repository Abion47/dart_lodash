int sortedLastIndex<T extends Comparable>(List<T> list, T value) {
  if (list.isEmpty) return 0;
  if (value.compareTo(list.first) < 0) return 0;
  if (value.compareTo(list.last) > 0) return list.length;

  int _sortedLastIndexRecursive(int min, int max) {
    if (min == max) return min;

    var idx = min + ((max - min) ~/ 2);
    var cmp = value.compareTo(list[idx]);

    if (cmp == 0) {
      while (idx + 1 < list.length) {
        idx++;
        cmp = value.compareTo(list[idx]);
        if (cmp != 0) break;
      }
      return idx;
    }
    if (cmp < 0) {
      if (max - min <= 1) return min;
      return _sortedLastIndexRecursive(min, idx);
    } else {
      if (max - min <= 1) return max;
      return _sortedLastIndexRecursive(idx, max);
    }
  }

  return _sortedLastIndexRecursive(0, list.length - 1);
}
