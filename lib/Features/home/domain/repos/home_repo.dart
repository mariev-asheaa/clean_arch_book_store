import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo{
  Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>>fetchNewestBooks();
}

//step 2 in clean arch