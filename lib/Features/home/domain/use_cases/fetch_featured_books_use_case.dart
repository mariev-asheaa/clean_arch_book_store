import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';

class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});
  Future<Either<Failure,List<BookEntity>>>fetchFeaturedBooks(){
    //check user permission
    return homeRepo.fetchFeaturedBooks();
  }
}