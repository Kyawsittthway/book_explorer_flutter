import 'package:book_explorer/data/remote/book_service.dart';
import 'package:book_explorer/model/base_response_vo.dart';
import 'package:flutter/material.dart';

import '../data/remote/api_status.dart';
import '../model/book_vo.dart';

class SearchResultViewModel extends ChangeNotifier{
  bool _loading = false;
  bool _showTotal = false;
  List<BookVO> _bookList = [];
  TextEditingController searchController = TextEditingController();


  ///Getters
  bool get loading =>_loading;
  bool get showTotal => _showTotal;
  List<BookVO> get bookList => _bookList;



  ///Setters
  setLoading(bool loading) async{
    _loading = loading;
    notifyListeners();
  }

  setShowTotal(bool showTotal) async{
    _showTotal = showTotal;
    notifyListeners();
  }

  setBookList(List<BookVO> bookList){
    _bookList = bookList;
    print(_bookList);
    notifyListeners();
  }

  getBooks(String bookName)async{
    if(bookName.isNotEmpty) {
      setLoading(true);
      var response = await BookService.getBooks(bookName);
      print(response);
      if (response is Success) {
        print("success");
        BaseResponseVO baseResponse = response.respsonse as BaseResponseVO;
        setBookList(baseResponse.books);
        setLoading(false);
        setShowTotal(true);
      }
      if (response is Failure) {
        print("false");
        print(response.code);
        setLoading(false);
        setShowTotal(false);
      }
    }
  }
}