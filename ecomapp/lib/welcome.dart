import 'package:ecomapp/MiniProduct.dart';
import 'package:flutter/material.dart';
class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
 


    return new MaterialApp(

      title: "Welcome",
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
      // appBar: new AppBar(
      //   centerTitle: true,
      //   title: appTitle,
      // ),
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