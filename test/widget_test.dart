import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youtube/repository/employee_repositoryImpl.dart';
import 'package:youtube/screens/custom_input.dart';

import 'package:youtube/screens/home.dart';

void main() {
  Widget createWidgetForTesting({required Widget child}) {
    return MaterialApp(home: child);
  }

  testWidgets('Find FB button', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      createWidgetForTesting(
        child: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(
              create: (context) => EmployeeRepositoryImpl(),
            ),
          ],
          child: const Home(),
        ),
      ),
    );
    final fb = find.byIcon((Icons.filter_list));
    expect(fb, findsOneWidget);
    final searchWidget = find.byKey((const ValueKey('search_button')));
    expect(searchWidget, findsOneWidget);
    final searchField = find.byType(CustomInput);
    expect(searchField, findsOneWidget);
    await tester.enterText(searchField, "Violet");
    await tester.pumpAndSettle();

    // add a text field (for search)
    // await tester.tap(find.byIcon(Icons.filter_list));
    // await tester.pumpAndSettle();
    // expect(find.text("Hello"), findsOneWidget);
  });
}
