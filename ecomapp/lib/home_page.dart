import 'dart:convert';

import 'package:ecomapp/MiniProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'SearchList.dart' as sl;
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 


    return new MaterialApp(

      title: "HomePage",
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
List<MiniProduct> mp=[];
  class DukaanState extends State<DukaanHome>{
  Widget appTitle=new Text("Dukaan.com");
  Icon ic=new Icon(Icons.search);
  Icon goIcon=new Icon(Icons.navigate_next);
  TextEditingController textEditingController=new TextEditingController();
  bool vbool=false;
String searchQuery;
Future<List<MiniProduct>> getData() async{

  print("Get Data mei ghusa");
  String url="http://10.177.7.88:7000/search/all/"+searchQuery;
  print(url);
    var uri= Uri.encodeFull(url);
    print(uri);

http.Response response = await http.get(uri,
headers: {
  "Accept":"application/json"
});
print(response.body);
var jsonData=json.decode(response.body);


for (var v in jsonData)
{

  MiniProduct mini=MiniProduct(productId: v['productId'],productName: v['productName'],category: v['category'],keyFeatures: v['keyFeatures'],description: v['description'],imageUrl: v['imgURL'],rating: v['rating'],bestPrice: v['bestPrice'],outOfStock: v['outOfStock']);
print(v['imgURL']);
print(mini);
  mp.add(mini);
}
Navigator.push(context, MaterialPageRoute(builder: (context){
return sl.SearchList();
}));
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
          )
        ],
      ),


    );
  }


  }




  
// Widget _buildContent(){
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           _buildSearch(),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearch(){
//     return new Container(
//     child:
//     Padding(
//       padding: const EdgeInsets.only(top: 16.0, left: 16.0, right:16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//            TextField(
//   decoration: InputDecoration(
//       labelText: "Search",
//       hintText: "Search",
//       prefixIcon: Icon(Icons.search),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.all(Radius.circular(25.0)))),
//   ),
//         ]
//       )
//     )
//     );

//   }

//   List<Widget> _buildCategory(){
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
//     containers.add(_buildSearch());
//     return containers;
//     }

  // Widget build(BuildContext context){

  //   return new MaterialApp(
    //  appBar: new AppBar(
       // title: new Text('Dukaan.com'),
    //  ),
      // body: new GridView.extent(
      //   maxCrossAxisExtent: 150.0,
      //   mainAxisSpacing: 5.0,
      //   crossAxisSpacing: 5.0,
      //   padding: const EdgeInsets.all(5.0),
      //   //children:// _buildCategory(),
      // )
//        );
//   }
// } 
