import 'package:flutter/material.dart';
import 'package:track/screens/login.dart';
class SignScreen extends StatefulWidget{
  @override
  _SignScreenState createState() => _SignScreenState();
}
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText=true;

class _SignScreenState extends State<SignScreen>{
  void  validator(){
    final FormState? _form=_formKey.currentState;
    if(_form!.validate()){
      print("yes");
    }
    else{
      print("no");
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  SafeArea(
        child:Form(
          key: _formKey,
          child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height:200,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Create Account",style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,

                     ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 350,
                width: double.infinity,  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    TextFormField(
                      validator: (value){
                        if(value==""){
                          return "Please Fill Username";
                        }
                        else{
                          return "";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                        
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),

                      ),
                    ),
                    TextFormField(
                      validator: (value){
                        if(value == ""){
                          return "please enter email";
                        }
                        else if(!regExp.hasMatch(value!)){
                          return "Invalid Email";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),

                      ),
                    ),
                    TextFormField(
                      obscureText: obserText,
                      validator: (value){
                        if (value == ""){
                          return "Please fill PassWord";
                        }else if(value!.length < 6){
                          return "Password too short!";
                        }
                        return "";
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              obserText=!obserText;
                            });
                            FocusScope.of(context).unfocus();
                          },
                          child: Icon(
                            obserText==true? Icons.visibility:Icons.visibility,color: Colors.black,),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),

                      ),
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text("Sign Up"), //color not given
                        onPressed: (){
                          validator();
                        })
                ),
                Row(
                  children: <Widget>[
                    Text("Already Have an Account?"),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx)=>Login(),),);
                      },
                      child: Text("Login",
                      style: TextStyle(
                      color: Color(0xff0c2f47), 
                      fontSize: 20, 
                      fontWeight: FontWeight.bold),
                    ),
                    ),
                  ],
                  )
                  ]),
              )
            ]
          ),
        ),
      ),
      ),
    );
  }
}