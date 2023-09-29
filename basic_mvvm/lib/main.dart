import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basic_mvvm/view/user_list_view.dart';
import 'package:basic_mvvm/viewmodel/user_list_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserListViewModel(),
      child: MaterialApp(
        title: 'MVVM Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserListView(),
      ),
    );
  }
}
