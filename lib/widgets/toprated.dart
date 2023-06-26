import 'package:cine_quest/description.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class TopRatedMovies extends StatelessWidget {

 final List  topRated;
  const TopRatedMovies({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        modified_text(text:'Top Rated Movies',size:25.0,color: Colors.white,),
        SizedBox(height:20.0),
        Container(height:330,
        child:ListView.builder(
          itemCount:topRated.length ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){

                 Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(
                  name: topRated[index]['title'],
                   description: topRated[index]['overview'],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['backdrop_path'], 
                    posterurl: 'https://image.tmdb.org/t/p/w500'+topRated[index]['poster_path'],
                     vote: topRated[index]['vote_average'].toString(), 
                     launch_date: topRated[index]['release_date'])));

              },
              child:Container(
                width:140,
                child:Column(children: [
                  Container(
                    height: 200,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+ topRated[index]['poster_path']
                      ))
                    )
                  ),

                  Container(
                    child:modified_text(
                      text:topRated[index]['title'] !=null ?  
                      topRated[index]['title']: 'Loading' ,

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