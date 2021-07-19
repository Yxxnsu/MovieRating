import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/repository.dart';

class stateController extends GetxController{

  int isSelctedIndex = 0;
  List<Movie> movieList = MovieRepo().loadData();
  
  selectedPage(int value){
    isSelctedIndex = value;
    update();
  }

  dynamic sortRating(){
    movieList.sort((b,a){
      return a.reservationRate.compareTo(b.reservationRate);
    });
    update();
  }

   dynamic sortDating(){
     movieList.sort((b,a){
      return a.date.compareTo(b.date);
    });
    update();
  }


}