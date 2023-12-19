import 'package:flutter/material.dart';
import 'package:movie_app/constants/api_constants.dart';
import 'package:movie_app/controllers/search_provider.dart';
import 'package:movie_app/service/apiservice.dart';
import 'package:movie_app/views/pages/details_page.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchcontroller = Provider.of<SearchProvider>(context);

    ApiService service = ApiService();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  searchcontroller.searchMovies(value);
                },
                controller: searchcontroller.queryController,
                decoration: InputDecoration(
                  hintText: 'Search Movies',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
                child: searchcontroller.searchResults.isEmpty
                    ? const Center(
                        child: Text('Search Anything'),
                      )
                    : GridView.builder(
                        itemCount: searchcontroller.searchResults.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                                crossAxisCount: 3,
                                childAspectRatio: 1 / 1.4),
                        itemBuilder: (context, index) {
                          final searchdata =
                              searchcontroller.searchResults[index];

                          return GestureDetector(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) =>
                              //         DetailsPage(movies: movies)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${imagePath}${searchdata.poster_path}"),
                                      fit: BoxFit.fill,
                                      filterQuality: FilterQuality.high),
                                  color: Colors.black.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          );
                        }),
              )
            ],
          ),
        ),
      ),
    );
  }
}