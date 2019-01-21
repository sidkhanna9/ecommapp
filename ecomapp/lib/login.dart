import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
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






  Future<String> getData() async {


// Map<String,dynamic> jsonMap ={
// 'email':emailController.text,
// 'password':passwordController.text
// };

print(emailController.text);

print(passwordController.text);


http.Response response = await http.post("http://10.177.7.88:8080/auth/login",
headers: {
  "Content-Type":"application/json"
},
body: "{\"emailId\":" +"\""+emailController.text+"\"" + ",\"password\":"+"\""+passwordController.text+"\"}",
);

print(response.body);

} 


  @override
  Widget build(BuildContext context){
    return new Scaffold(
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
                new MaterialButton(
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: new Text("Login"),
                  onPressed: getData,
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
      ),
    );
  }
}