import 'package:cinetopia/app/viewmodels/search_movie_viewmodel.dart';
import 'package:cinetopia/ui/components/movie_card.dart';
import 'package:flutter/material.dart';

class SearchMovies extends StatefulWidget {
  const SearchMovies({super.key});

  @override
  State<SearchMovies> createState() => _SearchMoviesState();
}

class _SearchMoviesState extends State<SearchMovies> {
  SearchMovieViewmodel viewmodel = SearchMovieViewmodel();
  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: viewmodel.getPopularMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              // header
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    spacing: 40,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // headerContent
                      Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 88,
                            height: 88,
                            child: Image(
                              image: AssetImage('assets/popular.png'),
                            ),
                          ),
                          Text(
                            "Filmes Populares",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xDDEBEBEB),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        controller: searchBarController,
                        decoration: InputDecoration(
                          label: Text("Pesquisar"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // movieList
              SliverList.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: MovieCard(movie: viewmodel.moviesList[index]),
                  );
                },
                itemCount: viewmodel.moviesList.length,
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
