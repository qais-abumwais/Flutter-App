import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Common/Theme/Colors.dart';

class LogoComponent extends StatelessWidget {
    final String text;
    LogoComponent({
        @required this.text,
    });

    @override
    Widget build(BuildContext context) {
        return Center(
            child: Padding(
            padding: EdgeInsets.only(top: 120),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 240,
                    child: Stack(
                        children: <Widget>[
                            Positioned(
                                child: Container(
                                    height: 154,
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                            this.text,
                                            style: TextStyle(
                                                fontSize: 120,
                                                fontWeight: FontWeight.bold,
                                                color: WHITE,
                                            ),
                                        ),
                                    )
                                ),
                            ),
                            Positioned(
                                width: MediaQuery.of(context).size.width * 0.15,
                                height: MediaQuery.of(context).size.width * 0.15,
                                bottom: MediaQuery.of(context).size.height * 0.046,
                                right: MediaQuery.of(context).size.width * 0.22,
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: WHITE
                                    ),
                                ),
                            ),
                            Positioned(
                                width: MediaQuery.of(context).size.width * 0.08,
                                height: MediaQuery.of(context).size.width * 0.08,
                                bottom: 0,
                                right: MediaQuery.of(context).size.width * 0.32,
                                child: Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: WHITE
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            )
        );
    }
}