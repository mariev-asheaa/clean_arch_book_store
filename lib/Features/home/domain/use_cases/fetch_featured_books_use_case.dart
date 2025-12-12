import 'package:bookly/Features/home/domain/repos/home_repo.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/use_cases/use_case.dart';

class FetchFeaturedBooksUseCase extends UseCase{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, dynamic>> call([pageNumber=0]) async{
    //check user permission
    return await homeRepo.fetchFeaturedBooks();
  }

}