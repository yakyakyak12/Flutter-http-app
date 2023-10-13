import 'package:flutter/material.dart';
import 'package:flutter_http_app/model/user.dart';
import 'package:flutter_http_app/repository/user_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        // 안해주면 파싱해야함
        future: UserRepository().fetchUserList(),
        builder: (context, snapshot) {
          print("그림 그려짐!!!!!!!!!");
          if (snapshot.hasData) {
            // 있다면 통신이 끝남
            List<User> userList =
                snapshot.data ?? []; // 통신이 끝난 후 null이 올 수 있기 때문에
            return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${userList[index].id}"),
                  title: Text("${userList[index].username}"),
                  subtitle: Text("${userList[index].email}"),
                );
              },
            );
          } else {
            // 없다면 통신중이다.
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
