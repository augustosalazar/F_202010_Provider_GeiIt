import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'architecture_example/locator.dart';
import 'architecture_example/models/user.dart';
import 'architecture_example/services/authentication_service.dart';
import 'architecture_example/ui/login_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
      updateShouldNotify: (_, __) {
                print('updateShouldNotify');
                return true;
              },
      initialData: User.initial(),
      create: (BuildContext context) =>
          locator<AuthenticationService>().userController.stream,
      child: MaterialApp(
        title: 'Flutter Demo',
         home: LoginView(),
      ),
    );
  }
}

