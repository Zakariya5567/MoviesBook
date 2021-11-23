import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:tmdp_app/screens/widget/top_rated.dart';
import 'package:tmdp_app/screens/widget/trending.dart';
import 'package:tmdp_app/screens/widget/tv_popular.dart';
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List trendingMoviesList=[];
  List topRatedMoviesList=[];
  List tvShowList=[];

  final String apiKey='e374d99dd2c754994b90d687ee1cef2f';
  final readAccessToken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMzc0ZDk5ZGQyYzc1NDk5NGI5MGQ2ODdlZTFjZWYyZiIsInN1YiI6IjYxOTllYzcyMjk3MzM4MDA5MjEyMzdiMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.UYUBKmRF9XDv3DwMGRYBnYeZoDrkNTJ_1zf2MkU0lhs';
  @override
   void initState(){
    super.initState();
    loadMovies();

  }

  loadMovies()async{
    TMDB tmdbWithCustomLogs=TMDB(ApiKeys(apiKey,readAccessToken),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    )
    );
   Map trendingResult=await tmdbWithCustomLogs.v3.trending.getTrending();
   Map topRatedResult=await tmdbWithCustomLogs.v3.movies.getTopRated();
   Map tvResult=await tmdbWithCustomLogs.v3.tv.getPouplar();

   setState(() {
     trendingMoviesList=trendingResult['results'];
     topRatedMoviesList=topRatedResult['results'];
     tvShowList=tvResult['results'];
   });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        shape: OutlineInputBorder(borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40))),
        title: Text("M O V I E S  B O O K",
          style: TextStyle(color: Colors.white,
              fontSize: 24,fontFamily:'TIMES NEW ROMAN',fontWeight: FontWeight.bold),),

        backgroundColor: Colors.red.shade900,
      ),
     body: ListView(
       children: [
         SizedBox(height: 15,),
         TvPopular(tv: tvShowList),
         SizedBox(height: 15,),
         TrendingMovies(trending: trendingMoviesList),
         SizedBox(height: 15,),
         TopRated(topRated: topRatedMoviesList),

       ],
     ),
    );
  }
}
