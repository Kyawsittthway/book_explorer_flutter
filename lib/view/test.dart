// import 'package:flutter/material.dart';
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   static const int _pageSize = 20;
//   int _currentPage = 1;
//   List<String> _data = [];
//
//   bool _isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
//
//   Future<void> _fetchData() async {
//     setState(() {
//       _isLoading = true;
//     });
//
//     // Simulated fetching logic
//     await Future.delayed(const Duration(seconds: 2));
//
//     // Generate data for the current page
//     final newData = List<String>.generate(
//       _pageSize,
//           (index) => 'Item ${(index + 1) + (_currentPage - 1) * _pageSize}',
//     );
//
//     setState(() {
//       _data.addAll(newData);
//       _isLoading = false;
//     });
//   }
//
//   void _loadMoreData() {
//     setState(() {
//       _currentPage++;
//     });
//     _fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Load More Button'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _data.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_data[index]),
//                 );
//               },
//             ),
//           ),
//           _isLoading
//               ? const Center(
//             child: CircularProgressIndicator(),
//           )
//               : ElevatedButton(
//             onPressed: _loadMoreData,
//             child: const Text('Load More'),
//           ),
//         ],
//       ),
//     );
//   }
// }
