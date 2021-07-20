import 'package:flutter/material.dart';
import 'package:movie_app/Screen/list.dart';
import 'package:movie_app/service/controller.dart';
import 'package:get/get.dart';

import 'Screen/grid.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  
  static final stateController controller = Get.find();  
  
  List<Widget> pages = [
    ListPage(),
    GridPage(),  
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<stateController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[200],
            title: Text('Moive'),        
            centerTitle: true,   
            leading: Icon(Icons.menu),             
            actions: [
              _popMenu,
            ]
          ),      
          body: pages[controller.isSelctedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.view_list),label: 'List'),
              BottomNavigationBarItem(icon: Icon(Icons.grid_on),label: 'Grid'),
            ],
            currentIndex: controller.isSelctedIndex,
            onTap: (value){
              controller.selectedPage(value);
            }
          ),
        );
      }
    );
  }
  
  var _popMenu = (
    PopupMenuButton<int>(
      icon: Icon(Icons.sort),
      onSelected: (value){
        switch(value){
          case 0:
            return controller.sortRating();
          case 2:
            return controller.sortDating();
          case 1: 
            return controller.sortGrading();
        }
      },
      itemBuilder: (context){
        return[
          PopupMenuItem(value: 0, child: Text('예매율순'),),
          PopupMenuItem(value: 1, child: Text('등급순'),),
          PopupMenuItem(value: 2, child: Text('최신순'),),
        ];
      },
    )
  ); 

}