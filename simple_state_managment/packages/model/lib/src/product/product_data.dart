import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_data.freezed.dart';

@freezed
class ProductData with _$ProductData {
  const factory ProductData({
    required int id,
    required String name,
  }) = _ProductData;
}