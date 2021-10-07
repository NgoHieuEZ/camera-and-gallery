import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PopUpNotification extends StatelessWidget {
  const PopUpNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pop Up Notification"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Click me"),
                onPressed: (){
                showDialog(context: context, builder: (context)=>CustomDialog(
                  title: "Sucessfull",
                  description: "Today i want change yourseflt",
                ));

                }),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20,),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            )

          ],
        ),
      ),
    );
  }
}


class CustomDialog extends StatelessWidget {
  final String? title,description;
  CustomDialog({this.title,this.description});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
            Stack(
              children: [
                /// dùng để box shadow.......
                Positioned(
                  top: 40,
                  left: 60,
                  child: Container(
                    height: 70,
                    width: 190,
                    decoration: BoxDecoration(
                       // color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              offset: Offset(5,-10)
                          )
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 300,left: 30),
                  child:   InkWell(
                      onTap: (){

                      },
                      child: Image(image: AssetImage('assets/anh2.png'),fit: BoxFit.cover,)
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 200),
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Ink(
                          width: 50,
                          height: 50,
                          child: Icon(Icons.minimize_outlined,size: 50,color: Colors.grey,)),
                    ),

                  ),
                ),
              ],
            ),

      ],
    );
  }
}




