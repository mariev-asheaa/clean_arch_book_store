// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bookly/core/injection/dio_module.dart' as _i169;
import 'package:bookly/core/utils/api_service.dart' as _i144;
import 'package:bookly/Features/home/data/data_sources/home_local_data_sources.dart'
    as _i366;
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart'
    as _i355;
import 'package:bookly/Features/home/data/repos/home_repo_implementation.dart'
    as _i814;
import 'package:bookly/Features/home/domain/repos/home_repo.dart' as _i113;
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart'
    as _i274;
import 'package:bookly/Features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart'
    as _i2;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i2.FeaturedBooksCubit>(
        () => _i2.FeaturedBooksCubit(gh<_i274.FetchFeaturedBooksUseCase>()));
    gh.lazySingleton<_i366.HomeLocalDataSource>(
        () => _i366.HomeLocalImplementation());
    gh.singleton<_i144.ApiService>(
        () => _i144.ApiService(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i355.HomeRemoteDataSource>(() =>
        _i355.HomeRemoteImplementation(apiService: gh<_i144.ApiService>()));
    gh.factory<_i113.HomeRepo>(() => _i814.HomeRepoImplementation(
          homeRemoteDataSource: gh<_i355.HomeRemoteDataSource>(),
          homeLocalDataSource: gh<_i366.HomeLocalDataSource>(),
        ));
    return this;
  }
}

class _$DioModule extends _i169.DioModule {}
