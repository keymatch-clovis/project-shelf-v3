import 'package:flutter/material.dart';
import 'package:project_shelf_v3/common/error/bluetooth_disabled_error.dart';
import 'package:project_shelf_v3/framework/l10n/app_localizations.dart';

extension ErrorParser on Error {
  String parseError(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    if (this is BluetoothDisabledError) {
      return localizations.err_bluetooth_disabled;
    }

    return localizations.unknown_error;
  }
}

extension ErrorIconParser on Error {
  IconData parseIconError() {
    if (this is BluetoothDisabledError) {
      return Icons.bluetooth_disabled_rounded;
    }
    return Icons.error_rounded;
  }
}
