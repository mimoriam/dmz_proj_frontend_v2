// To parse this JSON data, do
//
//     final manualStudent = manualStudentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ManualStudent manualStudentFromJson(String str) => ManualStudent.fromJson(json.decode(str));

String manualStudentToJson(ManualStudent data) => json.encode(data.toJson());

class ManualStudent {
  ManualStudent({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final List<Result> results;

  factory ManualStudent.fromJson(Map<String, dynamic> json) => ManualStudent(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

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
  final String registrationNum;
  final String studentName;
  final double totalNum;
  final String grade;
  final SubjectClass subject;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        registrationNum: json["registration_num"],
        studentName: json["student_name"],
        totalNum: json["total_num"],
        grade: json["grade"],
        subject: SubjectClass.fromJson(json["subject"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "registration_num": registrationNum,
        "student_name": studentName,
        "total_num": totalNum,
        "grade": grade,
        "subject": subject.toJson(),
      };
}

class SubjectClass {
  SubjectClass({
    required this.id,
    required this.subject,
    required this.year,
  });

  final int id;
  final SubjectEnum subject;
  final Year year;

  factory SubjectClass.fromJson(Map<String, dynamic> json) => SubjectClass(
        id: json["id"],
        subject: subjectEnumValues.map[json["subject"]] as SubjectEnum,
        year: Year.fromJson(json["year"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subjectEnumValues.reverse![subject],
        "year": year.toJson(),
      };
}

enum SubjectEnum { APPLIED_CHEMISTRY_LAB }

final subjectEnumValues = EnumValues({"Applied Chemistry Lab": SubjectEnum.APPLIED_CHEMISTRY_LAB});

class Year {
  Year({
    required this.id,
    required this.year,
  });

  final int id;
  final int year;

  factory Year.fromJson(Map<String, dynamic> json) => Year(
        id: json["id"],
        year: json["year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "year": year,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
