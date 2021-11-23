import 'package:flutter/material.dart';
import 'package:tmdp_app/screens/description.dart';

class TopRated extends StatelessWidget {
  final List topRated;
  const TopRated({Key? key,required this.topRated}) : super(key: key);

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
          Text("Top Rated Movies",
            style: TextStyle(color: Colors.red.shade900,
                fontSize: 24,fontFamily:'TIMES NEW ROMAN'),),

         Container(
            height: 270,
            child: topRated.isEmpty
                ? Center(child: CircularProgressIndicator(color: Colors.red,)):
                 ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Description(
                          name: topRated[index]['title'],
                          bannerUrl:path+topRated[index]['backdrop_path'],
                          poseterUrl:path+topRated[index]['poster_path'],
                          descrption: topRated[index]['overview'],
                          vote: topRated[index]['vote_average'].toString(),
                          launchOn: topRated[index]['release_date'],

                        );
                      })
                      );

                    },
                    child:topRated[index]['title']!=null?Container(
                      width: 140,
                      child: Column(
                        children: [
                          SizedBox(height:10),
                          topRated[index]['poster_path']!=null?
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
                                            path+topRated[index]['poster_path']
                                        )
                                    )
                                ),
                              )

                            ],
                          ):Container(),
                          SizedBox(height:10),
                          Flexible(
                            child: Text(topRated[index]['title'] != null ?
                            topRated[index]['title'] : 'Name not display'
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
