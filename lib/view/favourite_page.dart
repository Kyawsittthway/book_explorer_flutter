import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/viewmodel/favourite_view_model.dart';
import 'package:book_explorer/widgets/book_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteViewModel viewModel = context.watch<FavouriteViewModel>();
    viewModel.setFavList();
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Page"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchResultPage()));
        },),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => BookWidget(
                  bookName: viewModel.favList[index].title,
                  authors: viewModel.favList[index].authors,
                  imgPath: viewModel.favList[index].image,
                  isFav: true,
                  onPressedAction: (){
                    viewModel.favButtonAction(viewModel.favList[index]);
                  },),
              itemCount: viewModel.favList.length,
            )
          ],
        ),
      ),
    );
  }
}
