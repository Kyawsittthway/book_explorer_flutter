import 'dart:io';

import 'package:book_explorer/data/remote/api_status.dart';
import 'package:book_explorer/model/base_response_vo.dart';
import 'package:book_explorer/resources/network_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BookService {
  static Future<Object> getBooks(String bookName) async {
    var url = Uri.https(BASE_URL, SEARCH_ROUTE, {'q': '{$bookName}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print("Response :: ${response.statusCode}");
    if (response.statusCode == 200) {
      return Success(200, baseResponseVoFromJson(response.body));
    } else {
      return Failure(USER_INVALID_RESPONSE, 'Invalid Response');
    }
    // try {
    //   var url = Uri.https(BASE_URL, SEARCH_ROUTE, {'q': '{java}'});
    //
    //   // Await the http get response, then decode the json-formatted response.
    //   var response = await http.get(url);
    //   // print("Response :: ${response.statusCode}" );
    //   if (response.statusCode == 200) {
    //     return Success(200, baseResponseVoFromJson(response.body));
    //   }
    //   return Failure(USER_INVALID_RESPONSE, 'Invalid Response');
    // } on HttpException {
    //   return Failure(NO_INTERNET, 'No Internet Connection');
    // } on FormatException {
    //   return Failure(INVALID_FORMAT, 'Invalid Format');
    // } catch (e) {
    //   return Failure(UNKNOWN_ERROR, 'Unknown Error');
    // }
  }
}
