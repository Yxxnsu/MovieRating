import 'package:uuid/uuid.dart';

class Movie {

  final String title;           //영화제목
  final int userRating;         //유저 평점
  final int grade;              //영화등급
  final int reservationGrade;    //예매순위
  final String id;                 //영화 고유 Id
  final String imagePath;       //이미지 주소
  final String date;            //개봉일
  final double reservationRate;
  final String gerne; //에매율
  Movie({
    required this.title,
    required this.userRating,
    required this.grade,
    required this.reservationGrade,    
    required this.imagePath,
    required this.date,
    required this.reservationRate,
    required this.gerne,
  }) : this.id = Uuid().v1();
}

class Comment {
  final String movieId;
  final String comment;
  final int dateTime;
  //DateTime.now().millisecondsSinceEpoch,
  final String nickName;

  Comment({
    required this.movieId,
    required this.comment,
    required this.dateTime,
    required this.nickName,
  });
}
