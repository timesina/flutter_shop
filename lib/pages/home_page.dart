import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String showText='还没有请求数据';
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(title: Text('请求远程数据'),),
        body:Container(
          child: Column(
            children: <Widget>[              
              RaisedButton(
                onPressed: _jike,
                child: Text('请求完成'),
              ),
              Text(showText)
            ],
          ),
        ),
      )
    );
  }
 void _jike(){
  print('开始请求数据');
    getHttp().then((val){
     setState(() {
        showText=val['data']['name'].toString(); 
    });
    });
}
}

Future getHttp() async{
  try {
   Response response;
   response=await Dio().get(
    "https://time.geekbang.org/serv/v1/column/newAll",
   );
   return response.data;
  } catch (e) {
    return print(e);
  }
}
