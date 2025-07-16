import 'package:flutter/material.dart';
import '../../data/models/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onSave;

  const BookCard({super.key, required this.book, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Image.network(
              book.imageUrl,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(book.author,
                      style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 8),
                  
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: onSave,
            )
          ],
        ),
      ),
    );
  }
}
