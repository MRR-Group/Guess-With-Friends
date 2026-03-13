import 'package:guess_with_friends/src/feature/auth/data/data_source/auth_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/network/network_service_provider.dart';

part 'auth_data_source_provider.g.dart';

@riverpod
AuthDataSource repositoryRemoteDataSource(Ref ref) {
  final networkService = ref.watch(networkServiceProvider);
  return AuthDataSourceDataSourceImpl(networkService);
}