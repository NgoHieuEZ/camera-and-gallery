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
      body: Column(
        
      ),
    );
  }
}
