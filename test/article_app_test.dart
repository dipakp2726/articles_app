import 'package:articles_app/article_app.dart';
import 'package:articles_app/features/article/view/widgets/article_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('render article List', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: ArticlesApp()));

    await tester.pumpAndSettle();

    expect(find.byType(ArticleList), findsOneWidget);
    expect(find.text('Flutter Articles'), findsOneWidget);
  });
}
