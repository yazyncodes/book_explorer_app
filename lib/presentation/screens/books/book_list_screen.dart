import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/data/models/book.dart';
import '/logic/cubits/book_cubit.dart';
import 'package:go_router/go_router.dart';

class BookListScreen extends StatefulWidget {
  const BookListScreen({super.key});

  @override
  State<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  String selectedCategory = 'All';

  List<String> categories = ['All', 'Fiction', 'Non-Fiction', 'Fantasy'];

  List<Book> get filteredBooks {
    final allbooks = context.watch<BookCubit>().state;
    if (selectedCategory == 'All') return allbooks;
    return allbooks.where((book) => book.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FC),
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.menu_book_outlined, size: 28),
                  const SizedBox(width: 8),
                  const Text(
                    'Bookworm',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  const Icon(Icons.search),
                  const SizedBox(width: 16),
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ],
              ),
            ),

            // Title & Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Discover New Books',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Find your next great read from our collection.',
                    style: TextStyle(color: Colors.black54),
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

                  return ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() => selectedCategory = category);
                    },
                    selectedColor: Colors.black87,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
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
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 1,
                      child: ListTile(
                        onTap: () {
                             context.push('/book/${book.id}');
                                },

                        leading: Container(
                          width: 48,
                          height: 72,
                          color: Colors.grey.shade300,
                          child: const Center(
                            child: Text("Book\nCover", textAlign: TextAlign.center),
                          ),
                        ),
                        title: Text(
                          book.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(book.author),
                        trailing: IconButton(
                          icon: Icon(
                            book.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                            color: book.isBookmarked ? Colors.blue : Colors.grey,
                          ),
                          onPressed: () => context.read<BookCubit>().toggleBookmark(book),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
