import 'dart:async';

const DEFAULT_DURATION_MILLIS = 500;

class StreamDebouncer<T> {
  Completer<Stream<T>> completer = Completer();
  Duration duration;
  Timer? _timer;

  StreamDebouncer({Duration? duration})
    : duration = duration ?? Duration(milliseconds: DEFAULT_DURATION_MILLIS);

  void debounce(Stream<T> Function() execute) {
    _timer?.cancel();
    _timer = Timer(duration, () async {
      completer.complete(execute());
      completer = Completer();
    });
  }
}
