import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oxidized/oxidized.dart';
import 'package:project_shelf_v3/adapter/dto/ui/company_info_dto.dart';
import 'package:project_shelf_v3/app/use_case/find_file_use_case.dart';
import 'package:project_shelf_v3/app/use_case/get_default_company_logo_use_case.dart';
import 'package:project_shelf_v3/app/use_case/settings/get_company_info_use_case.dart';
import 'package:project_shelf_v3/injectable.dart';

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

  @override
  FutureOr<CompanyInfoState> build() async {
    final companyInfo = await _getCompanyInfoUseCase
        .exec(unit)
        // Unwrap the result.
        // NOTE: We would need to handle the error here, but for not it is fine.
        .then((it) => it.unwrap())
        .map((it) => CompanyInfoDto.fromEntity(it))
        .unwrap();

    return CompanyInfoState(companyInfo: companyInfo);
  }
}

final companyInfoProvider = AsyncNotifierProvider.autoDispose(
  CompanyInfoNotifier.new,
);
