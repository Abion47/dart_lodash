int sortedLastIndexOf<T extends Comparable>(List<T> list, T value) {
  if (list.isEmpty) return -1;

  final firstCmp = value.compareTo(list.first);
  if (firstCmp < 0) return -1;
  if (firstCmp == 0) return 0;

  final lastCmp = value.compareTo(list.last);
  if (lastCmp == 0) return list.length - 1;
  if (lastCmp > 0) return -1;

  int _sortedIndexOfRecursive(int min, int max) {
    if (min > max) return -1;

    var idx = min + ((max - min) ~/ 2);
    var cmp = value.compareTo(list[idx]);

    // print(
    //     'min($min,${list[min]}) < idx($idx,${list[idx]}) ~ val($value) < max($max,${list[max]})');

    if (cmp == 0) {
      while (idx + 1 < list.length) {
        cmp = value.compareTo(list[idx + 1]);
        if (cmp != 0) break;
        idx++;
      }
      return idx;
    }
    if (cmp > 0) return _sortedIndexOfRecursive(idx + 1, max);
    return _sortedIndexOfRecursive(min, idx - 1);
  }

  return _sortedIndexOfRecursive(0, list.length - 1);
}
