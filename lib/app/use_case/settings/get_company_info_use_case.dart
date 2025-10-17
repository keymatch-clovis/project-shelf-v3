import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/app/dto/company_info_response.dart';
import 'package:project_shelf_v3/app/service/company_info_service.dart';
import 'package:project_shelf_v3/app/use_case/use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

final class GetCompanyInfoUseCase extends UseCase<Unit, CompanyInfoResponse> {
  final _service = getIt.get<CompanyInfoService>();

  @override
  Future<CompanyInfoResponse> exec(_) async {
    logger.d('Getting company info');
    return _service
        .get()
        .then((it) {
          assert(it.length <= 1);
          return it.singleOrNull;
        })
        .then((it) async {
          // If no company info was provided, we can show a default one.
          //
          // NOTE: If we had to have some default data or something like that,
          // we would need to create a new object, and then return that one.
          // Luckily, we do not need that yet.
          if (it == null) {
            return CompanyInfoResponse();
          }
          return it;
        });
  }
}
