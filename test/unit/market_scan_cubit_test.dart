import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:marketscan/feature/marketScan/cubit/market_scan_cubit.dart';

import '../mock/mock.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() => HttpOverrides.global = null);
  group('MarketScan Cubit', () {
    test('Load Proper data', () async {
      MarketScanCubit cubit = MarketScanCubit(MockAssetLoader());
      await cubit.init();
      MarketScanState state = cubit.state;
      expect(state.scanData.isNotEmpty, true);
    });

    test('Load improper data', () async {
      MarketScanCubit cubit = MarketScanCubit(MockInvalidData());
      await cubit.init();
      MarketScanState state = cubit.state;
      expect(state.scanData.isEmpty, true);
    });
  });
}
