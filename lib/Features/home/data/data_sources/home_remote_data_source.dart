import 'package:bookly/Features/home/data/models/book_model.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import '../../../../core/functions/save_books.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource{
  Future<List<BookEntity>>fetchFeaturedBooks();
  Future<List<BookEntity>>fetchNewestBooks();
}

class HomeRemoteImplementation extends HomeRemoteDataSource{
  final ApiService apiService;
  HomeRemoteImplementation({required this.apiService});

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0}) async{
    var data=await apiService.get(endpoint: 'volumes?Filtering=free-ebooks&q=novels${pageNumber*10}');
    List<BookEntity>books=[];
    for(var book in data["items"]){
      books.add(BookModel.fromJson(book));
    }
    saveBooks(books, kFeaturedBooks);
       return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data=await apiService.get(endpoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=stories');
    List<BookEntity>books=[];
    for(var book in data["items"]){
      books.add(BookModel.fromJson(book));
    }
    saveBooks(books, kNewestBooks);
    return books;
  }
}