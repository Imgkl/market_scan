// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_scan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketScan _$MarketScanFromJson(Map<String, dynamic> json) => MarketScan(
      id: json['id'] as int,
      name: json['name'] as String,
      tag: json['tag'] as String,
      color: const ColorConverter().fromJson(json['color'] as String),
      criteria: (json['criteria'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );
