import 'package:project_shelf_v3/app/dto/company_info_response.dart';
import 'package:project_shelf_v3/domain/entity/company_info.dart';

abstract interface class CompanyInfoService {
  Future<Iterable<CompanyInfoResponse>> get();
  Future<void> set(CompanyInfo companyInfo);
}
