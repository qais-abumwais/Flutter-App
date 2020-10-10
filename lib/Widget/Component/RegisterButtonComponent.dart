import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Common/Theme/Colors.dart';

class RegisterButtonComponent extends StatelessWidget {
    final Color highlightedBorderColor, borderSideColor, splashColor, highlightColor, textColor, outLineColor;
    final String text;
    final Function onPress;
    
    RegisterButtonComponent({
        @required this.text,
        @required this.onPress,
        this.highlightedBorderColor = WHITE,
        this.borderSideColor = WHITE,
        this.splashColor = WHITE,
        this.highlightColor = PRIMARY_COLOR,
        this.textColor = WHITE,
        this.outLineColor = PRIMARY_COLOR
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            child: OutlineButton(
                highlightedBorderColor: this.highlightedBorderColor,
                borderSide: BorderSide(
                    color: this.borderSideColor,
                    width: 2.0
                ),
                highlightElevation: 0.0,
                splashColor: this.splashColor,
                highlightColor: this.highlightColor,
                color: this.outLineColor,
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                ),
                child: Text(
                    "REGISTER",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: this.textColor,
                        fontSize: 20),
                ),
                onPressed: this.onPress
            ),
            height: 50,
        );
    }
}