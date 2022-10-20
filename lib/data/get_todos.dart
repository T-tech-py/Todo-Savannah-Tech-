import "package:http/http.dart" as http;
import "dart:convert";

import 'package:todo_app/data/todo_model.dart';

const String baseUrl = "https://jsonplaceholder.typicode.com/todos";

Future<List<TodoModel>> getAllTodo() async {
  try {
    http.Response data = await http
        .get(Uri.parse(baseUrl), headers: {'Content-Type': 'application/json'});
    if (data.statusCode == 200) {
      print(data.body);
      var decodedJson = jsonDecode(data.body);

      List<TodoModel> response =
          (decodedJson as List).map((e) => TodoModel.fromJson(e)).toList();
      return response;
    }
    return Future.value();
  } catch (e) {
    return Future.error(e);
  }
}
