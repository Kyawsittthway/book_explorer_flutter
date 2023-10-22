import 'book_vo.dart';

class BaseResponseVO{
  String status;
  int total;
  List<BookVO> books;

  BaseResponseVO(this.status, this.total, this.books);
}