import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
Widget _buildContent(){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildSearch(),
        ],
      ),
    );
  }

  Widget _buildSearch(){
    return new Container(
    child:
    Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right:16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
           TextField(
  decoration: InputDecoration(
      labelText: "Search",
      hintText: "Search",
      prefixIcon: Icon(Icons.search),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)))),
  ),
        ]
      )
    )
    );

  }

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
    containers.add(_buildSearch());
    return containers;
    }

  Widget build(BuildContext context){

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Dukaan.com'),
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