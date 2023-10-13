import 'package:dio/dio.dart';
import 'package:flutter_http_app/model/user.dart';

// 주소를 매번 안적도록 해줌.
final dio = Dio(BaseOptions(baseUrl: "http://192.168.0.40:8080"));

// 통신과 파싱을 해주는 곳
class UserRepository {
  Future<List<User>> fetchUserList() async {
    Response<dynamic> response = await dio.get("/user");
    print(response.data);

    List<dynamic> bodyList = response.data as List<dynamic>;
    List<User> userList = bodyList.map((e) => User.fromJson(e)).toList();

    return userList;
  }

  Future<User> fetchUser(int id) async {
    Response<dynamic> response = await dio.get("/user/$id");
    print(response.data);

    Map<String, dynamic> body = response.data as Map<String, dynamic>;
    print(body["username"]);

    User user = User.fromJson(body);
    return user;
  }
}
