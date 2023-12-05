import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketscan/feature/marketScan/models/market_scan.dart';
import 'package:marketscan/interface/fetch_data.dart';
import 'package:marketscan/utils/logger.dart';

part 'market_scan_state.dart';

class MarketScanCubit extends Cubit<MarketScanState> {
  MarketScanCubit(this._fetchData) : super(const MarketScanState(scanData: []));
  final FetchData _fetchData;

  Future<void> init() async {
    try {
      List data = await _fetchData.loadJson();

      List<MarketScan> scanData = [];

      for (Map<String, dynamic> item in data) {
        scanData.add(MarketScan.fromJson(item));
      }
      emit(state.copyWith(data: scanData));
    } catch (e) {
      Logger.error(e.toString());
      emit(state.copyWith(data: []));
    }
  }
}
