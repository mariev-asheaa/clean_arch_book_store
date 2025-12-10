import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/use_cases/no_param_use_case.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase extends UseCase{
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure,List<BookEntity>>>call()async{
    //check user permission
    return await homeRepo.fetchFeaturedBooks();
  }
}