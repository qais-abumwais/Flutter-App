import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Common/AppLocale/AppLocalization.dart';
import 'package:flutter_app/Common/Theme/Colors.dart';

class RegisterBottomSheet {
    void registerSheet(GlobalKey<ScaffoldState> _scaffoldKey) {
        _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
            return DecoratedBox(
                decoration: BoxDecoration(
                    color: PRIMARY_COLOR,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                    ),
                    child: Container(
                        child: ListView(
                            children: <Widget>[
                                Container(
                                    child: Stack(
                                        children: <Widget>[
                                            Positioned(
                                                left: 10,
                                                top: 10,
                                                child: IconButton(
                                                    onPressed: () {
                                                        Navigator.of(context).pop();
                                                    },
                                                    icon: Icon(
                                                        Icons.close,
                                                        size: 30.0,
                                                        color: BLACk,
                                                    ),
                                                ),
                                            )
                                        ],
                                    ),
                                    height: 50,
                                    width: 50,
                                ),
                                SingleChildScrollView(
                                    child: Column(
                                        children: <Widget>[
                                            Container(
                                                width: MediaQuery.of(context).size.width,
                                                height: 140,
                                                child: Stack(
                                                    children: <Widget>[
                                                        Positioned(
                                                            child: Container(
                                                                padding: EdgeInsets.only(bottom: 25),
                                                                child: Text(
                                                                    AppLocalizations.of(context).translate("register_title"),
                                                                    style: TextStyle(
                                                                        fontSize: 44,
                                                                        fontWeight: FontWeight.bold,
                                                                        color: PRIMARY_COLOR,
                                                                    ),
                                                                ),
                                                                alignment: Alignment.center,
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                        ]
                                    ),
                                ),
                            ],
                        ),
                        height: MediaQuery.of(context).size.height / 1.1,
                        width: MediaQuery.of(context).size.width,
                        color: WHITE
                    ),
                ),
            );
        });
    }
}