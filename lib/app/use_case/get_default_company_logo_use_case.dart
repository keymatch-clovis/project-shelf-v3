import 'package:project_shelf_v3/app/service/asset_service.dart';
import 'package:project_shelf_v3/domain/entity/company_logo.dart';
import 'package:project_shelf_v3/main.dart';

final class GetDefaultCompanyLogoUseCase {
  final _assetService = getIt.get<AssetService>();

  Future<CompanyLogo> exec() async {
    return _assetService.getDefaultLogo().then((it) {
      return CompanyLogo(bytes: it);
    });
  }
}
