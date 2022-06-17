Stream<int> numbersStream(int max)async*{
  for(int i = 0; i  < max; i++){
    await Future.delayed(Duration(milliseconds: 200));
    yield i + 1;
  }
}
Future<int> upStream(int max)async{
    int up = 1;
    Stream<int> stream = numbersStream(max);
    await for(int value in stream){
        print("up: $up");
        up *= value;
    }
    return up;
}