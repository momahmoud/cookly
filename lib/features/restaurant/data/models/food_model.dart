import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  final String? name;
  final String? image;
  final String? description;
  final double? price;
  final int? id;
  final List<String>? category;
  @JsonKey(name: 'is_favorite')
  final bool? isFavorite;

  FoodModel({
    this.name,
    this.image,
    this.description,
    this.price,
    this.id,
    this.category,
    this.isFavorite,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
