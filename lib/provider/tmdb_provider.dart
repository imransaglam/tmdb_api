import 'package:flutter/material.dart';
import 'package:tmdb_api/models/get_movie_model.dart';
import 'package:tmdb_api/models/movie_casts_model.dart';
import 'package:tmdb_api/models/movies_model.dart';

import 'package:tmdb_api/models/tv_series_model.dart';
import 'package:tmdb_api/services/tmdb_services.dart';

class TmdbProvider with ChangeNotifier{
  PopularMovieModel moviesResponse=PopularMovieModel();
  bool isMoviesResponseLoading=true;

   getMovieData() async {
    isMoviesResponseLoading=true;
    moviesResponse=(await getCurrentMovieData())!;
    isMoviesResponseLoading=false;
    notifyListeners();
  }
  
  PopularTvSeriesModel tvSeriesResponse=PopularTvSeriesModel();
  bool isTvSeriesResponseLoading=true;

  getTvSeriesData() async {
    isTvSeriesResponseLoading=true;
    tvSeriesResponse=(await getCurrentTvSeriesData())!;
    isTvSeriesResponseLoading=false;
    notifyListeners();
  }

  GetMovieModel getmovieResponse=GetMovieModel();
  bool isGetMovieResponseLoading=true;

  String? movie_id;
  int? index;

  getGetMovieData({required String movie_id,required int index}) async {
    isGetMovieResponseLoading=true;
    getmovieResponse=(await getCurrentGetMovieData(movie_id: movie_id, ))!;
    isGetMovieResponseLoading=false;
    print(getmovieResponse);
    notifyListeners();
  }


  MovieCastsModel movieCastResponse=MovieCastsModel();
  bool isMovieCastLoading=true;

  String? movie_ids;
  int? indexes;

  getMovieCastData({required String movie_ids,required int indexes}) async {
    isMovieCastLoading=true;
    movieCastResponse=(await getCurrentMovieCastData(movie_ids: movie_ids, ))!;
    isMovieCastLoading=false;
    print(movieCastResponse);
    notifyListeners();
  }

  
 
}
