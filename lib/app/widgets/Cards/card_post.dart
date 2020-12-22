import 'package:flutter/material.dart';

class CardPost extends StatelessWidget {
  
  final avatar, title, subtitle, date, content;
  final List children;
  CardPost({
    @required this.avatar,
    this.title = '',
    this.subtitle = '',
    this.date = '',
    this.content = '',
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20.0),
                    height: 80.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0.0)
                      ),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(avatar)
                      )
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                        child: Text( title , style: TextStyle( fontSize: 15.0),),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            subtitle,
                            style: TextStyle( fontSize: 12.0),
                          ) 
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                        child: Text(
                            date,
                            style: TextStyle( fontSize: 12.0),
                          ) 
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              thickness: 1.5,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Text(
                content,
                style: TextStyle( fontSize: 15.0),
              ) 
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: children
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}