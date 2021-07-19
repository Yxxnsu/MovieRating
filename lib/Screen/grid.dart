import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/Screen/detail.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/repository.dart';

class GridPage extends StatelessWidget {
 
  List<Movie> movieData = MovieRepo().loadData();

  @override
  Widget build(BuildContext context) {    
    return GridView.builder(
      itemCount: movieData.length,

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
                      onTap: (){Get.to(()=>DetailPage(),arguments: movieData[idx]);},
                      child: Image.asset(
                        movieData[idx].imagePath,                  
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
                        child: _buildGradeImage(movieData[idx].grade),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Text(movieData[idx].title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('${movieData[idx].reservationGrade}(${movieData[idx].userRating})/${movieData[idx].reservationRate}'),
            Text(movieData[idx].date)
          ],
        ),
      );
      },
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
