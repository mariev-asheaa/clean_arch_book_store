part of 'featured_books_cubit.dart';

@immutable
 class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class PaginationLoading extends FeaturedBooksState {}

class PaginationFailure extends FeaturedBooksState {
  final String errorMessage;

  PaginationFailure({required this.errorMessage});

}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity>books;

  FeaturedBooksSuccess({required this.books});

}
class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;

  FeaturedBooksFailure({required this.errorMessage});

}