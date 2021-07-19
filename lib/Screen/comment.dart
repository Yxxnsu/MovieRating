import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/service/controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CommentPage extends StatelessWidget {
  
  final stateController controller = Get.find();
  final Movie items = Get.arguments;  
  String? _contents;
  String? _writer;
  double? _ratings;

  @override
  Widget build(BuildContext context) { 
     
    return GetBuilder<stateController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('한줄평 작성'),       
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=> Get.back(),
            ),
            actions: [
              _buildSubmitButton(),                      
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    _buildTextandStar(),
                    _buildTextFormField(),
                  ],
                ),
              ),
            ),
          )
        );
      }
    );
  }

  Widget _buildSubmitButton(){
    
    final sendIcon = Icon(
      Icons.send,
      color: Colors.white,
      size: 25,
    );
    return IconButton(
      icon: sendIcon,
      onPressed: () {
        if (_writer == null || _contents == null) {
          Get.snackbar('경고', '모든 정보를 입력해주세요.',snackPosition: SnackPosition.BOTTOM);
        } else {
          controller.addComment(items.id,_writer,_contents,ratings: _ratings!);
          Get.back();
        }
      },
    );
  }

  _buildTextandStar(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          items.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,            
          ),          
        ),
        Center(
          child: _buildRatingBar(),
        ),
        Divider(
          thickness: 2,
        ),
      ],
    );
  }

  _buildRatingBar(){
    return RatingBar(
      initialRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: 4),
      ratingWidget: RatingWidget(        
        full: Icon(Icons.star),
        half:Icon(Icons.star_half),
        empty:Icon(Icons.star_border),
      ), 
      onRatingUpdate: (rating){
        _ratings = rating;        
      }
    );    
  }

  _buildTextFormField(){

    return Column(
      children: [
        TextFormField(                  
          maxLength: 20,
          onChanged: (text){
            _contents = text;
          },
          decoration: InputDecoration(
            hintText: '닉네임을 입력하세요',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(),
            )
          ),
        ),
        SizedBox(height: 10,),
        TextFormField(                  
          maxLength: 100,          
          onChanged: (text){
            _writer = text;
          },
          decoration: InputDecoration(
            hintText: '한줄평을 입력하세요',
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(),
            )
          ),
        ),  
      ],
    );
  }
}