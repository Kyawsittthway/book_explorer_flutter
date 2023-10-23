import 'package:floor/floor.dart';

import '../../../model/book_vo.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM BookVO')
  Future<List<BookVO>> findAllFavouriteBook();

  @insert
  Future<void> insertFavBook(BookVO book);

  @delete
  Future<void> removeFavBook(BookVO book);
}
