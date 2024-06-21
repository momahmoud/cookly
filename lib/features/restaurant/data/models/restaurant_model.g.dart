// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RestaurantModel _$RestaurantModelFromJson(Map<String, dynamic> json) =>
    RestaurantModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      discount: json['discount'],
      distance: json['distance'] as String?,
      location: json['location'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      reviewsCount: json['reviews_count'] as int?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      foods: (json['foods'] as List<dynamic>?)
          ?.map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFavorite: json['isFavorite'] as bool?,
      isVerified: json['is_verified'] as bool?,
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => FeatureModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      status: json['status'] as String?,
      restaurantType: json['restaurant_type'] as String?,
      time: json['time'] as String?,
      promoCode: json['promo_code'] as String?,
    );

Map<String, dynamic> _$RestaurantModelToJson(RestaurantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'discount': instance.discount,
      'promo_code': instance.promoCode,
      'distance': instance.distance,
      'location': instance.location,
      'rate': instance.rate,
      'reviews_count': instance.reviewsCount,
      'categories': instance.categories,
      'foods': instance.foods,
      'isFavorite': instance.isFavorite,
      'is_verified': instance.isVerified,
      'features': instance.features,
      'reviews': instance.reviews,
      'images': instance.images,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'restaurant_type': instance.restaurantType,
      'time': instance.time,
    };
