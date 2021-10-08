import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FormRadioButton extends StatefulWidget {
  const FormRadioButton({Key? key}) : super(key: key);

  @override
  _FormRadioButtonState createState() => _FormRadioButtonState();
}

class _FormRadioButtonState extends State<FormRadioButton> {
  int? selectedRadio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio=0;
  }
  setStateRadio(int value){
    setState(() {
      selectedRadio=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Radio Button"),
      ),
      body: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 7,
                offset: Offset(5,5)
            )
          ]
        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: selectedRadio,
                  onChanged: (value){
                    setStateRadio(int.parse(value.toString()));
                  },
                ),
                SizedBox(width: 10,),
                Text("Raido 0")
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: selectedRadio,
                  onChanged: (value){
                    setStateRadio(int.parse(value.toString()));
                  },
                ),
                SizedBox(width: 10,),
                Text("Raido 1")
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: selectedRadio,
                  onChanged: (value){
                    setStateRadio(int.parse(value.toString()));
                  },
                ),
                SizedBox(width: 10,),
                Text("Raido 2")
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 3,
                  groupValue: selectedRadio,
                  onChanged: (value){
                    setStateRadio(int.parse(value.toString()));
                  },
                ),
                SizedBox(width: 10,),
                Text("Raido 3")
              ],
            )


          ],
        ),
      )
    );
  }
}
