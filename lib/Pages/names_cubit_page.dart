//page where we show in the center the list of names and we can add, delete and get a random name
import 'package:flutter/material.dart';
import '../cubits/random_name_cubit.dart';

class NamesCubitPage extends StatefulWidget {
  const NamesCubitPage({Key? key}) : super(key: key);

  @override
  State<NamesCubitPage> createState() => _NamesCubitPageState();
}

class _NamesCubitPageState extends State<NamesCubitPage> {
  late final RandomNameCubit randomNameCubit;

  @override
  void initState() {
    randomNameCubit = RandomNameCubit();
    randomNameCubit.startRandomNameEmit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Names Cubit'),
      ),
      body: Center(
        child: Container(
          child: StreamBuilder(
            stream: randomNameCubit.stream,
            builder: (context, state){
              if(!state.hasData) return Text("No Data Yet",);
              return Text("${state.data}",);
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
              child: Text('Get Random Name'),
              onPressed: () {
                randomNameCubit.getRandomName();
              },
            ),
            RaisedButton(
              child: Text('Delete Name'),
              onPressed: () {
                randomNameCubit.deleteName('John');
              },
            ),
            RaisedButton(
              child: Text('Add Name'),
              onPressed: () {
                randomNameCubit.addName('John');
              },
            ),
          ],
        ),
      ),
    );
  }
}