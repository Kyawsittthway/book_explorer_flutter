import 'package:book_explorer/data/remote/book_service.dart';
import 'package:book_explorer/model/base_response_vo.dart';
import 'package:flutter/material.dart';

import '../data/local/dao/book_dao.dart';
import '../data/remote/api_status.dart';
import '../model/book_vo.dart';

class SearchResultViewModel extends ChangeNotifier {
  bool _loading = false;
  bool _showTotal = false;
  List<BookVO> _bookList = [];
  List<BookVO> _favBookList = [];
  TextEditingController searchController = TextEditingController();

  BookDao bookDao;
  SearchResultViewModel(this.bookDao) {
    setFavouriteBookList();
  }

  ///Getters
  bool get loading => _loading;
  bool get showTotal => _showTotal;
  List<BookVO> get bookList => _bookList;

  ///Setters
  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setShowTotal(bool showTotal) async {
    _showTotal = showTotal;
    notifyListeners();
  }

  setBookList(List<BookVO> bookList) {
    _bookList = bookList;
    print(_bookList);
    notifyListeners();
  }

  getBooks(String bookName) async {
    if (bookName.isNotEmpty) {
      setLoading(true);
      var response = await BookService.getBooks(bookName);
      print(response);
      if (response is Success) {
        print("success");
        BaseResponseVO baseResponse = response.respsonse as BaseResponseVO;
        if (baseResponse.status == "Not Found") {
          setLoading(false);
          setShowTotal(true);
        } else {
          setBookList(baseResponse.books ?? []);
          setLoading(false);
          setShowTotal(true);
        }
      }
      if (response is Failure) {
        print("false");
        print(response.code);
        setLoading(false);
        setShowTotal(false);
      }
    }
  }

  setFavouriteBookList() async {
    _favBookList = await bookDao.findAllFavouriteBook();
    notifyListeners();
  }
  bool checkIsFav(BookVO book){
    var contain = _favBookList.where((element) => element.id == book.id);
    return contain.isEmpty ? false : true;
  }
  favButtonAction(BookVO book) async {
    var contain = _favBookList.where((element) => element.id == book.id);
    if (contain.isNotEmpty) {
      print(_favBookList);
      await removeFromFavourite(book);
    } else {
      await addToFavourite(book);
      print(_favBookList);
    }
    print(_favBookList);
    await setFavouriteBookList();
    notifyListeners();
  }

  addToFavourite(BookVO book) async {
    await bookDao.insertFavBook(book);
    notifyListeners();
  }

  removeFromFavourite(BookVO book) async {
    await bookDao.removeFavBook(book);
    notifyListeners();
  }
}
