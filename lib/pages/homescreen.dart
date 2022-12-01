import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end:Alignment.bottomCenter,
              colors: 
              [
                Color(0xff8000FF),
                Colors.black
              ])
          ),
          child: Padding(
          padding: const EdgeInsets.only(left: 20,top:20,right: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                    width: 200,
                    child: Text("What would you like to watch today ?",
                    maxLines: 2,
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                  ),
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.5),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5
                      ),
                      image: DecorationImage(image: AssetImage("assets/image3.png"),fit: BoxFit.cover)
                    ),
                  ),
                 
                  ]
                ),
                 Padding(
                   padding: const EdgeInsets.only(top:30,left:20,right: 20),
                   child: Container(
                width: 300,
                    height: 55,
                     child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xff36076B).withOpacity(0.3),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide: BorderSide.none
                            
                            ),
                            contentPadding: EdgeInsets.only(left:10),
                            hintText: "Search",
                            hintStyle: TextStyle(color:Colors.white,fontSize: 15,fontWeight: FontWeight.w500),
                            suffixIcon: Icon(Icons.search_sharp,color: Colors.white,),
                        
                          ),
                                     ),
                   ),
                 ),
                 
               Padding(
                 padding: const EdgeInsets.only(top:20),
                 child: Container(
                  width: double.infinity,
                  height: 31,
                
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: (() {
                          setState(() {
                            current=index;
                          });
                        }),
                        child: Container(
                          alignment: Alignment.center,
                          width: 79,
                          
                          decoration: BoxDecoration(
                            color: current==index?Color(0xffFF1F8A):Color(0xff8000FF).withOpacity(0),
                            borderRadius: BorderRadius.circular(70)
                          ),
                          child: Text("Movies",style: TextStyle(color:current==index?Colors.white:Colors.white.withOpacity(0.5),fontSize: 16,fontWeight: FontWeight.w400),),
                        ),
                      ),
                    );
                  },),
                 ),
               ),
               Container(
                width: MediaQuery.of(context).size.width,
                height: 188,
                child: ListView.builder(
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
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: Text("Most Popular",style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
               ),
               Container(
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
              ],
            ),
        ),
        ),
      ),
      
      
    );
  }
}