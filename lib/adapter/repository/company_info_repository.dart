import 'package:project_shelf_v3/adapter/dto/object_box/company_info_dto.dart';

abstract interface class CompanyInfoRepository {
  Future<Iterable<CompanyInfoDto>> get();
}
