import 'package:cine_quest/utils/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {

  final String name, description, bannerurl, posterurl, vote, launch_date;
  const Description({
    super.key,
    required this.name,
    required this.description,
    required this.bannerurl,
    required this.posterurl,
    required this.vote,
    required this.launch_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Container(
        child:ListView(
          children:<Widget>[
            Container(
              height:250,
              child:Stack(
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(bannerurl, fit:BoxFit.cover),
                  )),
                  Positioned(
                    bottom:10,
                    child: modified_text(
                    text:'⭐Average Rating - '+vote.toString(),
                    size: 18.0,
                    color: const Color.fromARGB(255, 252, 5, 5),
                  )),
                ],
              )
            ),
            SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                text: name!=null ? name:'Not Loaded',
                color: Colors.white,
                size:24.0
              )
            ),
            Container(
              padding: EdgeInsets.only(left:15.0),
              child: modified_text(
                text: 'Releasing on - '+launch_date,
                size:14.0,
                color:Colors.white
              ),
            ),
            Row(children: [
              Container(
                margin: EdgeInsets.all(5),
                height:200,
                width:100,
                child:Image.network(posterurl),
              ),
              Flexible(
                child: Container(
                  child:modified_text(
                    color: Colors.white,
                    size:18.0,
                    text: description,)
                ),
              )
            ],)
          ],
        )
      )
    );
  }
}