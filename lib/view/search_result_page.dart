import 'package:book_explorer/view/favourite_page.dart';
import 'package:book_explorer/view/setting_page.dart';
import 'package:book_explorer/viewmodel/search_result_view_model.dart';
import 'package:book_explorer/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/reusable_elevated_button_widget.dart';
import '../widgets/reusable_textformfield_widget.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchResultViewModel searchResultViewModel =
        context.watch<SearchResultViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
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
              height: 20,
            ),
            ReusableTextFormField(
              controller: searchResultViewModel.searchController,
              hint: "Book names,authors",
              prefixIcon: Icon(Icons.search),
            ),
            SizedBox(
              height: 20,
            ),
            ReusableElevatedButton(
                title: "Search",
                onPressAction: () {
                  searchResultViewModel
                      .getBooks(searchResultViewModel.searchController.text);
                }),
            pageView(searchResultViewModel),
          ],
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
            height: 20,
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
            height: 20,
          ),
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: viewModel.bookList.length,
              itemBuilder: (context, index) => Container(
                child: BookWidget(
                  imgPath: viewModel.bookList[index].image,
                  bookName: viewModel.bookList[index].title,
                  authors: viewModel.bookList[index].authors,
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
