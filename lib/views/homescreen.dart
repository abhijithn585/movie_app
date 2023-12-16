import 'package:flutter/material.dart';
import 'package:movie_app/service/apiservice.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    ApiService service = ApiService();
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [Row()],
      )),
    );
  }
}

// Expanded(
//   child: SizedBox(
//     height: 500,
//     child: FutureBuilder(
//         future: service.getMovies(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   final moviedata = snapshot.data![index];
//                   return ListTile(
//                     title: Text(moviedata.title!),
//                   );
//                 });
//           } else {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           }
//         }),
//   ),
// )
