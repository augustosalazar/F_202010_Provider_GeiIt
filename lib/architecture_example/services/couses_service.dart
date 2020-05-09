import 'package:f_202010_provider_get_it/architecture_example/models/course.dart';

import '../locator.dart';
import 'api.dart';

class CourseService {
  Api _api = locator<Api>();

  String _user;
  String _token;
  List<Course> _couses;
  List<Course> get couses => _couses;

  Future getCourses(String username, String token) async {
    _user = username;
    _token = token;
    _couses = await _api.getCourses(username, token);
  }

  Future addCourse() async {
    Course course = await _api.addCourseService(_user, _token);
    _couses.add(course);
  }

} 