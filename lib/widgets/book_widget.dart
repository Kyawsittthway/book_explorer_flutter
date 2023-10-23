import 'package:flutter/material.dart';

import '../resources/dimen.dart';

class BookWidget extends StatelessWidget {
  String bookName;
  String authors;
  bool isFav;
  String imgPath;
  Function onPressedAction;
  BookWidget(
      {Key? key,
      required this.bookName,
      required this.isFav,
      required this.authors,
      required this.imgPath,
      required this.onPressedAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: PADDING_10X, horizontal: PADDING_10X),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              height: BOOK_IMAGE_HEIGHT,
              width: BOOK_IMAGE_WIDTH,
              child: Image.network(
                imgPath,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: BOOK_LEFT_POSITION,
              top: BOOK_TOP_POSITION,
              child: IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: DEFAULT_ICON_SIZE,
                  color: isFav ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  onPressedAction();
                },
              ),
            )
          ]),
          SizedBox(
            width: DEFAULT_PADDING,
          ),
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
              SizedBox(
                height: DEFAULT_PADDING,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  authors,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    overflow: TextOverflow.ellipsis,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
