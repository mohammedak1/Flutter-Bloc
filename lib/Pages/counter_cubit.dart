import 'package:flutter/material.dart';

import '../cubits/counter_cubit.dart';

class CubitCounterPage extends StatefulWidget {
  const CubitCounterPage({Key? key}) : super(key: key);

  @override
  State<CubitCounterPage> createState() => _CubitCounterPageState();
}

class _CubitCounterPageState extends State<CubitCounterPage> {
  late final Counter counter;

  @override
  void initState() {
    counter = Counter(5);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //return scaffold with counter
    TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 50);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter'),
      ),
      body: Center(
        child: Container(
          child: StreamBuilder(
            stream: counter.stream,
            builder: (context, state){
              if(!state.hasData) return Text("No Data Yet", style: textStyle,);
              return Text("${state.data}", style: textStyle,);
            },
          )
        ),
      ),
      bottomNavigationBar: Container(
        //create a row of buttons
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
              child: Text('Increase'),
              onPressed: () {
                counter.increase();
              },
            ),
            RaisedButton(
              child: Text('Decrease'),
              onPressed: () {
                counter.decrease();
              },
            ),
            RaisedButton(
              child: Text('Dulipcate'),
              onPressed: () {
                counter.dulipcate();
              },
            ),
          ],
        )
      ),
      );
      
  }
}