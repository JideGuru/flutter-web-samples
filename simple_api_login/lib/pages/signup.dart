import 'package:flutter/material.dart';
import 'package:simple_api_login/components/input_box.dart';
import 'package:simple_api_login/components/mouse_cursor.dart';
import 'package:simple_api_login/components/responsive_widget.dart';
import 'package:simple_api_login/pages/login.dart';
import 'package:simple_api_login/util/validations.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool loading = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool validate = false;
  String email, password,confirmPassword, fName, lName;

  FocusNode emailFN = FocusNode();
  FocusNode fNameFN = FocusNode();
  FocusNode lNameFN = FocusNode();
  FocusNode passFN = FocusNode();
  FocusNode confirmPassFN = FocusNode();


  submitForm(){
    FormState form = formKey.currentState;
    form.save();
    if (!form.validate()) {
      setState(() {
        validate = true;
      });
      showInSnackBar("Please fix the errors in red before submitting.");
    } else {

    }
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(value)));
  }

  @override
  void dispose() {
    emailFN.dispose();
    fNameFN.dispose();
    lNameFN.dispose();
    passFN.dispose();
    confirmPassFN.dispose();
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
              "Create Account",
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
                    hintText: "First Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: fNameFN,
                    validateFunction: Validations.validateName,
                    nextFocusNode: lNameFN,
                    onSaved: (String val) {
                      fName = val;
                    },
                  ),

                  SizedBox(height: 10,),

                  InputBox(
                    enabled: !loading,
                    hintText: "Last Name",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: lNameFN,
                    validateFunction: Validations.validateName,
                    nextFocusNode: emailFN,
                    onSaved: (String val) {
                      lName = val;
                    },
                  ),

                  SizedBox(height: 10,),

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
                    textInputAction: TextInputAction.next,
                    focusNode: passFN,
                    obscureText: true,
                    validateFunction: Validations.validatePassword,
                    nextFocusNode: confirmPassFN,
                    onSaved: (String val) {
                      password = val;
                    },
                  ),

                  SizedBox(height: 10,),

                  InputBox(
                    enabled: !loading,
                    hintText: "Confirm Password",
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    focusNode: confirmPassFN,
                    obscureText: true,
                    validateFunction: (val){
                      return Validations.validateRePassword(val, password);
                    },
                    onSaved: (String val) {
                      confirmPassword = val;
                    },
                    submitAction: submitForm,
                  ),

                  SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      MouseCursor(
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return Login();
                                },
                              ),
                            );
                          },
                          child: Text(
                            "Already signed up? Login",
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
                        child: MouseCursor(
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            color: Theme.of(context).accentColor,
                            onPressed: ()=>submitForm(),
                            child: Text(
                              "Sign up",
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
