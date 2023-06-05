import 'package:flutter/material.dart';
import 'package:track/screens/SignScreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();

String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
void validation(){
  final FormState? _form = _formKey.currentState;
  if(_form!.validate()) {
    print("yes");
  }
  else{
    print("No");
  }
}
bool obserText=true;

class _LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Login",style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold
                ),),
                TextFormField(
                  validator: (value){
                    if(value=="null"){
                      return "Enter mail";
                    }
                    else if(!regExp.hasMatch(value!)){
                      return "email is invalid";
                    }
                    return "";
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.black
                      )
                    ),
                ),
                
                TextFormField(
                  obscureText: obserText,
                  validator: (value) {
                    if(value==""){
                      return "Please Fill Password";
                    }
                    return "";
                  },
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(),
                      hintText: "Password",
                      suffixIcon: GestureDetector(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                          setState(() {
                            obserText=!obserText;
                          });
                        },
                        child: Icon(
                          obserText==true
                          ?Icons.visibility
                          :Icons.visibility_off,
                          color: Colors.black,),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black
                      )
                    ),
                ),
                Container(
                  height: 45,
                  width:double.infinity,
                  child: ElevatedButton(
                  child: Text("Login"), 
                  onPressed: (){
                    validation();
                  },
                  )
                ),
                Row(children: <Widget>[
                  Text("No account?"),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx)=>SignScreen(),),);
                      
                    },
                    child: Text("SignUp",style: TextStyle(
                      color: Color(0xff0c2f47),
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ))
                  )
                ],)
              ],),
          )
        ]),
        
      
    ),
    ),
    );
  }
}
