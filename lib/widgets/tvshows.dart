import 'package:cine_quest/description.dart';
import 'package:flutter/material.dart';

import '../utils/text.dart';

class TvShows extends StatelessWidget {

 final List  tvShows;
  const TvShows({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        modified_text(text:'Popular TV Shows',size:25.0,color: Colors.white,),
        SizedBox(height:20.0),
        Container(height:290,
        child:ListView.builder(
          itemCount:tvShows.length ,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Description(
                  name: tvShows[index]['original_name'],
                   description: tvShows[index]['overview'],
                    bannerurl: 'https://image.tmdb.org/t/p/w500'+tvShows[index]['backdrop_path'], 
                    posterurl: 'https://image.tmdb.org/t/p/w500'+tvShows[index]['poster_path'],
                     vote: tvShows[index]['vote_average']. toString(), 
                     launch_date: tvShows[index]['first_air_date'])));

              },
              child:Container(
                width:140,
                child:Column(children: [
                  Container(
                    height: 200,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500'+ tvShows[index]['poster_path']
                      ))
                    )
                  ),

                  Container(
                    child:modified_text(
                      text:tvShows[index]['original_name'] !=null ?  
                      tvShows[index]['original_name']: 'Loading' ,

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
