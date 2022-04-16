List<T> compact<T>(List<T?> list) {
  Iterable<T> _compact() sync* {
    for (final elem in list) {
      if (elem == null) continue;
      if (elem is bool && !elem) continue;
      if (elem is num && elem == 0) continue;
      if (elem is double && elem.isNaN) continue;
      if (elem is String && elem.isEmpty) continue;
      yield elem;
    }
  }

  return _compact().toList();
}
