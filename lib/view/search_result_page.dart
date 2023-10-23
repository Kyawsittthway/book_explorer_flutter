import 'package:book_explorer/view/favourite_page.dart';
import 'package:book_explorer/view/setting_page.dart';
import 'package:book_explorer/viewmodel/search_result_view_model.dart';
import 'package:book_explorer/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/dimen.dart';
import '../resources/strings.dart';
import '../widgets/reusable_elevated_button_widget.dart';
import '../widgets/reusable_textformfield_widget.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchResultViewModel searchResultViewModel =
        context.watch<SearchResultViewModel>();
    searchResultViewModel.setFavouriteBookList();

    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text(RESULT_TITLE),
            centerTitle: true,
            leading: Container(),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => FavouritePage()));
                  },
                  icon: Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    searchResultViewModel.clearUp();
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SettingPage()));
                  },
                  icon: Icon(Icons.menu))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: DEFAULT_PADDING,
                ),
                ReusableTextFormField(
                  controller: searchResultViewModel.searchController,
                  hint: SEARCH_BOX_HINT,
                  prefixIcon: Icon(Icons.search),
                  isPassword: false,
                ),
                SizedBox(
                  height: DEFAULT_PADDING,
                ),
                ReusableElevatedButton(
                    title: SEARCH_TEXT,
                    onPressAction: () {
                      searchResultViewModel.clearBookList();
                      searchResultViewModel
                          .getBooks(searchResultViewModel.searchController.text);
                    }),
                SizedBox(height: DEFAULT_PADDING,),
                pageView(searchResultViewModel),
              ],
            ),
          ),
        ),


    );
  }

  pageView(SearchResultViewModel viewModel) {
    if (viewModel.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Column(
        children: [
          SizedBox(
            height: DEFAULT_PADDING,
          ),
          Container(
            child: Visibility(
              visible: viewModel.showTotal,
              child: Text(
                "Total : ${viewModel.bookList.length} results found!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(
            height: DEFAULT_PADDING,
          ),
          Container(
            child: viewModel.bookList.isEmpty ? Container():ListView.builder(
              shrinkWrap: true,
              primary: false,
              // physics: NeverScrollableScrollPhysics(),
              itemCount: viewModel.chunkedList.isEmpty ? 0:viewModel.chunkedList.length,
              itemBuilder: (context, index) => Container(
                child: BookWidget(
                  imgPath: viewModel.bookList[index].image,
                  bookName: viewModel.bookList[index].title,
                  authors: viewModel.bookList[index].authors,
                  isFav: viewModel.checkIsFav(viewModel.bookList[index]),
                  onPressedAction: ()async{
                    await viewModel.favButtonAction(viewModel.bookList[index]);
                  },
                ),
              ),

            ),
          ),
          Visibility(
            visible: !viewModel.hideSeeMore,
            child: Container(
              margin: EdgeInsets.only(bottom: SMALL_PADDING),
              child: viewModel.loadingNewData? CircularProgressIndicator():ElevatedButton(
                onPressed:(){
                   viewModel.loadMoreData();
                },
                child: const Text(SEE_MORE_TEXT),
              ),
            ),
          )
        ],
      );
    }
  }
}
