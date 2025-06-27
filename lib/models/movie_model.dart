import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  MovieModel({
    required this.title,
    required this.review,
    required this.watched,
  });

  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: '')
  final String review;
  @JsonKey(defaultValue: false)
  final bool watched;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
