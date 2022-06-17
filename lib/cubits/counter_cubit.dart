import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter(int initState): super(initState);
  
  void increase() => emit(state + 1);

  void decrease() => emit(state - 1);

  void dulipcate() => emit(state * 2);


 @override
 void onChange(Change<int> change) {
    print("the change: $change");
    super.onChange(change);
  }
}