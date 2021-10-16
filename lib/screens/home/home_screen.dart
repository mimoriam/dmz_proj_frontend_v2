import 'package:dmz_proj_frontend/models/single_student.dart';
import 'package:dmz_proj_frontend/models/student.dart';
import 'package:flutter/material.dart';

/// Models:

/// Screens:

/// Widgets:

/// Services:
import 'package:dmz_proj_frontend/services/api_service.dart';

/// State:

/// Utils/Helpers:
import '../../utils/responsive_helper.dart';
import 'package:dmz_proj_frontend/constants/constants.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

/// Entry Point:
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<SingleStudent?> studentData;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    studentData = RESTClient(uri: kBackendSearchURL4).getSearchedStudent();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: ResponsiveHelper(
          mobile: Container(),
          tablet: Container(),
          desktop: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Builder(builder: (BuildContext context) {
              return SingleChildScrollView(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'search_query',
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(context),
                        ]),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: "Search",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          labelStyle: const TextStyle(),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          _formKey.currentState?.save();
                          if (_formKey.currentState!.validate()) {
                            print(kBackendSearchURL3 + '${_formKey.currentState?.fields['search_query']?.value}');
                            studentData = RESTClient(
                                    uri: kBackendSearchURL3 + '${_formKey.currentState?.fields['search_query']?.value}')
                                .getSearchedStudent();
                            // RESTClient(uri: kBackendURL3).getAllStudents();
                          } else {
                            print("Validation Failed!");
                          }
                        },
                        child: Text("Submit"),
                      ),
                      FutureBuilder<SingleStudent?>(
                        future: studentData,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            SingleStudent? data = snapshot.data;
                            if (data!.results[0].studentName == "TestUserName") {
                              return Container(
                                child: Text(""),
                              );
                            }
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Text("${data.results[0].studentName}"),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Container(
                            child: Text("Nothing"),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
