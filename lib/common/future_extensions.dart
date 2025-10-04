import 'dart:async';

extension ThenIfNotNull<T> on Future<T?> {
  Future<T?> thenIfNotNull(FutureOr<T> Function(T value) onValue) async {
    return then((it) {
      if (it == null) {
        return null;
      }

      return onValue(it);
    });
  }
}
