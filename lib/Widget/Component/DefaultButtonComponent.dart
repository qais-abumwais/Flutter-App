import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Common/Theme/Colors.dart';

class LoginButtoncomponent extends StatelessWidget {
    final String text;
    final Color splashColor, highlightColor, fillColor, textColor;
    final Function onPress;

    LoginButtoncomponent({
        @required this.text,
        @required this.onPress,
        this.splashColor = PRIMARY_COLOR,
        this.highlightColor = PRIMARY_COLOR,
        this.fillColor = PRIMARY_COLOR,
        this.textColor = WHITE,
    });
    
    @override
    Widget build(BuildContext context) {
        return RaisedButton(
            highlightElevation: 0.0,
            splashColor: this.splashColor,
            highlightColor: this.highlightColor,
            elevation: 0.0,
            color: this.fillColor,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)
            ),
            child: Text(
                this.text,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: this.textColor,
                    fontSize: 20
                ),
            ),
            onPressed: this.onPress
        );
    }
}