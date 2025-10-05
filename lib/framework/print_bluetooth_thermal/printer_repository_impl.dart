import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:project_shelf_v3/adapter/dto/repository/printer_info_dto.dart';
import 'package:project_shelf_v3/adapter/repository/printer_repository.dart';
import 'package:project_shelf_v3/common/error/bluetooth_disabled_error.dart';

final class PrinterRepositoryImpl implements PrinterRepository {
  @override
  Future<Iterable<PrinterInfoDto>> getPrinters() async {
    final isBluetoothEnabled = await PrintBluetoothThermal.bluetoothEnabled;
    if (!isBluetoothEnabled) {
      throw BluetoothDisabledError();
    }

    return await PrintBluetoothThermal.pairedBluetooths.then((it) {
      return it.map(
        (it) => PrinterInfoDto(name: it.name, macAddress: it.macAdress),
      );
    });
  }
}
