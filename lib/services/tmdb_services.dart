import 'package:dio/dio.dart';
import 'package:tmdb_api/models/get_movie_model.dart';
import 'package:tmdb_api/models/get_tv_series_model.dart';
import 'package:tmdb_api/models/movie_casts_model.dart';
import 'package:tmdb_api/models/movies_model.dart';
import 'package:tmdb_api/models/similar_movie_model.dart';
import 'package:tmdb_api/models/tv_Series_cast_model.dart';

import 'package:tmdb_api/models/tv_series_model.dart';

//https://developers.themoviedb.org/3/movies/get-popular-movies
//Most popular movies
final Dio _dio = Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/movie/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
));
Future<PopularMovieModel?> getCurrentMovieData() async {
  PopularMovieModel movieResponse;
  try {
    final response = await _dio
        .get("popular?api_key=9c6ac40cb2e7c6e33a57a0e49d6bee75&language=en-US&page=1");
    movieResponse = PopularMovieModel.fromJson(response.data);
    print(response.data);
    return movieResponse;
  } catch (e) {}

}
//https://developers.themoviedb.org/3/tv/get-popular-tv-shows
//Most popular tv series
final Dio _dio2 = Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/tv/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
));
Future<PopularTvSeriesModel?> getCurrentTvSeriesData() async {
  PopularTvSeriesModel tvseriesResponse;
  try {
    final response = await _dio2
        .get("popular?api_key=9c6ac40cb2e7c6e33a57a0e49d6bee75&language=en-US&page=1");
    tvseriesResponse = PopularTvSeriesModel.fromJson(response.data);
    print(response.data);
    return tvseriesResponse;
  } catch (e) {}

}
//https://developers.themoviedb.org/3/movies/get-movie-details
//Get Movie
final Dio _dio3 = Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/movie/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
));
Future<GetMovieModel?> getCurrentGetMovieData({required String? movie_id}) async {
  GetMovieModel getMovieResponse;
  try {
    final response = await _dio3
        .get("$movie_id?api_key=9c6ac40cb2e7c6e33a57a0e49d6bee75");
    getMovieResponse = GetMovieModel.fromJson(response.data);
    print(response.data);
    return getMovieResponse;
  } catch (e) {}

}
//https://developers.themoviedb.org/3/tv/get-tv-details
//Get Tv Deries
final Dio _dio6 = Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/tv/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
));
Future<GetTvSeriesModel?> getCurrentGetTvSeriesData({required String? tv_id}) async {
  GetTvSeriesModel getTvSeriesResponse;
  try {
    final response = await _dio6
        .get("$tv_id?api_key=9c6ac40cb2e7c6e33a57a0e49d6bee75&language=en-US");
    getTvSeriesResponse = GetTvSeriesModel.fromJson(response.data);
    print(response.data);
    return getTvSeriesResponse;
  } catch (e) {}
}
//https://developers.themoviedb.org/3/movies/get-movie-credits
// movie main casts

final Dio _dio4=Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/movie/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
));
Future<MovieCastsModel?> getCurrentMovieCastData({required dynamic movie_ids}) async{
    MovieCastsModel movieCastsTesponse;
    try {
    final response = await _dio4
        .get("${movie_ids.toString()}/credits?api_key=9c6ac40cb2e7c6e33a57a0e49d6bee75&language=en-US");
    movieCastsTesponse = MovieCastsModel.fromJson(response.data);
    print(response.data);
    return movieCastsTesponse;
  } catch (e) {}
}
//https://developers.themoviedb.org/3/tv/get-tv-credits
//tv main casts

final Dio _dio7=Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/tv/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
));

Future<TvSeriesCastModel?> getCurrentTvCastData({required tv_ids}) async{
    TvSeriesCastModel tvCastsTesponse;
    try {
    final response = await _dio7
        .get("$tv_ids/credits?api_key=9c6ac40cb2e7c6e33a57a0e49d6bee75&language=en-US");
    tvCastsTesponse = TvSeriesCastModel.fromJson(response.data);
    print(response.data);
    return tvCastsTesponse;
  } catch (e) {}
}



//https://developers.themoviedb.org/3/movies/get-similar-movies
//Simillar Movie
final Dio _dio5=Dio(BaseOptions(
  baseUrl: "https://api.themoviedb.org/3/movie/",
  connectTimeout: 5000,
  receiveTimeout: 3000,
));
Future<SimilarMovieModel?> getCurrentSimilarMovie({required String movie_id1})async{
  SimilarMovieModel similarMovieResponse;
  try{
    final response=await _dio5
    .get("$movie_id1/similar?api_key=9c6ac40cb2e7c6e33a57a0e49d6bee75&language=en-US&page=1");
    similarMovieResponse=SimilarMovieModel.fromJson(response.data);
    print(response.data);
    return similarMovieResponse;
  } catch(e){}
}