import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/model/movie.dart';
import 'package:movie_app/service/controller.dart';

import 'detail.dart';

class ListPage extends StatelessWidget {

  static final stateController controller = Get.find();
  
  @override
  Widget build(BuildContext context) {
    List<Movie> items = controller.movieList;
    return GetBuilder<stateController>(      
      builder: (_) {
        return ListView.separated(
          itemBuilder: (context, index){
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(               
                  crossAxisAlignment: CrossAxisAlignment.start,                              
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.14,
                      child: InkWell(
                        child: Image.asset(
                          items[index].imagePath,                  
                        ),
                        onTap: (){
                          Get.to(()=>DetailPage(),arguments: items[index]);
                        },
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,                                                  
                        children: [
                          Row(
                            children: [
                              Text(
                                items[index].title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10,),
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: CircleAvatar(                            
                                  child: _buildGradeImage(items[index].grade),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Container(                      
                            padding: EdgeInsets.only(right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('평점: ${items[index].userRating}'),   
                                Text('예매순위: ${items[index].reservationGrade}'),                      
                                Text('예매율: ${items[index].reservationRate}'),                      
                              ],                                        
                            ),
                          ),
                          SizedBox(height: 10,),
                                
                          Text('개봉일: ${items[index].date}'),                  
                        ],                
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder:(_,index) => Divider(color:Colors.grey),
          itemCount: items.length,
        );
      }
    );
  }
  _buildGradeImage(int grade){
    switch(grade){      
      case 12:
        return Text('12');
      case 15:
        return Text('15');
      case 19:
        return Text('19');
    }
  }
}
