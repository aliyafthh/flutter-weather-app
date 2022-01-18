import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task = await task2();
  task3(task);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threesecs = Duration(seconds: 3);
  String result = '';
  await Future.delayed(threesecs, (){
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;

}

void task3(String task2) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2');
}