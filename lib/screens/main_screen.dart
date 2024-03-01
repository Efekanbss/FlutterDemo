

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http_demo/data.api/category_api.dart';
import 'package:http_demo/models/category.dart';

class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }


}

class MainScreenState extends State {
  late List <Category> categories = <Category>[];
  late List<Widget> categoryWidgets = <Widget>[];

  void initState(){
    getCategoriesFromApi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Sistemi",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            )
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) => null);
      setState(() {
        var response;
        Iterable list = json.decode(response.body);
        this.categories = list.map((category) => Category.fromJson(category)).toList();
        getCategoryWidgets();
    });
  }
  List<Widget> getCategoryWidgets() {
      for(int i = 0;i < categories.length ; i++) {
        categoryWidgets.add(getCategoryWidget(categories[i]));
      }
      return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return FloatingActionButton(
      onPressed: (){},
      child: Text(category.categoryName, style: TextStyle(color: Colors.blueGrey),),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color : Colors.lightGreenAccent)
      ),

    );
  }

}
