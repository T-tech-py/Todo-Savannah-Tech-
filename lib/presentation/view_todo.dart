import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/data/todo_model.dart';

class ViewTodo extends StatelessWidget {
  const ViewTodo({super.key, required this.todo});

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.id.toString()),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text("Task:"),
            SizedBox(height: 18.h),
            Text(
              todo.title,
              style: TextStyle(
                fontSize: 22.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              todo.completed ? "Completed" : "Not Completed",
              style: TextStyle(
                fontSize: 18.sp,
                color: todo.completed ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
