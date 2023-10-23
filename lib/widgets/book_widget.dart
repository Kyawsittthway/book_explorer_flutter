import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  String bookName;
  String authors;
  bool isFav;
  String imgPath;
  Function onPressedAction;
   BookWidget({Key? key,required this.bookName,required this.isFav,required this.authors,required this.imgPath,required this.onPressedAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [Container(

              height: 180,
              width: 130,
              child: Image.network(
                  imgPath,fit: BoxFit.fill,),
            ),
              Positioned(
                left: 85,
                top: 10,

                child: IconButton(
                  icon: Icon(Icons.favorite,size: 30,color: isFav? Colors.red:Colors.black,),
                  onPressed: (){
                    onPressedAction();
                  },
                ),
              )
      ]
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                 bookName,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(authors,maxLines:2,style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.ellipsis,
                  fontStyle: FontStyle.italic,
                ),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
