import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../pages/home_page.dart';
import '../pages/category_page.dart';
import '../pages/cart_page.dart';
import '../pages/member_page.dart';


class IndexPage extends StatefulWidget {
  final Widget child;

  IndexPage({Key key, this.child}) : super(key: key);

  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
 final List<BottomNavigationBarItem> bottoomTabs=[
   BottomNavigationBarItem(
     icon:Icon(CupertinoIcons.home),
     title: Text('首页')
   ),
   BottomNavigationBarItem(
     icon: Icon(CupertinoIcons.search),
     title: Text('分类')
  ) ,
   BottomNavigationBarItem(
     icon: Icon(CupertinoIcons.shopping_cart),
     title: Text('购物车')
  ),
   BottomNavigationBarItem(
     icon: Icon(CupertinoIcons.profile_circled),
     title: Text('会员中心')
  ),
];

final List tabBodies=[
  HomePage(),
  CategoryPage(),
  CartPage(),
  MemberPage()
];

  int currentIndex=0;
  var currentPage;
  @override
  void initState(){
    currentPage=tabBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.red,//.fromRGBO(255,255,255, 1.0)
       bottomNavigationBar: BottomNavigationBar(
         type: BottomNavigationBarType.fixed,
         currentIndex: currentIndex,
         items: bottoomTabs,
         onTap:(index){
           setState(() {
            currentIndex=index;
            currentPage=tabBodies[currentIndex]; 
           });
         },
       ),
       body: currentPage,
    );
  }
}