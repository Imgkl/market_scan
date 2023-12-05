import 'package:dio/dio.dart';
import 'package:marketscan/service/network_service.dart';

abstract class FetchData {
  Future<List> loadJson();
}

class DefaultLoadJson implements FetchData {
  @override
  Future<List> loadJson() async {
    Response data = await MarketScanNetworkSerice.instance
        .get(url: "http://coding-assignment.bombayrunning.com/data.json");

    return data.data;
  }
}
