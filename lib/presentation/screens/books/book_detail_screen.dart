import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/models/book.dart';
import '/logic/cubits/book_cubit.dart';
import '/ui/components/app_app_bar.dart';
import '/ui/components/app_button.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isSaved = context.select<BookCubit, bool>(
      (cubit) => cubit.state.firstWhere((b) => b.id == book.id).isBookmarked,
    );

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const AppAppBar(
        title: 'Book Details',
        showBack: true,
        actions: [
          Icon(Icons.share),
          SizedBox(width: 12),
          Icon(Icons.more_vert),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const SizedBox(height: 24),

            // Book Cover
            Center(
              child: Container(
                width: 160,
                height: 220,
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text("Book Cover", style: textTheme.bodyMedium),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Title and Author
            Center(
              child: Column(
                children: [
                  Text(book.title,
                      style: textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 4),
                  Text("by ${book.author}",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.6),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Static Rating
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Icon(Icons.star_half, color: Colors.amber, size: 20),
                  const Icon(Icons.star_border, color: Colors.amber, size: 20),
                  const SizedBox(width: 8),
                  Text('4.2 (1,288 ratings)',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.6),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Start Reading + Bookmark
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: 'Start Reading',
                    onPressed: () {
                      // reading logic (later)
                    },
                  ),
                ),
                const SizedBox(width: 12),
                IconButton(
                  icon: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved
                        ? colorScheme.primary
                        : theme.iconTheme.color?.withOpacity(0.5),
                  ),
                  onPressed: () {
                    context.read<BookCubit>().toggleBookmark(book);
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Summary
            Text('Summary',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 8),
            Text(
              book.summary,
              style: textTheme.bodyLarge?.copyWith(height: 1.5),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
