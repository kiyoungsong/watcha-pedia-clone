import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/box_slider.dart';
import 'package:watcha_pedia_clone/model/video.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'package:watcha_pedia_clone/service/movie_list_service.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<Map<KeyEnum, List<VideoModel>>> movieList;

  @override
  void initState() {
    super.initState();
    movieList = MovieListService().getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movieList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          Map<KeyEnum, List<VideoModel>> list = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              BoxSlider(
                list: list[KeyEnum.nowPlaying] ?? [],
                keyword: KeyEnum.nowPlaying,
              ),
              BoxSlider(
                list: list[KeyEnum.popular] ?? [],
                keyword: KeyEnum.popular,
              ),
              BoxSlider(
                list: list[KeyEnum.topRated] ?? [],
                keyword: KeyEnum.topRated,
              ),
              BoxSlider(
                list: list[KeyEnum.upcoming] ?? [],
                keyword: KeyEnum.upcoming,
              )
            ],
          );
        }
      },
    );
  }
}
