import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_model.g.dart';

@JsonSerializable()
class FeatureModel {
  final String? name;
  final int? id;

  FeatureModel({
    this.name,
    this.id,
  });

  factory FeatureModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureModelFromJson(json);
}
