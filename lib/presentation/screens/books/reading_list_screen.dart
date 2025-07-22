import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../data/models/book.dart';
import '../../../logic/cubits/book_cubit.dart';
import  '/ui/components/app_app_bar.dart';

class ReadingListScreen extends StatelessWidget {
  const ReadingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const AppAppBar(
        title: 'My Reading List',
        showBack: true,
      ),
      body: BlocBuilder<BookCubit, List<Book>>(
        builder: (context, books) {
          final savedBooks = books.where((b) => b.isBookmarked).toList();

          if (savedBooks.isEmpty) {
            return Center(
              child: Text(
                'No saved books yet.',
                style: theme.textTheme.bodyMedium,
              ),
            );
          }

          return ListView.builder(
            itemCount: savedBooks.length,
            itemBuilder: (context, index) {
              final book = savedBooks[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 1,
                  color: theme.cardColor,
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 72,
                      color: theme.colorScheme.secondary.withOpacity(0.1),
                      child: Center(
                        child: Text(
                          "Book\nCover",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                    ),
                    title: Text(
                      book.title,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      book.author,
                      style: theme.textTheme.bodySmall,
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        book.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                        color: book.isBookmarked
                            ? theme.colorScheme.primary
                            : theme.iconTheme.color,
                      ),
                      onPressed: () {
                        context.read<BookCubit>().toggleBookmark(book);
                      },
                    ),
                    onTap: () {
                      context.push('/book/${book.id}');
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
