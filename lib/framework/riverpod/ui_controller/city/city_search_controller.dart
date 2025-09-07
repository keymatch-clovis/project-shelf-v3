import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_shelf_v3/app/entity/city.dart';
import 'package:project_shelf_v3/framework/riverpod/use_case_provider.dart';

final citySearchProvider = StreamProvider.autoDispose
    .family<List<City>, String>((ref, query) {
      return ref.watch(searchCitiesUseCaseProvider).exec(query);
    });
