import 'package:dio/dio.dart';
import 'package:marketscan/utils/logger.dart';

class MarketScanNetworkSerice {
  MarketScanNetworkSerice._();

  static final MarketScanNetworkSerice _instance = MarketScanNetworkSerice._();

  static MarketScanNetworkSerice get instance => _instance;

  static final Dio _dio = Dio();

  Future<Response> get({required String url}) async {
    try {
      return await _dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
    } catch (error, stackTrace) {
      Logger.error('Failed url is $url');
      Logger.error('Dio Request', error, stackTrace);
      rethrow;
    }
  }
}
