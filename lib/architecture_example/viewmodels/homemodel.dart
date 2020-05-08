
import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/course.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/course_detail.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/api.dart';

import '../locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Course> courses;
  String _user;
  String _token;

  Future getCourses(String user, String token) async {
    _user = user;
    _token = token;
    setState(ViewState.Busy);
    courses = await _api.getCourses(user, token);
    setState(ViewState.Idle);
  }

    Future<CourseDetail> getCourse(int courseId) async {
    setState(ViewState.Busy);
    CourseDetail course = await _api.getCourse(_user, _token,courseId);
    setState(ViewState.Idle);
    return Future.value(course);
  }

  Future addCourse() async {
    setState(ViewState.Busy);
    Course course = await _api.addCourseService(_user, _token);
    courses.add(course);
    setState(ViewState.Idle);
  }
}