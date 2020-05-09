


import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/services/authentication_service.dart';

import '../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
    Future<bool> login() async {
    setState(ViewState.Busy);

    var success = await _authenticationService.login('a@a.com','123456');

  
    setState(ViewState.Idle);
    return success;
  }
}