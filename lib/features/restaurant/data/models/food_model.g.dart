// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) => FoodModel(
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      id: json['id'] as int?,
      isFavorite: json['is_favorite'] as bool?,
      categoryName: json['category_name'] as String?,
    );

Map<String, dynamic> _$FoodModelToJson(FoodModel instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'price': instance.price,
      'id': instance.id,
      'category_name': instance.categoryName,
      'is_favorite': instance.isFavorite,
    };
