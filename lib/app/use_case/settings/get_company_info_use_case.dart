import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/domain/entity/company_info.dart';
import 'package:project_shelf_v3/injectable.dart';

final class GetCompanyInfoUseCase
    extends UseCase<Unit, Result<Option<CompanyInfo>, Exception>> {
  final _service = getIt.get<CompanyInfoService>();

  @override
  Future<Result<Option<CompanyInfo>, Exception>> exec(_) async {
    logger.d('Getting company info');
    return _service
        .get()
        .map((it) {
          assert(it.length <= 1);
          return it.singleOrNull;
        })
        .map((it) => Option.from(it));
  }
}
