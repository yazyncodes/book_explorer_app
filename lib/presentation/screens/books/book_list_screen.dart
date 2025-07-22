import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '/data/models/book.dart';
import '/logic/cubits/book_cubit.dart';
import '/ui/components/app_book_card.dart';
import '/ui/components/app_choice_chip.dart';
import '/ui/components/app_app_bar.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  String selectedCategory = 'All';

  final List<String> categories = ['All', 'Fiction', 'Non-Fiction', 'Fantasy'];

  List<Book> get filteredBooks {
    final allBooks = context.watch<BookCubit>().state;
    if (selectedCategory == 'All') return allBooks;
    return allBooks.where((book) => book.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: const AppAppBar(
        title: 'Bookworm',
        showBack: false,
        showThemeToggle: true,
        showSearch: true,
        showProfile: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title & Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover New Books',
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'Find your next great read from our collection.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Category Chips
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = category == selectedCategory;

                return AppChoiceChip(
                  label: category,
                  selected: isSelected,
                  onSelected: () {
                    setState(() => selectedCategory = category);
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 16),

          // Book List
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                final book = filteredBooks[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
                  child: AppBookCard(
                    book: book,
                    onTap: () => context.push('/book/${book.id}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
