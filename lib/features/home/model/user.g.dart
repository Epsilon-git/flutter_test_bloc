// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  name: Name.fromJson(json['name'] as Map<String, dynamic>),
  email: json['email'] as String,
  picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'picture': instance.picture,
};

Name _$NameFromJson(Map<String, dynamic> json) => Name(
  title: json['title'] as String,
  first: json['first'] as String,
  last: json['last'] as String,
);

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
  'title': instance.title,
  'first': instance.first,
  'last': instance.last,
};

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
  large: json['large'] as String,
  medium: json['medium'] as String,
  thumbnail: json['thumbnail'] as String,
);

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
  'large': instance.large,
  'medium': instance.medium,
  'thumbnail': instance.thumbnail,
};
