
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:http/http.dart' as http;

class UpLoadScreen extends StatefulWidget {
  const UpLoadScreen({Key? key}) : super(key: key);

  @override
  _UpLoadScreenState createState() => _UpLoadScreenState();
}

class _UpLoadScreenState extends State<UpLoadScreen> {
  List<Asset> images = [];
  File? image;


  //// http api

  asyncFileUpload(String text, File file) async{
    //create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", Uri.parse("https://apiappmobile.vntt.com.vn/WeatherForecast/UploadFile"));
    //add text fields
    request.fields["text_field"] = text;
    //create multipart using filepath, string or bytes
    var pic = await http.MultipartFile.fromPath("file_field", file.path);
    //add multipart to request
    request.files.add(pic);
    var response = await request.send();

    // trả về phản hồi server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
  }



  Future upLoad() async{
    final uri=Uri.parse("https://apiappmobile.vntt.com.vn/WeatherForecast/UploadFile");
    var request=http.MultipartRequest('POST',uri);
    var pic=await http.MultipartFile.fromPath("image", image!.path);
    request.files.add(pic);
    var reponse=await request.send();
    if(reponse.statusCode==200){
      print("sucesss");
    }else{
      print("upload failllll");
    }

  }


  Future uploadPhotos() async {
    Uri uri = Uri.parse('https://apiappmobile.vntt.com.vn/WeatherForecast/UploadFile');
    http.MultipartRequest request = http.MultipartRequest('POST', uri);

      request.files.add(await http.MultipartFile.fromPath('files', image!.path));


    http.StreamedResponse response = await request.send();
    var responseBytes = await response.stream.toBytes();
    print('\n\n');
    print('------------------------------------------------');
    print(responseBytes);
    var responseString = utf8.decode(responseBytes);
    print('\n\n');
    print('RESPONSE WITH HTTP okkkkkkkkkkkkkkkkkk');
    print(responseString);
    print('\n\n');
    return responseString;
  }



  // lấy ảnh từ camera
  Future pickImageCamera() async{
    try{
      final image=await ImagePicker().pickImage(source: ImageSource.camera);
      if(image==null) return;
      final imageTemporary=File(image.path);

      setState(() {

        this.image=imageTemporary;
      });
    }on PlatformException catch(e){
      print("fallllll");
    }
  }

  // hiển thị ảnh ra giao diện từ camera
  Widget buildImgCamera(){
    return Container(
      child:image !=null?Image.file(image!,width: 150,height: 150,fit: BoxFit.cover,): Container(),

    );
  }



  // giao diện hiển thị ảnh ra từ thư viện
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }
  // lấy ảnh từ thư viện
  Future<void> loadAssets() async {
    List<Asset> resultList = [];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print("lỗi ở dây"+e.toString());
    }

    if (!mounted) return;

    setState(() {
      images = resultList;

    });
  }



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("camera"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buidButton(
              title: "picker thư viện",
              icon: Icons.image_outlined,
              onClick: (){
                loadAssets();
              }
          ),
          buidButton(
              title: " picker camera",
              icon: Icons.camera_alt,
              onClick: (){
                pickImageCamera();
              }
          ),
         buildImgCamera(),
          Expanded(child: buildGridView(),),
          SizedBox(height: 30,),
          FlatButton(
              onPressed: (){
                asyncFileUpload("filename",image!);
              },
              child: Text("upFile")
          )
        ],
      ),
    );
  }

  Widget buidButton({required String title,required IconData icon,required VoidCallback onClick}){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(56),
          primary: Colors.white,
          onPrimary: Colors.black,
          textStyle: TextStyle(fontSize: 20)
      ),
      child: Row(
        children: <Widget>[
          Icon(icon,size: 28,),
          SizedBox(height: 16,),
          Text(title),
        ],
      ),
      onPressed: onClick,
    );
  }
}
