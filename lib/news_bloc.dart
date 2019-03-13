import 'dart:async';
import 'dart:convert';

import 'package:flutter_bloc_example/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_example/news.dart';

class NewsBloc{

  StreamController<List<Items>> sc=StreamController();

  Stream<List<Items>> getStream(){
    return sc.stream;
  }


  getNews()async{
    await http.get(URL).then((res){
      News news=News.fromJson(json.decode(res.body));
      sc.sink.add(news.items);
    });


  }


  void dispose(){
    sc.close();
  }


}