import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/get_todos.dart';
import 'package:todo_app/data/todo_model.dart';

import 'view_todo.dart';

class HompageScreen extends StatefulWidget {
  const HompageScreen({super.key});

  @override
  State<HompageScreen> createState() => _HompageScreenState();
}

class _HompageScreenState extends State<HompageScreen> {
  List<TodoModel> data = [];

  Future<List<TodoModel>> getData() async {
    var response = await getAllTodo();
    data = response;
    return response;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("All Todo"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 27.w),
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return ListView.builder(
                  itemCount: snapShot.data!.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Text(snapShot.data![index].id.toString()),
                      title: Text(snapShot.data![index].title),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (builder) {
                          return ViewTodo(
                            todo: snapShot.data![index],
                          );
                        }));
                      },
                    );
                  }),
                );
              }

              if (snapShot.hasError) {
                return const Center(child: Text("Unable To fatech Todo's"));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    ));
  }
}
