import 'package:f_202010_provider_get_it/architecture_example/base/base_model.dart';
import 'package:f_202010_provider_get_it/architecture_example/base/base_view.dart';
import 'package:f_202010_provider_get_it/architecture_example/ui/course_detail.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/auth_provider.dart';
import 'package:f_202010_provider_get_it/architecture_example/viewmodels/homemodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => model
                .getCourses(Provider.of<AuthProvider>(context).username,
                    Provider.of<AuthProvider>(context).token)
                .catchError((error) {
              Provider.of<AuthProvider>(context, listen: false).setLogOut();
            }),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Home"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .setLogOut();
                  },
                ),
              ],
            ),
            floatingActionButton: floating(context, model),
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(child: Text('${model.courses.length}')),
                      FlatButton(
                          child: Text('get Detail'),
                          onPressed: () =>
                              getDetail(context, model.courses[0].id))
                    ],
                  ))));
  }

  void getDetail(BuildContext context, int courseId) async {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => CourseDetailView(courseId: courseId)),
    );
  }

  Widget floating(BuildContext context, HomeModel model) {
    return FloatingActionButton(
        onPressed: () => model.addCourse(),
        tooltip: 'Add task',
        child: new Icon(Icons.add));
  }
}
