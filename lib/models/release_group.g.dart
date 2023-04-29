// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReleaseGroup _$$_ReleaseGroupFromJson(Map<String, dynamic> json) =>
    _$_ReleaseGroup(
      secondaryTypes: json['secondaryTypes'] as List<dynamic>,
      primaryTypeId: json['primaryTypeId'] as String,
      id: json['id'] as String,
      primaryType: json['primaryType'] as String,
      disambiguation: json['disambiguation'] as String,
      secondaryTypeIds: json['secondaryTypeIds'] as List<dynamic>,
      firstReleaseDate: json['firstReleaseDate'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$_ReleaseGroupToJson(_$_ReleaseGroup instance) =>
    <String, dynamic>{
      'secondaryTypes': instance.secondaryTypes,
      'primaryTypeId': instance.primaryTypeId,
      'id': instance.id,
      'primaryType': instance.primaryType,
      'disambiguation': instance.disambiguation,
      'secondaryTypeIds': instance.secondaryTypeIds,
      'firstReleaseDate': instance.firstReleaseDate,
      'title': instance.title,
    };
