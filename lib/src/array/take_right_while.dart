import './take_right.dart';

List<T> takeRightWhile<T>(
  List<T> list,
  bool Function(T, int, List<T>) predicate,
) {
  if (list.isEmpty) return [];

  int idx;
  for (int n = 0; n < list.length; n++) {
    idx = list.length - n - 1;
    if (!predicate(list[idx], idx, list)) {
      return takeRight(list, n);
    }
  }

  return List.from(list);
}
