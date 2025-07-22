import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/models/book.dart';
import '/logic/cubits/book_cubit.dart';

class AppBookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;

  const AppBookCard({
    super.key,
    required this.book,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 1,
      color: theme.cardColor,
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 48,
          height: 72,
          decoration: BoxDecoration(
            color: colorScheme.secondary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
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
          style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          book.author,
          style: theme.textTheme.bodySmall,
        ),
        trailing: IconButton(
          icon: Icon(
            book.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            color: book.isBookmarked
                ? colorScheme.primary
                : theme.iconTheme.color,
          ),
          onPressed: () {
            context.read<BookCubit>().toggleBookmark(book);
          },
        ),
      ),
    );
  }
}
