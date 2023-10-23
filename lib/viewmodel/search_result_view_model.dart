import 'package:book_explorer/data/remote/book_service.dart';
import 'package:book_explorer/model/base_response_vo.dart';
import 'package:flutter/material.dart';

import '../data/local/dao/book_dao.dart';
import '../data/remote/api_status.dart';
import '../model/book_vo.dart';

class SearchResultViewModel extends ChangeNotifier {
  bool _loading = false;
  bool _showTotal = false;
  bool hideSeeMore = true;
  bool loadingNewData = false;
  List<BookVO> _bookList = [];
  List<BookVO> chunkedList = [];
  List<BookVO> _favBookList = [];
  TextEditingController searchController = TextEditingController();

  /// Test
  int _pageSize = 10;
  int currentPage = 1;
  BookDao bookDao;
  SearchResultViewModel(this.bookDao) {
    chunkedList.clear();
    bookList.clear();
    searchController.clear();
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

  setLoadingNewData(bool loading) async {
    loadingNewData = loading;
    notifyListeners();
  }

  setShowTotal(bool showTotal) async {
    _showTotal = showTotal;
    notifyListeners();
  }

  setBookList(List<BookVO> bookList) {

    _bookList = bookList;
    print(_bookList);
    if (!bookList.isEmpty) {
      fetchChunkData();
    } else {
      hideSeeMore = true;
    }

    notifyListeners();
  }

  clearBookList() {
    _bookList.clear();
    notifyListeners();
  }

  void fetchChunkData() {
    if (bookList.isNotEmpty) if (bookList.length <= 10) {
      chunkedList.addAll(bookList);
      hideSeeMore = true;
    } else {
      int remainIndex = bookList.length - chunkedList.length;
      //print("Reamin index :: $remainIndex");
      hideSeeMore = false;
      if (remainIndex < 10) {
        _pageSize = remainIndex;
        hideSeeMore = true;
      }

      final data = List<BookVO>.generate(
          _pageSize,
          (index) => BookVO(
              id: _bookList[(index + 1) + (currentPage - 1) * _pageSize].id,
              title:
                  _bookList[(index + 1) + (currentPage - 1) * _pageSize].title,
              subtitle: _bookList[(index + 1) + (currentPage - 1) * _pageSize]
                  .subtitle,
              authors: _bookList[(index + 1) + (currentPage - 1) * _pageSize]
                  .authors,
              image:
                  _bookList[(index + 1) + (currentPage - 1) * _pageSize].image,
              url: bookList[(index + 1) + (currentPage - 1) * _pageSize].url));
      //print("Data are :: ${data.map((e) => e.title)}");
      chunkedList.addAll(data);
    }
    notifyListeners();
  }

  void loadMoreData() async {
    setLoadingNewData(true);
    Future.delayed(Duration(milliseconds: 800), () {
      currentPage++;
      fetchChunkData();
      setLoadingNewData(false);
    });
  }

  getBooks(String bookName) async {
    chunkedList.clear();
    currentPage = 1;
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

  bool checkIsFav(BookVO book) {
    var contain = _favBookList.where((element) => element.id == book.id);
    return contain.isEmpty ? false : true;
  }

  void clearUp(){
    searchController.clear();
    bookList.clear();
    hideSeeMore = true;
    setShowTotal(false);
    notifyListeners();
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
