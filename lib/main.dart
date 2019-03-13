import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/news.dart';
import 'package:flutter_bloc_example/news_bloc.dart';


void main(){

  runApp(
    MaterialApp(
      home:MyApp() ,
    )
  );

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NewsBloc bloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc=NewsBloc();
    bloc.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example"),
      ),
      body: StreamBuilder(builder: (BuildContext context, AsyncSnapshot<List<Items>> snapshot) {
        if(snapshot.data==null){
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return ListView(
            children: snapshot.data.map((l){
              return ListTile(
                leading: Container(child: Image.network(l.thumbnail,fit: BoxFit.cover,),width: 50,height: 50,),
                title: Text(l.title),
              );
            }).toList(),
          );
        }
      },
        stream: bloc.getStream(),
      )
    );
  }
}
