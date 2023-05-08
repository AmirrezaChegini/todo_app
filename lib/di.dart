import 'package:get_it/get_it.dart';
import 'package:todo_app/data/data_sources/task_datasource.dart';

var locator = GetIt.I;

Future<void> initLocator() async {
  locator.registerSingleton<TaskDatasource>(TaskLocal());
}
