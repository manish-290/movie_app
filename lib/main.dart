import 'package:cine_quest/utils/text.dart';
import 'package:cine_quest/widgets/toprated.dart';
import 'package:cine_quest/widgets/trending.dart';
import 'package:cine_quest/widgets/tvshows.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
        brightness:Brightness.dark,
        
         ) ,
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingMovies = [];
  List topratedMovies =[];
  List tv = [];

  final String apiKey='45b7b6b3ef78a5497d532b362f285c06';

  final readAccessToken ='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NWI3YjZiM2VmNzhhNTQ5N2Q1MzJiMzYyZjI4NWMwNiIsInN1YiI6IjY0OGJjYzA3YzNjODkxMDEyZDVjODBhYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vXrgZjx9XIC6mq5r43a0T0R6L1_TdUL4-uhKPctRE_Y';
  
  //when app loads execute it first
@override
void initState(){

  loadMovies();
  super.initState();
}

loadMovies() async{
  TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
  logConfig: ConfigLogger(
    showLogs: true,
    showErrorLogs: true
  )
  );

  Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
  Map topratedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
  Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
  
  
  
  setState(() {
    trendingMovies = trendingResult['results'];
    topratedMovies = topratedResult['results'];
    tv = tvResult['results'];
  });
  print(tv);
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
        appBar: AppBar(
          title: modified_text(
            text:'CineQuest 📺', 
            color: Color.fromARGB(255, 249, 212, 5),
            size: 20.0,
            
            ),
          leading:Icon(Icons.movie),
          centerTitle: true,
         backgroundColor: Colors.transparent,
        ),
        body: ListView(
          children: [
            TopRatedMovies(topRated: topratedMovies),
            TrendingMovies(trending: trendingMovies),
            TvShows(tvShows: tv)
          ],
        ),
      );
  }
}