import './difference.dart';

List<T> xor<T>(List<T> a, List<T> b) {
  return [
    ...difference(a, b),
    ...difference(b, a),
  ];
}
