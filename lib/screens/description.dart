import 'package:flutter/material.dart';
class Description extends StatelessWidget {

  const Description({ this.name, this.descrption,
    this.bannerUrl, this.poseterUrl, this.vote,
    this.launchOn});
  final name,descrption,bannerUrl,poseterUrl,vote,launchOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: [
                   Container(
                   // height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerUrl,fit: BoxFit.cover,),
                  ),
            SizedBox(height: 15,),
                   Container(
                    child: Text( name != null ? name : "Name not display",
                        style: TextStyle(color: Colors.white,
                            fontSize: 20,fontFamily: "TIMES NEW ROMAN")
                    ),
                      ),
            SizedBox(height: 10,),
            Container(
              child: Text("Released on: "+launchOn,
                  style: TextStyle(color: Colors.white,
                      fontSize: 16,fontFamily: "Verdana")
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Text("Average Rating ⭐: "+vote,
                  style: TextStyle(color: Colors.white,
                      fontSize: 16,fontFamily: "Verdana")
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Container(
                  height: 250,
                  width: 100,
                  child: Image.network(poseterUrl,),
                ),
                SizedBox(width: 10,),
                Flexible(child:
                Container(
                  child: Text(descrption,
                      style: TextStyle(color: Colors.white,
                          fontSize: 16,fontFamily: "Verdana")
                  ),
                )
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

}
