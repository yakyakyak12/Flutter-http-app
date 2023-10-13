import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

final dio = Dio();

void main() async {
  await fetchUserList_test();
}

Future<List<User>> fetchUserList_test() async {
  Response<dynamic> response = await dio.get("http://192.168.0.20:8080/user");
  print(response.data);

  List<dynamic> bodyList = response.data as List<dynamic>;
  List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();

  return userList;
}

Future<User> fetchUser_test(int id) async {
  Response<dynamic> response =
      await dio.get("http://192.168.0.40:8080/user/$id");
  print(response.data);

  Map<String, dynamic> body = response.data as Map<String, dynamic>;
  print(body["username"]);

  User user = User.fromJson(body);
  return user;
}
