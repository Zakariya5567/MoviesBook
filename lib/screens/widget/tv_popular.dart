import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../description.dart';

class TvPopular extends StatelessWidget {
  final List tv;
  const TvPopular({Key? key,required this.tv}) : super(key: key);
  final bool isloading=false;

  @override
  Widget build(BuildContext context) {
    String path=  'https://image.tmdb.org/t/p/w500';
    return Container(
      padding: EdgeInsets.only(top: 15,left: 10),
      color: Colors.black,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Popular Tv Shows",
            style: TextStyle(color: Colors.red.shade900,
                fontSize: 24,fontFamily:'TIMES NEW ROMAN'),),
          Container(
            height: 200,
            child: tv.isEmpty
                ? Center(child: CircularProgressIndicator(color: Colors.red,)):
                ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv.length,
                itemBuilder: (context,index){
               return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Description(
                          name: tv[index]['original_name'],
                          bannerUrl:path+tv[index]['backdrop_path'],
                          poseterUrl:path+tv[index]['poster_path'],
                          descrption: tv[index]['overview'],
                          vote: tv[index]['vote_average'].toString(),
                          launchOn: tv[index]['first_air_date'],

                        );
                      })
                      );
                    },
                    child:  tv[index]['original_name']!=null ?
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 240,
                      child: Column(
                        children: [
                          SizedBox(height:10),
                          tv[index]['poster_path'] != null ?
                              Stack(
                                children: [
                                  Container(
                                      width: 240,
                                      height:150,
                                   child: Center(child:
                                   CircularProgressIndicator(color: Colors.blue,strokeWidth: 1,),)
                                  ),
                                  Container(
                                    width: 240,
                                    height:150,
                                    decoration:BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image:DecorationImage(
                                          image: NetworkImage(
                                              path+tv[index]['poster_path']
                                          ),fit: BoxFit.cover,
                                        )

                                    ),
                                  )
                                ],
                              )

                              :Container(),
                          SizedBox(height:10),
                          Flexible(
                            child: Text(tv[index]['original_name'] != null ?
                            tv[index]['original_name'] : 'Name not display'
                              ,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 16,fontFamily: "Verdana"),
                            ),
                          )
                        ],
                      ),
                    ):Container()


                  );
                }

            ),
          ),
        ],
      ),
    );
  }
}
