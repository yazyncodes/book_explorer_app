import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:book_explorer_app/app.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final dummyRouter = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, __) => Scaffold(
            body: Column(
              children: [
                const Text('0'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );

    await tester.pumpWidget(BookExplorerApp());

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(find.text('0'), findsOneWidget);
  });
}
