import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:project_shelf_v3/adapter/connector/printer_connector.dart';
import 'package:project_shelf_v3/adapter/dto/connector/printer_info_dto.dart';

final class Connector implements PrinterConnector {
  @override
  Future<Iterable<PrinterInfoDto>> getPrinters() async {
    final isBluetoothEnabled = await PrintBluetoothThermal.bluetoothEnabled;
    if (!isBluetoothEnabled) {
      throw AssertionError();
    }

    return await PrintBluetoothThermal.pairedBluetooths.then((it) {
      return it.map(
        (it) => PrinterInfoDto(name: it.name, macAdress: it.macAdress),
      );
    });
  }
}
