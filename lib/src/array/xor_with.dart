import './difference_with.dart';

List<T> xorWith<T>(List<T> a, List<T> b, bool Function(T, T) comparator) {
  return [
    ...differenceWith(a, b, comparator),
    ...differenceWith(b, a, comparator),
  ];
}
