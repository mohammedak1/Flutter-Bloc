import 'dart:math';

import 'package:bloc/bloc.dart';

class RandomNameCubit extends Cubit<String?> {
  RandomNameCubit() : super(null);
  List names = ['John', 'Jane', 'Mary', 'Bob', 'Alice', 'Sue', 'Joe'];


  Future startRandomNameEmit() async{
    for(;;){
      await Future.delayed(Duration(milliseconds: 500));
      emit(_getRandomName());
    }
  }
  void getRandomName() => emit(_getRandomName());
  
  void deleteName(String name) {
    names.remove(name);
    emit(names.toString());
  }
  void addName(String name) {
    names.add(name);
    emit(name.toString());
  }

  //get rnadom name function
  String _getRandomName() {
    return names.elementAt(Random().nextInt(names.length));
  }

}