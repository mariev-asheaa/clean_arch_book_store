import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repos/home_repo.dart';
import '../../../../core/use_cases/no_param_use_case.dart';

class FetchNewestBooksUseCase extends UseCase{
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});
  @override
  Future<Either<Failure,List<BookEntity>>>call()async{
    return await homeRepo.fetchNewestBooks();
  }
}