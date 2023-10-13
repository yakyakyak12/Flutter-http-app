import 'package:dio/dio.dart';

final dio = Dio();

// 동기함수
void main() async {
  await getHttp(); // Future에 데이터가 찰 때까지 기다린다.
}

// 비동기 함수
Future<void> getHttp() async {
  final response =
      await dio.get('https://dart.dev'); // 값이 나오기 전에는 Future(빈박스)를 준다
  print("1");
  print(response);
  print("2");
}
