import 'package:bookly/Features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

class FeaturedListViewBlocConsumer extends StatefulWidget {
  const FeaturedListViewBlocConsumer({super.key});

  @override
  State<FeaturedListViewBlocConsumer> createState() => _FeaturedListViewBlocConsumerState();
}

class _FeaturedListViewBlocConsumerState extends State<FeaturedListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
        listener: (context, state) {
      if (state is FeaturedBooksSuccess) {
        books.addAll(state.books);
      }
      },
      builder: (context, state) {
        if(state is FeaturedBooksSuccess||state is PaginationLoading){
          return FeaturedBooksListView(books: books,);
        }
     else if(state is FeaturedBooksFailure){
       return Text(state.errorMessage);
        }
     else{
       return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
