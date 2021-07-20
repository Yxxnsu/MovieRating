import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Screen/detail.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/repository.dart';
import 'package:movie_app/service/controller.dart';

class GridPage extends StatelessWidget {
 
  // List<Movie> items. = MovieRepo().loadData();
  static final stateController controller = Get.find();
  List<Movie> items = controller.movieList;

  @override
  Widget build(BuildContext context) {    
    return GetBuilder<stateController>(    
      builder: (_) {
        return GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 9/16,          
          ),
          itemBuilder: (context, idx){
            return Container(
              padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,         
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        width: 240,
                        height: 360,                  
                        child: InkWell(
                          onTap: (){Get.to(()=>DetailPage(),arguments: items[idx]);},
                          child: Image.asset(
                            items[idx].imagePath,                  
                            fit:BoxFit.fill,                      
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircleAvatar(
                            child: _buildGradeImage(items[idx].grade),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Text(items[idx].title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('${items[idx].reservationGrade}(${items[idx].userRating})/${items[idx].reservationRate}'),
                Text(items[idx].date)
              ],
            ),
          );
          },
        );
      }
    );
  }

  _buildGradeImage(int grade) {
    switch (grade) {
      case 12:
        return Text('12');
      case 15:
        return Text('15');
      case 19:
        return Text('19');
    }
  }
}
