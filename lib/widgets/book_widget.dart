import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({Key? key}) : super(key: key);

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
                  "https://www.dbooks.org/img/books/1906434468s.jpg",fit: BoxFit.fill,),
            ),
              Positioned(
                left: 85,
                top: 10,

                child: IconButton(
                  icon: Icon(Icons.favorite,size: 30,),
                  onPressed: (){},
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
                  "Performance Tuning with SQL Server Dynamic Managment Vies",
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Louis Davidson and Tim Ford",style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                overflow: TextOverflow.ellipsis,
                fontStyle: FontStyle.italic,
              ),),
            ],
          )
        ],
      ),
    );
  }
}
