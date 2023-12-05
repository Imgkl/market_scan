import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'market_scan.g.dart';

typedef Criteria = List<Map<String, dynamic>>;

@JsonSerializable()
class MarketScan extends Equatable {
  final int id;
  final String name;
  final String tag;
  @ColorConverter()
  final Color color;
  final Criteria criteria;

  const MarketScan(
      {required this.id,
      required this.name,
      required this.tag,
      required this.color,
      required this.criteria});

  @override
  List<Object> get props => [id, name, tag, color, criteria];

  factory MarketScan.fromJson(Map<String, dynamic> json) =>
      _$MarketScanFromJson(json);

  @override
  String toString() {
    return 'MarketScan(id: $id, name: $name, tag: $tag, color: $color, criteria: $criteria)';
  }
}

class ColorConverter implements JsonConverter<Color, String> {
  const ColorConverter();

  @override
  Color fromJson(String json) {
    switch (json) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      default:
        return Colors.white;
    }
  }

  @override
  String toJson(Color object) {
    throw UnimplementedError();
  }
}
