import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:basic_mvvm/viewmodel/user_list_viewmodel.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: userViewModel.users.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: userViewModel.users.length,
              itemBuilder: (context, index) {
                final user = userViewModel.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                );
              },
            ),
    );
  }
}
