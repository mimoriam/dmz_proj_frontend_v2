import 'dart:convert';

import 'package:dmz_proj_frontend/models/manual_student.dart';
import 'package:http/http.dart' as http;

/// Models:
import 'package:dmz_proj_frontend/models/student.dart';
import 'package:dmz_proj_frontend/models/single_student.dart';

/// Screens:

/// Widgets:

/// Services:

/// State:

/// Utils/Helpers:

/// Entry Point:
class RESTClient {
  String uri;

  RESTClient({required this.uri});

  //@GET:
  Future<List<Student>?> getAllStudents() async {
    final response = await http.get(
      Uri.parse(uri),
      // headers: {
      //   'Content-type': 'application/json',
      //   'Accept': 'application/json',
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      // },
    );
    try {
      if (response.statusCode == 200) {
        final manualStudent = manualStudentFromJson(response.body);
        print(manualStudent.results[1].registrationNum);
        // print(json.decode(response.body));
        // final studentData = Student.fromJson(json.decode(response.body));
        // print(studentData.results[0].studentName);
        // print(studentData.results);
        // print(studentData);

      }
    } catch (e) {
      rethrow;
    }
  }

  //@GET (1):
  Future<SingleStudent?> getSearchedStudent() async {
    final response = await http.get(
      Uri.parse(uri),
      // headers: {
      //   'Content-type': 'application/json',
      //   'Accept': 'application/json',
      //   "Access-Control-Allow-Origin": "*",
      //   "Access-Control-Allow-Methods": "POST, GET, OPTIONS, PUT, DELETE, HEAD",
      // },
    );
    try {
      if (response.statusCode == 200) {
        final singleStudent = singleStudentFromJson(response.body);
        return singleStudent;
      }
    } catch (e) {
      rethrow;
    }
  }
}
