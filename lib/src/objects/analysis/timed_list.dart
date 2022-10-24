part of '../../../spotify_api.dart';

class TimedList<T extends Timed> {
  final Map<int, Map<double, T>> _timedSecondsMap = {};

  List<T> getSecond(int second) =>
      _timedSecondsMap[second]?.values.toList() ?? [];

  void insert(T item) {
    final start = item.startTime.floor();
    _timedSecondsMap[start] ??= {};
    _timedSecondsMap[start]![item.startTime] = item;
  }

  T? getAt(double time) {
    final second = time.floor();
    // Search for the item in the second
    for (final sec in getSecond(second)) {
      if (sec.startTime <= time && sec.endTime >= time) return sec;
    }
    // Search for the item in the previous second
    for (final sec in getSecond(second - 1)) {
      if (sec.startTime <= time && sec.endTime >= time) return sec;
    }
    return null;
  }
}
