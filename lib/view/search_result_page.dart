import 'package:book_explorer/view/favourite_page.dart';
import 'package:book_explorer/view/setting_page.dart';
import 'package:book_explorer/widgets/book_widget.dart';
import 'package:flutter/material.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>FavouritePage()));
          }, icon: Icon(Icons.favorite)),
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingPage()));
          }, icon: Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                "Total : 102 results found!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
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
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  child: BookWidget(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
