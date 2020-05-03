import 'package:flutter/material.dart';
import 'package:simple_api_login/components/input_box.dart';
import 'package:simple_api_login/components/mouse_cursor.dart';
import 'package:simple_api_login/components/responsive_widget.dart';
import 'package:simple_api_login/util/services/auth_services.dart';
import 'package:simple_api_login/util/validations.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool validate = false;
  String email, password;

  FocusNode emailFN = FocusNode();
  FocusNode passFN = FocusNode();


  submitForm() async{
    FormState form = formKey.currentState;
    form.save();
    if (!form.validate()) {
      setState(() {
        validate = true;
      });
      showInSnackBar("Please fix the errors in red before submitting.");
    } else {
      setState(() {
        loading = true;
      });

      String msg = await AuthServices()
          .loginUser(email, password).catchError((e){
        setState(() {
          loading = false;
        });
      });

      showInSnackBar(msg);

      setState(() {
        loading = false;
      });
    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  void dispose() {
    emailFN.dispose();
    passFN.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: ResponsiveWidget(
        largeScreen: _buildLargeBody(),
        mediumScreen: _buildLargeBody(),
        smallScreen: _buildSmallBody(),
      ),
    );
  }

  _buildLargeBody(){
    return Center(
      child: Container(
        width: 350,
        child: _buildForm(),
      ),
    );
  }

  _buildSmallBody(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: _buildForm(),
    );
  }

  _buildForm(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Welcome Back",
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 25,
              ),
            ),

            SizedBox(height: 50,),

            Form(
              key: formKey,
              autovalidate: validate,
              child: Column(
                children: <Widget>[
                  InputBox(
                    enabled: !loading,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    focusNode: emailFN,
                    validateFunction: Validations.validateEmail,
                    nextFocusNode: passFN,
                    onSaved: (String val) {
                      email = val;
                    },
                  ),

                  SizedBox(height: 10,),

                  InputBox(
                    enabled: !loading,
                    hintText: "Password",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    focusNode: passFN,
                    obscureText: true,
                    validateFunction: Validations.validatePassword,
                    onSaved: (String val) {
                      password = val;
                    },
                    submitAction: submitForm,
                  ),


                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MouseCursor(
                        child: GestureDetector(
                          onTap: loading?null:()=>Navigator.pop(context),
                          child: Text(
                            "No account? Sign Up",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 150,
                        height: 50,
                        child: loading
                            ? Center(child: CircularProgressIndicator())
                            : MouseCursor(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            color: Theme.of(context).accentColor,
                            onPressed: ()=>submitForm(),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
