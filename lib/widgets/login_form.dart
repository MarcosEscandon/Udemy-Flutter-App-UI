import "package:flutter/material.dart";
import "input_text.dart";
import "package:statelesshelloworld/utils/responsive.dart";

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "", _password = "";

  _submit() {
    final isOk = _formKey.currentState.validate();
    print("form isOk $isOk");
    if (isOk) {} // Consume API Rest
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ), // BoxConstraints
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "EMAIL ADRESS",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text.contains("@")) {
                    return "Invalid email";
                  }
                  ;
                  return null;
                },
              ), // InputText
              SizedBox(height: responsive.dp(2)),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black12,
                    ), // BorderSide
                  ), // Border
                ), // BoxDecoration
                child: Row(
                  chidlren: <Widget>[
                    Expanded(
                      child: InputText(
                        label: "PASSWORD",
                        obscureText: true,
                        borderEnabled: false,
                        fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                        onChanged: (text) {
                          _password = text;
                        },
                        validator: (text) {
                          if (text.trim().length == 0) {
                            return "Invalid password";
                          }
                          return null;
                        },
                      ), // InputText)
                    ), // Expanded
                    FlatButton(
                      padding: EdgeInsets.symetric(vertical: 10),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.5),
                        ), // TextStyle
                      ), // Text
                      onPressed: () {},
                    ) // FlatButton
                  ], // <Widget>[]
                ), // Row
              ), // Container
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: FlatButton(
                  padding.EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Sign in",
                    style: TextStyle(color: Colors.white),
                    fontSize: responsive.dp(1.5),
                  ), // Text
                  onPressed: this._submit,
                  color: Colors.pinkAccent,
                ), // FlatButton)
              ), // SizedBox
              SizedBox(height: responsive.dp(2)),
              Row(
                MainAxisAlignment: (MainAxisAlignment.center),
                children: <Widget>[
                  Text(
                    "New to friendly Desi?",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ), // TextStyle
                  ), // Text
                  FlatButton(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: responsive.dp(1.5),
                      ), // TextStyle
                    ), // Text
                    onPressed: () {},
                  ), // FlatButton
                ], // <Widget>[]
              ), // Row
              SizedBox(height: responsive.dp(10)),
            ], // <Widget>[]
          ), // Column)
        ), // Form
      ), // Container
    ); // Positioned
  }
}
