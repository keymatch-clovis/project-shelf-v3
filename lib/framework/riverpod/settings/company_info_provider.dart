import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/dto/ui/company_info_dto.dart';
import 'package:project_shelf_v3/app/use_case/find_file_use_case.dart';
import 'package:project_shelf_v3/app/use_case/get_default_company_logo_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/get_company_info_use_case.dart';
import 'package:project_shelf_v3/main.dart';

part 'company_info_provider.freezed.dart';

// State related
@freezed
abstract class CompanyInfoState with _$CompanyInfoState {
  const factory CompanyInfoState({required CompanyInfoDto companyInfo}) =
      _CompanyInfoState;
}

// Provider related
final class CompanyInfoNotifier extends AsyncNotifier<CompanyInfoState> {
  final _getCompanyInfoUseCase = getIt.get<GetCompanyInfoUseCase>();
  final _getDefaultCompanyLogoUseCase = getIt
      .get<GetDefaultCompanyLogoUseCase>();
  final _findFileUseCase = getIt.get<FindFileUseCase>();

  @override
  FutureOr<CompanyInfoState> build() async {
    final companyInfo = await _getCompanyInfoUseCase.exec().then((it) async {
      Uint8List? logoBytes;
      if (it.logoFileName != null) {
        logoBytes = await _findFileUseCase
            .exec(it.logoFileName!)
            .then((it) => it.readAsBytes());
      } else {
        logoBytes = await _getDefaultCompanyLogoUseCase.exec().then(
          (it) => it.bytes,
        );
      }

      return CompanyInfoDto(
        logoBytes: logoBytes,
        name: it.name,
        document: it.document,
        email: it.email,
        phone: it.phone,
      );
    });

    return CompanyInfoState(companyInfo: companyInfo);
  }
}

final companyInfoProvider = AsyncNotifierProvider.autoDispose(
  CompanyInfoNotifier.new,
);
