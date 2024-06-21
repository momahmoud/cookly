// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      id: json['id'] as int?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      time: json['created_at'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'image': instance.image,
      'description': instance.description,
      'created_at': instance.time,
      'rating': instance.rating,
    };
