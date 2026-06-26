import 'package:agrilink_edge/app/bootstrap/bootstrap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AgriLink Edge smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: AgriLinkEdgeApp(),
      ),
    );
    expect(find.byType(AgriLinkEdgeApp), findsOneWidget);
  });
}
