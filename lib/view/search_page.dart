import 'package:book_explorer/view/login_page.dart';
import 'package:book_explorer/view/search_result_page.dart';
import 'package:book_explorer/view/setting_page.dart';
import 'package:book_explorer/widgets/reusable_elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/reusable_textformfield_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (_)=>SettingPage()));
          }, icon: Icon(Icons.menu))
        ],

      ),
      body:SingleChildScrollView(
        child: Container(
          height: height * 0.75,
          width: width,
          child: Column(
            mainAxisSize: MainAxisSize.max,

            children: [
              Container(
                height: 250,
                width: 200,
                child: Lottie.asset('assets/images/book.json'),
              ),
              SizedBox(height: 20,),
              ReusableTextFormField(controller: searchController, hint: "Book names,authors",prefixIcon: Icon(Icons.search),),
              SizedBox(height: 20,),
              ReusableElevatedButton(title: "Search", onPressAction: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchResultPage()));
              })
            ],
          ),
        ),
      )
    );

  }
}
