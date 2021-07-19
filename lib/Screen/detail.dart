import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/repository.dart';

import 'comment.dart';

class DetailPage extends StatelessWidget {
  static Movie items = Get.arguments;
  //List<Comment> comment = MovieRepo().loadComment(Get.arguments.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(items.title),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMain(),
              Divider(
                thickness: 2,
              ),
              _buildStory(),
              Divider(
                thickness: 2,
              ),
              _buildDetector(),
              Divider(
                thickness: 2,
              ),
              _buildComment(),
            ],
          ),
        ));
  }

  _buildMain() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 100,
              height: 130,
              child: Image.asset(
                items.imagePath,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(items.title,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('${items.date}개봉'),
                Text('${items.gerne} / 130분'),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        _buildReservation(),
      ],
    );
  }

  _buildReservation() {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _build1(),
          VerticalDivider(
            color: Colors.grey,
          ),
          _build2(),
          VerticalDivider(
            color: Colors.grey,
          ),
          _build3(),
        ],
      ),
    );
  }

  _build1() {
    return Column(
      children: [
        Text('예매율',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('${items.reservationGrade}위 / ${items.reservationRate}'),
      ],
    );
  }

  _build2() {
    return Column(
      children: [
        Text('평점', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('${items.userRating}'),
      ],
    );
  }

  _build3() {
    return Column(
      children: [
        Text('누적관객수',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text('4,004,257명'),
      ],
    );
  }

  _buildStory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('줄거리'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(
              '안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. 안녕하세요 저는 임연수입니다. ',
              style: TextStyle(fontWeight: FontWeight.bold),
              maxLines: 5,
            ),
          ),
        ),
      ],
    );
  }

  _buildDetector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('감독 / 출연'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text('감독', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Text('타이거 로아티티'),
                ],
              ),
              Row(
                children: [
                  Text('출연', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 5),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        '크리스 에버튼, 이병헌, 한예진, 크리스 맬버린 에버튼, 임연수에버딘 클래스 하하',
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  _buildComment() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '한줄평',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              iconSize: 20,
              icon: Icon(Icons.edit),              
              onPressed: () {
                Get.to(() => CommentPage(), arguments: items.id);
              },
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: _buildComments(),
        // ),
      ],
    );
  }

  // List<Padding> _buildComments(){

  //   return comment.map((value){
  //     final dateFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');
  //     dateFormatter.format(
  //       DateTime.fromMillisecondsSinceEpoch(value.dateTime * 1000)
  //     );
  //     return Padding(
  //       padding: EdgeInsets.all(8),
  //       child: Row(
  //         children: [
  //           Icon(Icons.person_pin,size: 50,),
  //           SizedBox(width: 10,),
  //           Column(
  //             children: [
  //               Text(value.nickName),
  //               Text((value.dateTime).toString()),
  //               SizedBox(height: 10,),
  //               Text(value.comment),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   }).toList();
  // }
}
