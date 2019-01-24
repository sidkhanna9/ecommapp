import 'dart:convert';
import 'package:ecomapp/globals/global.dart' as gb;
import 'package:ecomapp/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class Signup extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    mct=context;
    return new MaterialApp(
     
      home: new SignupPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      )
    );
  }
}
BuildContext mct;
class SignupPage extends StatefulWidget{
  @override
  State createState() => new SignupPageState();
}

class SignupPageState extends State<SignupPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  final firstNameController=TextEditingController();
  final lastNameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final phoneController=TextEditingController();
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






  Future<String> getData() async {


print(firstNameController.text);
print(lastNameController.text);
print(emailController.text);
print(phoneController.text);
print(passwordController.text);

Map map = {
    'firstName':firstNameController.text,
    'lastName':lastNameController.text,
    'emailId':emailController.text,
    'phoneNumber':phoneController.text,
    'password':passwordController.text
  };

http.Response response = await http.post(gb.signUpURL,
headers: gb.postHeader,
body: utf8.encode(json.encode(map))
);

var jsonData=json.decode(response.body);
var status=jsonData['status'];
print(jsonData['status']);
if(status == "SUCCESS")
{
  
  Fluttertoast.instance.showToast(
        msg: "SignUp Successful Login to continue"  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
          Navigator.of(mct).pop(true);
  

}

else
{
    

  Fluttertoast.instance.showToast(
        msg: "SignUp Failed"  ,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
       
        
       
}
} 

FocusNode fn=new FocusNode();
FocusNode fn2=new FocusNode();
FocusNode fn3=new FocusNode();
FocusNode fn4=new FocusNode();
  @override
  Widget build(BuildContext context){
    
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
    
      backgroundColor: Colors.black,
      
      body:  new SingleChildScrollView(child: new Container(//fit: StackFit.expand,
        child:new Stack(children: <Widget>[
          new Image(
            image: new AssetImage("assets/cool-htc-one-wallpapers-4310228.png"),
            fit: BoxFit.cover,
           // color: Colors.black87,
            //colorBlendMode: BlendMode.lighten,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                       onFieldSubmitted: (term){
                         FocusScope.of(context).requestFocus(fn);
                       },
                       validator: (value){
                         if(value.isEmpty){
                           return 'This field is required';
                         }
                       },
                  controller: firstNameController,
                    decoration: new InputDecoration(
                      labelText: "Enter First Name",
                    ),
                    keyboardType: TextInputType.text,
                ),
                      new TextFormField(
                       onFieldSubmitted: (term){
                         FocusScope.of(context).requestFocus(fn2);
                       },
                        focusNode: fn,
                        
                       validator: (value){
                         if(value.isEmpty){
                           return 'This field is required';
                         }},
                  controller: lastNameController,
                    decoration: new InputDecoration(
                      labelText: "Enter Last Name",
                    ),
                    keyboardType: TextInputType.text,
                ),
                new TextFormField(
                       onFieldSubmitted: (term){
                         FocusScope.of(context).requestFocus(fn3);
                       },
                        focusNode: fn2,
                   validator: (value){
                         if(value.isEmpty){
                           return 'This field is required';
                         }},
                  controller: emailController,
                    decoration: new InputDecoration(
                      labelText: "Enter Email id",
                    ),
                    keyboardType: TextInputType.emailAddress,
                ),
                new TextFormField(
                       onFieldSubmitted: (term){
                         FocusScope.of(context).requestFocus(fn4);
                       },
                        focusNode: fn3,
                   validator: (value){
                         if(value.isEmpty){
                           return 'This field is required';
                         }},
                  controller: phoneController,
                    decoration: new InputDecoration(
                      labelText: "Enter Phone no",
                    ),
                    keyboardType: TextInputType.number,
                ),
                new TextFormField(
                       onFieldSubmitted: (term){
                         FocusScope.of(context).requestFocus(new FocusNode());
                       },
                        focusNode: fn4,
                   validator: (value){
                         if(value.isEmpty){
                           return 'This field is required';
                         }},
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
                new MaterialButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Signup"),
                  onPressed: (){
                    
                    getData;
                    
                    }
                  ,
                  splashColor: Colors.redAccent,
                ),
                    ],
                ),
                  ),
                ),
                ),
            ],
          ),
  
        ],
        
        )
      ),
      )
    );
  }
}

