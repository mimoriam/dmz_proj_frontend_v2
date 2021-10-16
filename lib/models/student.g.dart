// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      id: json['id'] as int,
      registrationNum: json['registrationNum'] as String?,
      studentName: json['studentName'] as String?,
      totalNum: (json['totalNum'] as num?)?.toDouble(),
      grade: json['grade'] as String?,
      subject: SubjectClass.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'registrationNum': instance.registrationNum,
      'studentName': instance.studentName,
      'totalNum': instance.totalNum,
      'grade': instance.grade,
      'subject': instance.subject,
    };

SubjectClass _$SubjectClassFromJson(Map<String, dynamic> json) => SubjectClass(
      id: json['id'] as int,
      subject: json['subject'] as String,
      year: Year.fromJson(json['year'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectClassToJson(SubjectClass instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'year': instance.year,
    };

Year _$YearFromJson(Map<String, dynamic> json) => Year(
      id: json['id'] as int,
      year: json['year'] as int,
    );

Map<String, dynamic> _$YearToJson(Year instance) => <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
    };
