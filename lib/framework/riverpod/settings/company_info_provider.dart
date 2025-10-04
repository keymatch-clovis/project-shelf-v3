import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:project_shelf_v3/adapter/dto/ui/company_info_dto.dart';
import 'package:project_shelf_v3/app/use_case/find_file_use_case.dart';
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
  final _findFileUseCase = getIt.get<FindFileUseCase>();

  @override
  FutureOr<CompanyInfoState> build() async {
    final response = await _getCompanyInfoUseCase.exec();
    final logoBytes = await _findFileUseCase
        .exec(response.logoFileName!)
        .then((it) => it.readAsBytes());

    final companyInfo = CompanyInfoDto(
      logoBytes: logoBytes,
      name: response.name,
      document: response.document,
      email: response.email,
      phone: response.phone,
    );

    return CompanyInfoState(companyInfo: companyInfo);
  }
}

final companyInfoProvider = AsyncNotifierProvider.autoDispose(
  CompanyInfoNotifier.new,
);
