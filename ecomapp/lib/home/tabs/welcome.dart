import 'package:ecomapp/searchhandler/MiniProduct.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ecomapp/themedata/Theme.dart' as theme;

import 'package:ecomapp/globals/global.dart' as gb;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ecomapp/searchhandler/SearchList.dart';
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
 List<String> image=[gb.laptopURL,gb.accPhone,gb.phoneURL,gb.furnitureURL,gb.watchURL,gb.clothURL,gb.shoeURL,gb.jewelry];
List<String> name=["Electronics" , "Phones" , "Phone Accessories" , "Furniture" , "Watches" , "Clothing" , "Shoes" , "Jewellery"];
Widget appTitle=new Text("Dukaan.com");



List<Widget> _buildCategory(){
    List<Widget> containers=new List<Widget>.generate(8,
    (int index){
        final imageName=image[index];
      return GestureDetector(
        
        onTap: ()async{
          gb.searchQuery=name[index];
          http.Response response=await http.get(Uri.encodeFull(gb.categorySearchUrl+name[index]),headers: gb.getHeader);
          print(response.body);
//////////
var jsonData=json.decode(response.body);
gb.mp.clear();
for (var v in jsonData)
{
MiniProduct tmp=new MiniProduct();
tmp.productId= v['productId'];
tmp.productName= v['productName'];
tmp.category= v['category'];
tmp.keyFeatures= v['keyFeatures'];
tmp.description= v['description'];
tmp.imageUrl= v['imageSrc'][0];
tmp.rating= v['productRating'];
tmp.bestPrice= 0;
//tmp.outOfStock= v['outOfStock'];

  gb.mp.add(tmp);
  gb.searchQuery=name[index];
  print(gb.mp.last.productId);
  print(gb.mp.first.productId);
}
gb.homeContext=context;
Navigator.push(context,MaterialPageRoute(builder: (context) {

  return new SearchList();
}));
  
  


        }
        ,
        child:  Container(   
child:new Column(children:
  <Widget>[
           Image.network(imageName, 
        fit: BoxFit.cover,
        height: 150.0,
        width: 150.0,
        ),
Text(name[index]),
        ]
      )
      )
      );
    }
    );
    return containers;
    }


    
Future<String> getData() async{

gb.mp.clear();
  if(gb.searchQuery!=""){
  String url=gb.searchURL+gb.searchQuery;
    var uri= Uri.encodeFull(url);
    print(uri);

http.Response response = await http.get(uri,
headers: gb.getHeader);

print("\n");
print("\n");
print("\n");

print(response.body);

print("\n");
print("\n");
var jsonData=json.decode(response.body);
gb.mp.clear();
for (var v in jsonData)
{
MiniProduct tmp=new MiniProduct();
tmp.productId= v['productId'];
tmp.productName= v['productName'];
tmp.category= v['category'];
tmp.keyFeatures= v['keyFeatures'];
tmp.description= v['description'];
tmp.imageUrl= v['imageSrc'];
tmp.rating= v['productRating'];
tmp.bestPrice= v['bestPrice'];
tmp.outOfStock= v['outOfStock'];

  gb.mp.add(tmp);
  
  print(gb.mp.last.productId);
  print(gb.mp.first.productId);
}

Navigator.of(gb.homeContext).push(MaterialPageRoute(builder: (context){

  return new SearchList();
}));
  
  
  }
  else{
Fluttertoast.instance.showToast(
        msg: "Enter Search Query"  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  

    
  }
  return "";
  }

//Widget appTitle=new Text("Dukaan.com");
  Icon ic=new Icon(Icons.search);
  Icon goIcon=new Icon(Icons.navigate_next);
  TextEditingController textEditingController=new TextEditingController();
  bool vbool=false;

// Future<List<Widget>> _buildCategory() async {
//     List<Container> containers=new List<Container>.generate(8,
//     (int index){
//         final imageName='assets/cool-htc-one-wallpapers-4310228.png';
//       return new Container(
//         child: new Image.asset(imageName, 
//         fit: BoxFit.cover,
//         height: 150.0,
//         width: 150.0,),
//       );
//     } 
//     );
//     return containers;
//     }
  @override
  Widget build(BuildContext context) {
    gb.homeContext=context;
    return new MaterialApp(home:Scaffold(
        backgroundColor: theme.Colors.productPageBackground,
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
                                    gb.searchQuery=textEditingController.text.toString();
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

                    gb.searchQuery=textEditingController.text.toString();
                    print(gb.searchQuery);
                    FocusScope.of(context).requestFocus(new FocusNode());
                    getData();

            },
          )
          ),
          
      
        ],
      ),
       body: new GridView.extent(
         maxCrossAxisExtent: 200.0,
         mainAxisSpacing: 10.0,
         crossAxisSpacing: 10.0,
         padding: const EdgeInsets.all(5.0),
         children: _buildCategory(),
    )));
  }
  }