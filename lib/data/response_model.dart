// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class ImageFromApi extends Equatable {
  final int id;
  final String title;
  final String? imageUrl;
  final String? thumbnailUrl;
  
  const ImageFromApi({
    required this.id,
    required this.title,
    this.imageUrl,
    this.thumbnailUrl,
  });

  ImageFromApi copyWith({
    int? id,
    String? title,
    String? imageUrl,
    String? thumbnailUrl,
  }) {
    return ImageFromApi(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory ImageFromApi.fromMap(Map<String, dynamic> map) {
    return ImageFromApi(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      thumbnailUrl:
          map['thumbnailUrl'] != null ? map['thumbnailUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageFromApi.fromJson(String source) =>
      ImageFromApi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ImageFromApi(id: $id, title: $title, imageUrl: $imageUrl, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  List<Object?> get props => [id, title, imageUrl, thumbnailUrl];
}
