import 'package:movie_app/model/movie.dart';

class MovieRepo{

  late final List<Comment> items;

  List<Movie> loadData(){

    List<Movie> movieData = [

      Movie(
        title: "타이타닉",
        userRating: 9,
        grade: 12,
        imagePath: 'assets/1.png',
        date: '2013-04-11',
        reservationGrade: 1,
        reservationRate: 76.5,
        gerne: '액션, 모험, 판타지',
      ),
      Movie(
        title: "매드맥스",
        userRating: 7,
        grade: 15,
        imagePath: 'assets/2.png',
        date: '2015-03-27',
        reservationGrade: 2,
        reservationRate: 66.4,
        gerne: '액션, 모험, 판타지',

      ),
      Movie(
        title: "라이프 오브 파이",
        userRating: 6,
        grade: 12,
        imagePath: 'assets/3.png',
        date: '2013-05-13',
        reservationGrade: 5,
        reservationRate: 34.5,
        gerne: '액션, 모험, 판타지',

      ),
      Movie(
        title: "콘택트",
        userRating: 4,
        grade: 15,
        imagePath: 'assets/4.png',
        date: '2015-01-10',
        reservationGrade: 6,
        reservationRate: 22.3,
        gerne: '액션, 모험, 판타지',

      ),
      Movie(
        title: "더:리더",
        userRating: 9,
        grade: 12,
        imagePath: 'assets/5.png',
        date: '2008-04-11',
        reservationGrade: 4,
        reservationRate: 41.5,
        gerne: '액션, 모험, 판타지',

      ),
      Movie(
        title: "컨택트",
        userRating: 3,
        grade: 15,
        imagePath: 'assets/6.png',
        date: '2018-08-30',
        reservationGrade: 3,
        reservationRate: 55.8,
        gerne: '액션, 모험, 판타지',
        
      ),
    ];
    return movieData;

  }

  List<Comment> loadComment(String movieId){

    return items.where((element) => (element.movieId == movieId)).toList();
  }
}