import 'package:flutter/material.dart';
import 'package:project_shelf_v3/common/exception/bluetooth_disabled_exception.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

extension ExceptionParser on Exception {
  String parseException(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    if (this is BluetoothDisabledException) {
      return localizations.err_bluetooth_disabled;
    }

    return localizations.unknown_exception;
  }
}

extension ExceptionIconParser on Exception {
  IconData parseIcon() {
    if (this is BluetoothDisabledException) {
      return Icons.bluetooth_disabled_rounded;
    }
    return Icons.error_rounded;
  }
}
