Stream<int> _counterStream(int max) async*{
  for(int i = 0; i < max; i++){
    await Future.delayed(Duration(milliseconds: 10));
    yield i;
  }
}

Future<int> sumToTheNumber(Stream<int> stream)async{
  int sum = 0;
  await for(int value in stream){
    sum+= value;
    print("some is $sum ");
  }
  return sum;
}





