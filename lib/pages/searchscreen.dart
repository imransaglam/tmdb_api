import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/provider/tmdb_provider.dart';

class SearchSecreen extends StatefulWidget {
  const SearchSecreen({super.key});

  @override
  State<SearchSecreen> createState() => _SearchSecreenState();
}
 
class _SearchSecreenState extends State<SearchSecreen> {
   @override
  void initState() {
    // TODO: implement initState
       TmdbProvider movieSerachProvider =
        Provider.of<TmdbProvider>(context, listen: false);
    movieSerachProvider.getSearchMovieData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer(
           builder: (context, TmdbProvider searchingMovieProvider, child) =>
                         // searchingMovieProvider.isSearchMovieLoading == true
                           //   ? CircularProgressIndicator()
                         //: 
                              Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xff8000FF), Colors.black])),
              child: Padding(
          padding: const EdgeInsets.only(right:15,left:15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                         Navigator.pop(context);
                      },
                      child: Container(
                        width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                   color:Color(0xff36076B).withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(19)),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                   
                    
                  ],
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 320,
                    height: 55,
                    child: TextFormField(
                      onChanged: (value) {
                                if (value.isEmpty) {
                                  searchingMovieProvider.getQuery(query: 'The');
                                }
                                else{
                                  searchingMovieProvider.getQuery(query: value);
                                }
                                
                              },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xff36076B).withOpacity(0.3),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: "Search",
                        hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                        suffixIcon: Icon(
                          Icons.search_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                 
                 
                    Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    child: ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:  searchingMovieProvider.searchMovieResponse.results!.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20, right: 10),
                                          child: Container(
                                            width: 200,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(20),
                                                   color:Color(0xff36076B).withOpacity(0.3),
                                                  ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 200,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${searchingMovieProvider.searchMovieResponse.results![index].posterPath}'
                                                            ),
                                                        fit: BoxFit.fill,
                                                      ),
                                                      borderRadius: BorderRadius.circular(8)),
                                                ),
                                                Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: Column(
                                                    children: [
                                                      
                                                      Container(
                                                       alignment: Alignment.center,
                                                        height:80 ,
                                                        child: Text("${searchingMovieProvider.searchMovieResponse.results![index].originalTitle}",maxLines: 2,overflow: TextOverflow.fade,style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                 
              ],
            ),
          ),
              ),
            ),
        ));
  }
}
