part of 'market_scan_cubit.dart';

class MarketScanState extends Equatable {
  const MarketScanState({required this.scanData});

  final List<MarketScan> scanData;

  MarketScanState copyWith({
    List<MarketScan>? data,
  }) {
    MarketScanState d = MarketScanState(
      scanData: data ?? scanData,
    );
    return d;
  }

  @override
  List<Object?> get props => [scanData];
}
