import './take.dart';

List<T> takeWhile<T>(List<T> list, bool Function(T, int, List<T>) predicate) {
  if (list.isEmpty) return [];
  for (int n = 0; n < list.length; n++) {
    if (!predicate(list[n], n, list)) {
      return take(list, n);
    }
  }

  return List.from(list);
}
