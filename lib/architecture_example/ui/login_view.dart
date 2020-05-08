import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/models/user.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                  child: FlatButton(
                      child: Text("Login"),
                      onPressed: () async {
                        var loginSuccess = await model.login();
                        if (loginSuccess) {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomeView()),
                          );
                         String username =   Provider.of<User>(context, listen: false).name;
                         print('Login ok $username');
                        }
                      }),
                )));
  }
}
