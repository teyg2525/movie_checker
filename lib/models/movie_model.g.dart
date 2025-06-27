// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
  title: json['title'] as String? ?? '',
  review: json['review'] as String? ?? '',
  watched: json['watched'] as bool? ?? false,
);

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'review': instance.review,
      'watched': instance.watched,
    };
