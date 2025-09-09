import 'dart:async';

const DEFAULT_DURATION_MILLIS = 300;

class Debouncer<T> {
  Completer completer = Completer<T>();
  Duration duration;
  Timer? _timer;

  Debouncer({Duration? duration})
    : duration = duration ?? Duration(milliseconds: DEFAULT_DURATION_MILLIS);

  void debounce(FutureOr<T> Function() execute) {
    _timer?.cancel();
    _timer = Timer(duration, () async {
      final result = await execute();
      completer.complete(result);

      completer = Completer<T>();
    });
  }
}
