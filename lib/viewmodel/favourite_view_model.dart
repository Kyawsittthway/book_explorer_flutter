import 'package:flutter/material.dart';

import '../data/local/dao/book_dao.dart';
import '../model/book_vo.dart';

class FavouriteViewModel extends ChangeNotifier {
  List<BookVO> _favList = [];
  bool _loading = false;

  BookDao bookDao;

  FavouriteViewModel(this.bookDao);

  ///Getters
  bool get loading => _loading;
  List<BookVO> get favList => _favList;

  ///Setters
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setFavList() async {
    _favList = await bookDao.findAllFavouriteBook();
    notifyListeners();
  }

  favButtonAction(BookVO book) async {
    var contain = favList.where((element) => element.id == book.id);
    if (contain.isNotEmpty) {
      print(favList);
      await removeFromFavourite(book);
    } else {
      await addToFavourite(book);
      print(favList);
    }
    print(favList);
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
