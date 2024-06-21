import 'package:freezed_annotation/freezed_annotation.dart';

import 'feature_model.dart';
import 'food_model.dart';
import 'review_model.dart';

part 'restaurant_model.g.dart';

@JsonSerializable()
class RestaurantModel {
  final int? id;
  final String? name;
  final String? image;
  final String? description;
  final dynamic discount;
  @JsonKey(name: 'promo_code')
  final String? promoCode;
  final String? distance;
  final String? location;
  final double? rate;
  @JsonKey(name: 'reviews_count')
  final int? reviewsCount;
  final List<String>? categories;
  final List<FoodModel>? foods;
  final bool? isFavorite;
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  final List<FeatureModel> features;
  final List<ReviewModel>? reviews;
  final List<String>? images;
  final double? latitude;
  final double? longitude;
  final String? status;
  @JsonKey(name: 'restaurant_type')
  final String? restaurantType;
  final String? time;

  RestaurantModel({
    this.id,
    this.name,
    this.image,
    this.description,
    this.discount,
    this.distance,
    this.location,
    this.rate,
    this.reviewsCount,
    this.categories,
    this.foods,
    this.isFavorite,
    this.isVerified,
    this.features = const [],
    this.reviews = const [],
    this.images,
    this.latitude,
    this.longitude,
    this.status,
    this.restaurantType,
    this.time,
    this.promoCode,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);
}
