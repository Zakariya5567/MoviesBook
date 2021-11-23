

import 'package:flutter/material.dart';
import 'package:tmdp_app/screens/description.dart';

class TrendingMovies extends StatelessWidget {
  final List trending;
  const TrendingMovies({Key? key,required this.trending,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String path='https://image.tmdb.org/t/p/w500';
    return
    Container(
      padding: EdgeInsets.only(top: 15,left: 10),
      color: Colors.black,
      child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          //  SizedBox(height:10),
            Text("Trending Movies",
              style: TextStyle(color: Colors.red.shade900,
                  fontSize: 24,fontFamily:'TIMES NEW ROMAN'),),

            Container(
              height: 280,
              child:trending.isEmpty
                  ? Center(child: CircularProgressIndicator(color: Colors.red,)):
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                  itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Description(
                          //name: trending[index]['title'],
                          bannerUrl:path+trending[index]['backdrop_path'],
                          poseterUrl:path+trending[index]['poster_path'],
                          descrption: trending[index]['overview'],
                          vote: trending[index]['vote_average'].toString(),
                          launchOn: trending[index]['release_date'],

                        );
                      })
                      );

                    },
                    child: trending[index]['title']!=null?
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      width: 140,
                      child: Column(
                        children: [
                          SizedBox(height:10),
                          trending[index]['poster_path']!=null?
                              Stack(
                                children: [
                                  Container(
                                    height:200,
                                   child: Center(child:
                                   CircularProgressIndicator(color: Colors.blue,strokeWidth: 1,))
                                  ),
                                  Container(
                                    height:200,
                                    decoration:BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                path+trending[index]['poster_path']
                                            )
                                        )
                                    ),
                                  )

                                ],
                              ) :Container(),
                          SizedBox(height:10),
                          Flexible(
                            child: Text(trending[index]['title'] != null ?
                            trending[index]['title'] : 'Name not display'
                              ,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 14,fontFamily: "Verdana"),
                            ),
                          )
                        ],
                      ),
                    ):Container(),

                  );
                  }

              ),
            ),
          ],
        ),
    );
  }
}
