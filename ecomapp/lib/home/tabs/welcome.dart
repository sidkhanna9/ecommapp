import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ecomapp/globals/global.dart' as gb;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecomapp/searchhandler/SearchList.dart' as sl;
class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 


    return new MaterialApp(

      
      home: DukaanHome(),
    );

  }

  }

  class DukaanHome extends StatefulWidget{
    DukaanHome({Key key, this.title}) : super(key: key);

  final String title;
  @override
  State<StatefulWidget> createState() => DukaanState();


  }

  class DukaanState extends State<DukaanHome>{
 
Future<String> getData() async{

  if(searchQuery!=""){
  String url=gb.searchURL+searchQuery;
    var uri= Uri.encodeFull(url);
    print(uri);

http.Response response = await http.get(uri,
headers: gb.getHeader);
var jsonData=json.decode(response.body);

gb.mp.clear();
for (var v in jsonData)
{

gb.tmp.productId= v['productId'];
gb.tmp.productName= v['productName'];
gb.tmp.category= v['category'];
gb.tmp.keyFeatures= v['keyFeatures'];
gb.tmp.description= v['description'];
gb.tmp.imageUrl= v['imgURL'];
gb.tmp.rating= v['rating'];
gb.tmp.bestPrice= v['bestPrice'];
gb.tmp.outOfStock= v['outOfStock'];

  gb.mp.add(gb.tmp);
}
Navigator.push(context, MaterialPageRoute(builder: (context){
return sl.SearchList();
}));
  
  }
  else{
Fluttertoast.showToast(
        msg: "Enter Search Query"  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  

    
  }
  }

Widget appTitle=new Text("Dukaan.com");
  Icon ic=new Icon(Icons.search);
  Icon goIcon=new Icon(Icons.navigate_next);
  TextEditingController textEditingController=new TextEditingController();
  bool vbool=false;
String searchQuery;

List<Widget> _buildCategory(){
    List<Container> containers=new List<Container>.generate(8,
    (int index){
        final imageName='assets/cool-htc-one-wallpapers-4310228.png';
      return new Container(
        child: new Image.asset(imageName, 
        fit: BoxFit.cover,
        height: 150.0,
        width: 150.0,),
      );
    } 
    );
    return containers;
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      appBar: new AppBar(
        centerTitle: true,
        title: appTitle,
        actions: <Widget>[
          new IconButton(
            icon: ic,
            onPressed: (){
              setState(() {
                              if(this.ic.icon==Icons.search){
                                this.ic=new Icon(Icons.close);
                                this.goIcon=new Icon(Icons.navigate_next);
                                this.vbool=true;
                                this.appTitle=new TextFormField(
                                  controller: textEditingController,
                                  keyboardType: TextInputType.text,
                                  
                                  onFieldSubmitted: (term){
                                    this.searchQuery=textEditingController.text.toString();
                                    print(searchQuery);
                                    FocusScope.of(context).requestFocus(new FocusNode());
                                    
                                    getData();

                                    
                                  }

                                  ,
                                  style: new TextStyle(
                                    color:Colors.white,
                                    
                                  ),
                                );
                              }
                              else{
                                this.ic=new Icon(Icons.search);
                                this.appTitle=new Text("dukaan.com");
                              this.vbool=false;
                              }

                            });


            },
          ),
          Visibility(
            visible: vbool,
          child:new IconButton(
            icon: goIcon,
            
            onPressed: (){

                    this.searchQuery=textEditingController.text.toString();
                    print(this.searchQuery);
                    FocusScope.of(context).requestFocus(new FocusNode());
                    getData();

            },
          )
          ),
          
      
        ],
      ),
      body: new GridView.extent(
         maxCrossAxisExtent: 150.0,
         mainAxisSpacing: 5.0,
         crossAxisSpacing: 5.0,
         padding: const EdgeInsets.all(5.0),
         children: _buildCategory(),
       )
    );
  }
  }