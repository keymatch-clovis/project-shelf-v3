import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/domain/entity/company_info.dart';

abstract interface class CompanyInfoService {
  Future<Result<Iterable<CompanyInfo>, Exception>> get();
  Future<Result<Unit, Exception>> set(CompanyInfo companyInfo);
}
