import 'dart:convert';
import 'package:ecomapp/Login/signup.dart';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/home/tabs/customerdata/account.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ecomapp/home/home_page.dart';

class Login extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return new MaterialApp(
     
      home: new LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      )
    );
  }
}

class LoginPage extends StatefulWidget{
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{


  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  FocusNode fn=new FocusNode();
  final passwordController=TextEditingController();
  final emailController=TextEditingController();



  @override
  void initState(){
    super.initState();
    _iconAnimationController=new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 300)
    );
    _iconAnimation=new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }




Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit the App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;
  }

  Future<String> getData() async {


// Map<String,dynamic> jsonMap ={
// 'email':emailController.text,
// 'password':passwordController.text
// };
if(emailController.text==""){
  Fluttertoast.instance.showToast(
        msg: "Email is required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white
    );
  
}
if(passwordController.text==""){
  Fluttertoast.instance.showToast(
        msg: "Password is required",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white
    );
}
if(passwordController.text!="" && emailController.text!=""){
 
Map map={
'emailId':emailController.text,
'password':passwordController.text
};
print(emailController.text);

print(passwordController.text);


http.Response response = await http.post(gb.loginURL,
headers: {
  "Content-Type":"application/json"
},
body: utf8.encode(json.encode(map)),

);

var jsonData=json.decode(response.body);

if(jsonData['status']=="SUCCESS")
{
  http.Response response2=await http.get(Uri.encodeFull(gb.hostip+gb.userDetail+emailController.text),
  headers: gb.getHeader
  );
  var jsonData2=json.decode(response2.body);
  gb.session.emailId=emailController.text;
  gb.session.password=passwordController.text;
  gb.session.lastName=jsonData2['lastName'];
  gb.session.firstName=jsonData2['firstName'];
  gb.session.phoneNumber=jsonData2['phoneNumber'];
  Fluttertoast.instance.showToast(
        msg: "Login Success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white
    );
    
  Navigator.push(context, MaterialPageRoute(builder:(context){




    return HomePage();
  }));



}
else{
  Fluttertoast.instance.showToast(
        msg: "Login Failed"  +jsonData['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);


} 
  }}

  @override
  Widget build(BuildContext context){
    return new WillPopScope(
      onWillPop: ()=>_onWillPop(),
      child: new Scaffold(
      resizeToAvoidBottomPadding: false,
      
      backgroundColor: Colors.black,
      
      body: new Stack(fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/cool-htc-one-wallpapers-4310228.png"),
            fit: BoxFit.cover,
           // color: Colors.black87,
            //colorBlendMode: BlendMode.lighten,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child:Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0
                      )
                    )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                new TextFormField(
                  // focusNode: fn,
                  onFieldSubmitted: (term){ 
                    FocusScope.of(context).requestFocus(fn);
                    },
                  controller: emailController,
                    decoration: new InputDecoration(
                      labelText: "Enter Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                ),
                new TextFormField(
                  focusNode: fn,
                  onFieldSubmitted: (term){
                    FocusScope.of(context).requestFocus(new FocusNode());
                  },
                  controller: passwordController,
                    decoration: new InputDecoration(
                      labelText : "Enter Password",
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                ),
                new Padding(
                padding: const EdgeInsets.only(top: 20.0)
                ),
                //start
                new ButtonTheme.bar(
                  
                   child: new ButtonBar(
mainAxisSize: MainAxisSize.min,
           // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                 new RaisedButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Login"),
                  onPressed: getData,
                  splashColor: Colors.redAccent,

                )
                ,
                 new RaisedButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Signup"),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Signup();
                    }));
                  },
                  splashColor: Colors.redAccent,
                )
                
            ]
                )
                )
                    ],
                ),
                  ),
                ),
                ),
            ],
          ),
        ],
      ),
    ));
  }
}
