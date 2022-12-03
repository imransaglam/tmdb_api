import 'package:flutter/material.dart';
import 'package:tmdb_api/models/get_movie_model.dart';
import 'package:tmdb_api/models/get_tv_series_model.dart';
import 'package:tmdb_api/models/movie_casts_model.dart';
import 'package:tmdb_api/models/movies_model.dart';
import 'package:tmdb_api/models/similar_movie_model.dart';
import 'package:tmdb_api/models/similar_tv_series_model.dart';
import 'package:tmdb_api/models/tv_Series_cast_model.dart';

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

  SimilarMovieModel similarMovieResponse=SimilarMovieModel();
  bool isSimilarMovieLoading=true;

  String? movie_id1;
  int? index1;

  getSimilarMovieData({required String movie_id1,required int index1}) async {
    isSimilarMovieLoading=true;
    similarMovieResponse=(await getCurrentSimilarMovie(movie_id1: movie_id1, ))!;
    isSimilarMovieLoading=false;
    print(similarMovieResponse);
    notifyListeners();
  }



 GetTvSeriesModel getTvSeriesResponse=GetTvSeriesModel();
  bool isgetTvSeriesLoading=true;

  String? tv_id;
  int? tv_index;

  getGetTvSeriesData({required String tv_id,required int tv_index}) async {
    isgetTvSeriesLoading=true;
    getTvSeriesResponse=(await getCurrentGetTvSeriesData(tv_id: tv_id, ))!;
    isgetTvSeriesLoading=false;
    print(getTvSeriesResponse.genres);
    notifyListeners();
  }


  TvSeriesCastModel tvCastResponse=TvSeriesCastModel();
  bool isTvCastLoading=true;

  String? tv_ids;
  int? tv_indexes;

  getTvCastData({required String tv_ids,required int tv_indexes}) async {
    isTvCastLoading=true;
    tvCastResponse=(await getCurrentTvCastData(tv_ids: tv_ids, ))!;
    isTvCastLoading=false;
    print(movieCastResponse);
    notifyListeners();
  }

  SimilarTvSeriesModel similarTvSeriesResponse=SimilarTvSeriesModel();
  bool isSimilarTvLoading=true;
  
   String? tv_id2;
  int? tv_index2;

  getSimilarTvData({required String tv_id2,required int tv_index2}) async {
  isSimilarTvLoading=true;
  similarTvSeriesResponse=(await getCurrentSimilarTv(tv_id2: tv_id2, ))!;
  isSimilarTvLoading=false;
  print(similarTvSeriesResponse);
  notifyListeners();
  }
  
 
}
