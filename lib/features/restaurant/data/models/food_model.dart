import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  final String? name;
  final String? image;
  final String? description;
  final double? price;
  final int? id;
  @JsonKey(name: 'category_name')
  final String? categoryName;
  @JsonKey(name: 'is_favorite')
  bool? isFavorite;

  FoodModel({
    this.name,
    this.image,
    this.description,
    this.price,
    this.id,
    this.isFavorite,
    this.categoryName,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
