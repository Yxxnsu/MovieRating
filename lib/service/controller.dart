import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/repository.dart';

class stateController extends GetxController {
  int isSelctedIndex = 0;
  List<Movie> movieList = MovieRepo().loadData();
  List<Comment> commentList = []; // Class 내의 변수와 변수명이 같아서는 안된다..!
  List<Comment> temp = [];

  selectedPage(int value) {
    isSelctedIndex = value;
    update();
  }

  sortRating() {
    movieList.sort((b, a) {
      return a.reservationRate.compareTo(b.reservationRate);
    });
    update();
  }

  sortDating() {
    movieList.sort((b, a) {
      return a.date.compareTo(b.date);
    });
    update();
  }

  sortGrading(){
     movieList.sort((a, b) {
      return a.reservationGrade.compareTo(b.reservationGrade);
    });
    update();
  }

  addComment(String id, String? comment, String? nickName, {double ratings=0}) {    
    commentList.add(
      Comment(
        movieId: id,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        comment: comment!,
        nickName: nickName!,
        rating: ratings,
      )
    );    
    update();
  }

  removeComment(Comment value){
    commentList.remove(value);
    update();
  }
}
