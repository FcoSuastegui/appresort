import 'package:flutter/material.dart';

class AlertImagePicker extends StatelessWidget {
  final Function onPressCamara, onPressGalery;
  AlertImagePicker({ @required this.onPressCamara, @required this.onPressGalery});

  final TextStyle subtitle = TextStyle(fontSize: 12.0, color: Colors.grey);
  final TextStyle label = TextStyle(fontSize: 14.0, color: Colors.grey);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 280,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                //Text("Thank You!",style: TextStyle(color: Colors.green),),
                Text("¿De donde quieres obtener la foto? ",style: label,),
                Divider(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onPressGalery,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.photo_library),
                        SizedBox(width: 20.0,),
                        Text("Galeria", style: label)
                      ],
                    ),
                  ),
                ),
                Divider(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onPressCamara,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.photo_camera),
                        SizedBox(width: 20.0,),
                        Text("Camara", style: label)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}