
import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/course.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/couses_service.dart';

import '../locator.dart';

class HomeModel extends BaseModel {
  CourseService _couseService = locator<CourseService>();

  List<Course> get courses => _couseService.couses;

  Future getCourses(String user, String token) async {
    setState(ViewState.Busy);
    _couseService.getCourses(user, token).catchError((error) {
        return Future.error(error);
      });
    setState(ViewState.Idle);
  }

  Future addCourse() async {
    setState(ViewState.Busy);
    await _couseService.addCourse();
    setState(ViewState.Idle);
  }
}