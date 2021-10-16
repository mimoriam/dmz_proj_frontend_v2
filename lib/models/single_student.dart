// To parse this JSON data, do
//
//     final singleStudent = singleStudentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SingleStudent singleStudentFromJson(String str) => SingleStudent.fromJson(json.decode(str));

String singleStudentToJson(SingleStudent data) => json.encode(data.toJson());

class SingleStudent {
  SingleStudent({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final dynamic next;
  final dynamic previous;
  final List<Result> results;

  factory SingleStudent.fromJson(Map<String, dynamic> json) => SingleStudent(
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
  final int totalNum;
  final String grade;
  final Subject subject;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    registrationNum: json["registration_num"],
    studentName: json["student_name"],
    totalNum: json["total_num"],
    grade: json["grade"],
    subject: Subject.fromJson(json["subject"]),
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

class Subject {
  Subject({
    required this.id,
    required this.subject,
    required this.year,
  });

  final int id;
  final String subject;
  final Year year;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"],
    subject: json["subject"],
    year: Year.fromJson(json["year"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subject": subject,
    "year": year.toJson(),
  };
}

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
