import 'package:cine_quest/description.dart';
import 'package:cine_quest/widgets/toprated.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class TrendingMovies extends StatelessWidget {

 final List  trending;
  const TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        modified_text(text:'Trending Movies',size:25.0,color: Colors.white,),
        SizedBox(height:20.0),
        Container(height:290,
        child:ListView.builder(
          itemCount:trending.length ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(
                  name: trending[index]['title'],
                   description: trending[index]['overview'],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path'], 
                    posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                     vote: trending[index]['vote_average'].toString(), 
                     launch_date: trending[index]['release_date'])));

              },
              child:Container(
                width:140,
                child:Column(children: [
                  Container(
                    height: 200,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+ trending[index]['poster_path']
                      ))
                    )
                  ),

                  Container(
                    child:modified_text(
                      text:trending[index]['title'] !=null ?  
                      trending[index]['title']: 'Loading' ,

                       color: Colors.white,
                        size: 20.0)
                  )
                ],)
              ),
             
            );
          }),)
      ],)
    );
  }
}