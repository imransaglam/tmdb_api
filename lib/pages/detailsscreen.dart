import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_api/pages/homescreen.dart';

import '../provider/tmdb_provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.movie_id, required this.index,});
  final String movie_id;
  final int index;
  

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}


class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    // TODO: implement initState
   print(widget.movie_id);
    Provider.of<TmdbProvider>(context,listen: false).getGetMovieData(movie_id: widget.movie_id, index: widget.index);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff21222E),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                ),
                Consumer(
                   builder: (context, TmdbProvider movieProvider, child) =>
                          movieProvider.isMoviesResponseLoading == true
                              ? CircularProgressIndicator():
                   Container(
                      width: MediaQuery.of(context).size.width,
                      height: 460,
                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:NetworkImage("https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movieProvider.moviesResponse.results![widget.index].posterPath}"),
                                            fit: BoxFit.cover,
                                          ),
                                         ),
                    ),
                ),
                  Padding(
                    padding: const EdgeInsets.only(top:40,right: 20,left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[ 
                        Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_rounded,size: 24,color: Colors.white,)),
                          SizedBox(width: 10,),
                          Text("Go Back",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: Color(0xff303243),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Icon(Icons.favorite_border_sharp,size: 24,color: Colors.white,)),
                      ]
                    ),
                  ),
                   Positioned(
                    bottom: 15,
                    left: 20,
                     child: Container(
                              height: 60,
                              width: 60,
                              child: CircularProgressIndicator(
                                backgroundColor: Colors.grey.withOpacity(.5),
                                color: Color(0xffFF1F8A),
                                value: .35,
                                strokeWidth: 7,
                              ),
                            ),
                   ),
                   Positioned(
                    bottom: 33,
                    left: 40,
                    child: Text("45",style: TextStyle(color:Colors.white,fontSize: 18,fontWeight:FontWeight.bold),)),
                     Positioned(
                       bottom: 40,
                       left: 120,
                       child: Consumer(
                         builder: (context, TmdbProvider movieProvider, child) =>
                          movieProvider.isMoviesResponseLoading == true
                              ? CircularProgressIndicator():
                         Text(movieProvider.moviesResponse.results![widget.index].originalTitle![0].toString(),style: TextStyle(color:Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)),
                     ),
                   Positioned(
                     bottom: 18,
                     left: 120,
                     child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("10/12/2021 (BR)",style: TextStyle(color:Color(0xffbbbbbb),fontSize: 16,fontWeight: FontWeight.w400),),
                                SizedBox(width: 10,),
                                Padding(
                                  padding: const EdgeInsets.only(top:3),
                                  child: Icon(Icons.circle_rounded,size: 11,color:Color(0xffbbbbbb)),
                                ),
                                SizedBox(width: 10,),
                                Icon(Icons.access_time,size: 19,color:Color(0xffbbbbbb)),
                                Text("1h  53m",style: TextStyle(color:Color(0xffbbbbbb),fontSize: 16,fontWeight: FontWeight.w400),),
                              ],
                            ),
                   )
                  ]
            ),
                        
           Padding(
             padding: const EdgeInsets.only(left: 25,right: 25),
             child: Divider(color: Colors.black.withOpacity(.48),thickness: 1.5,),
           ),   
           Padding(
             padding: const EdgeInsets.only(top:10,left: 25,right: 25),
             child: Text("After serving time for a violent crime, Ruth returns to society, which refuses to forgive her past. Broken down in the place she once called home, her only hope is to find the sister she was forced to leave behind.",style: TextStyle(color: Color(0xffCCCCCC),fontSize: 14,fontWeight: FontWeight.w400),),
           ),
           Padding(
             padding: const EdgeInsets.only(left:50,top:25,right: 50),
             child: Container(
              width: 315,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end:Alignment.bottomCenter,
                colors: 
                [
                  Color(0xff8000FF),
                  Color(0xff540BA1)
                ])
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_outline_rounded,size: 20,color:Colors.white),
                  SizedBox(width: 10,),
                  Text("Watch Trailer",style: TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w600),)
                ],
              ),
             ),
           ),
            Padding(
                 padding: const EdgeInsets.only(right:25,left:25,top: 20,bottom: 10),
                 child: Text("Main Cast",style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
               ), 

               Padding(
                 padding: const EdgeInsets.only(left: 15),
                 child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  //color:  Colors.pink,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 8,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top:10,right: 10),
                      child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image:AssetImage("assets/image3.png"),
                                                  fit: BoxFit.fill,
                                                ),
                                                border: Border.all(
                        color: Color(0xff303243),
                        width: 1.5
                      ),
                                                borderRadius: BorderRadius.circular(30)),
                          ),
                          Container(
                            //color: Colors.amber,
                            
                            width: 75,
                            height: 31,
                            child: Padding(
                              padding: const EdgeInsets.only(top:6),
                              child: Text(
                                
                                "Sandra Bullock",
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color:Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                            ))
                        ],
                      ),
                    );
                  },),
                 ),
               ), 
                 Padding(
                 padding: const EdgeInsets.only(right:25,left:25),
                 child: Text("Categories",style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
               ),   

                 Padding(
                 padding: const EdgeInsets.only(top:20,left: 20),
                 child: Container(
                  width: double.infinity,
                  height: 31,
                
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        alignment: Alignment.center,
                        width: 79,
                        
                        decoration: BoxDecoration(
                          color: Color(0xff303243),
                          borderRadius: BorderRadius.circular(70)
                        ),
                        child: Text("Drama",style: TextStyle(color:Colors.white.withOpacity(0.5),fontSize: 16,fontWeight: FontWeight.w400),),
                      ),
                    );
                  },),
                 ),
               ),
                Padding(
                 padding: const EdgeInsets.only(top: 20,left:25),
                 child: Text("Recomendations",style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
               ),

               Padding(
                 padding: const EdgeInsets.only(left:25),
                 child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 188,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top:20,right: 10),
                      child: Container(
                        width: 128,
                        height: 188,
                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image:AssetImage("assets/image3.png"),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius: BorderRadius.circular(8)),
                      ),
                    );
                  },),
                 ),
               ),    
      
          ],
        ),
      ),
    );
  }
}