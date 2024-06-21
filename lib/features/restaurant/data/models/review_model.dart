import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  final int? id;
  final String? username;
  final String? image;
  final String? description;
  @JsonKey(name: 'created_at')
  final String? time;
  final double? rating;

  ReviewModel({
    this.id,
    this.username,
    this.image,
    this.description,
    this.time,
    this.rating,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
