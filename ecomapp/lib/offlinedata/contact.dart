import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ecomapp/themedata/Theme.dart' as theme;


 
class Classy extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new Cps();
}
class Cps extends State<Classy> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    List<IconData> ic=[Icons.call,Icons.email,Icons.map,Icons.message];
  List<String> details=["Call","Mail","Map","Sms"];
  
    return MaterialApp(
    
    home: new Scaffold(
      backgroundColor: theme.Colors.productPageBackground,
    appBar: new AppBar(
      backgroundColor: theme.Colors.appBarTitle,
      title: new Text("Contact Us"),

    ),
    body: new Container(child:
    ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context,int index){
        return new ListTile(
          onTap: (){
            nav(index);
          },
            title: new Row(
              children: <Widget>[
                new Icon(ic[index]),
                new Text(details[index]),
              ],
            ),

        );
      },
    ),)
  ));
  }




void nav(int index) async{
if(index==0){

  print("object;");
 const uri = 'tel:+1 222 060 888';
    if (await canLaunch(uri)) {
      await launch(uri);
}
}
if(index==3){
  const uri = 'sms:+39 349 060 888';
    if (await canLaunch(uri)) {
      await launch(uri);
}
}
if(index==2){
  const url = 'geo:52.32,4.917';
    if (await canLaunch(url)) {
      await launch(url);
    } 
}
if(index==1){
  const uri = 'mailto:test@example.org?subject=Greetings&body=Hello%20World';
    if (await canLaunch(uri)) {
      await launch(uri);}
}

}

}
