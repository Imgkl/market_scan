import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marketscan/feature/marketScan/cubit/market_scan_cubit.dart';
import 'package:marketscan/screens/app.dart';
import 'package:marketscan/screens/details.dart';

import '../mock/mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);

  testWidgets('App Rendering', (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider(
        create: (_) => MarketScanCubit(MockAssetLoader())..init(),
        child: const MaterialApp(
          home: App(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byWidget(const CircularProgressIndicator()), findsNothing);
  });

  testWidgets('Details Screen Rendering', (WidgetTester tester) async {
    Map<String, dynamic> data = {
      "type": "value",
      "values": [1.5, 0.5, 1, 2, 3]
    };

    await tester.pumpWidget(
      MaterialApp(
        home: Details(data: data),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('1.5'), findsOneWidget);
    expect(find.text('0.5'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });
}
