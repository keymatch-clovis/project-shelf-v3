import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:project_shelf_v3/adapter/repository/company_info_repository.dart';
import 'package:project_shelf_v3/common/logger/framework_printer.dart';
import 'package:project_shelf_v3/framework/sembast/sembast.dart';
import 'package:project_shelf_v3/injectable.dart';
import 'package:sembast/sembast_io.dart';

@Singleton(as: CompanyInfoRepository, order: RegisterOrder.REPOSITORY)
final class CompanyInfoDocument implements CompanyInfoRepository {
  final _logger = Logger(printer: FrameworkPrinter());

  final _sembast = getIt.get<Sembast>();

  static const RECORD_NAME = 'company_info';

  @override
  Future<void> create(CreateArgs args) async {
    // final companyInfo = CompanyInfoDto(
    //   id: args.id,
    //   logoFileName: args.logoFileName,
    //   name: args.name,
    //   document: args.document,
    //   email: args.email,
    //   phone: args.phone,
    //   updatedAt: DateTime.now(),
    // );

    _logger.d('Setting company info');
    final store = StoreRef.main();
    // await store.record(RECORD_NAME).put(_sembast.database, companyInfo);
    throw UnimplementedError();
  }

  @override
  Future<Iterable<dynamic>> get() {
    _logger.d('Getting company info');
    throw UnimplementedError();
  }
}
