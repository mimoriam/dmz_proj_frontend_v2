import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

part 'student.g.dart';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));
String studentToJson(Student data) => json.encode(data.toJson());

@JsonSerializable(explicitToJson: true)
class Student {
  Student({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<Result> results;

  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);
  Map<String, dynamic> toJson() => _$StudentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Result {
  Result({
    required this.id,
    required this.registrationNum,
    required this.studentName,
    required this.totalNum,
    required this.grade,
    required this.subject,
  });

  final int id;
  final String? registrationNum;
  final String? studentName;
  final double? totalNum;
  final String? grade;
  final SubjectClass subject;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubjectClass {
  SubjectClass({
    required this.id,
    required this.subject,
    required this.year,
  });

  final int id;
  final String subject;
  final Year year;

  factory SubjectClass.fromJson(Map<String, dynamic> json) => _$SubjectClassFromJson(json);
  Map<String, dynamic> toJson() => _$SubjectClassToJson(this);
}

// enum SubjectEnum { APPLIED_CHEMISTRY_LAB, Stoichiometry }

@JsonSerializable(explicitToJson: true)
class Year {
  Year({
    required this.id,
    required this.year,
  });

  final int id;
  final int year;

  factory Year.fromJson(Map<String, dynamic> json) => _$YearFromJson(json);
  Map<String, dynamic> toJson() => _$YearToJson(this);
}
