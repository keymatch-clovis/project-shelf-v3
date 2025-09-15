import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class StreamSearchNotifier<T> extends StreamNotifier<T> {
  Future<void> updateQuery(String query);
}
