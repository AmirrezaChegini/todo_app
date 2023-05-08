import 'package:bloc/bloc.dart';

class TaskPriorityCubit extends Cubit<int> {
  TaskPriorityCubit() : super(0);

  int index = 0;

  void choosePriority(int i) {
    index = i;
    emit(index);
  }
}
