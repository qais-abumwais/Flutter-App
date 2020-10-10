
import 'package:flutter/material.dart';
import 'package:flutter_app/Common/AppLocale/AppLocalization.dart';
import 'package:flutter_app/Common/Theme/Colors.dart';
import 'package:flutter_app/Widget/BottomSheet/RegisterBottomSheet.dart';
import 'package:flutter_app/Widget/Component/Clipper.dart';
import 'package:flutter_app/Widget/Component/DefaultButtonComponent.dart';
import 'package:flutter_app/Widget/Component/LogoComponent.dart';
import 'package:flutter_app/Widget/Component/RegisterButtonComponent.dart';

class AccountPage extends StatefulWidget {
    @override
    _AccountPage createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: PRIMARY_COLOR,
            key: _scaffoldKey,
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    LogoComponent(
                        text: AppLocalizations.of(context).translate("go")
                    ),
                    Padding(
                        child: Container(
                            child: LoginButtoncomponent(
                                text: AppLocalizations.of(context).translate("login"),
                                onPress: () {
                                    
                                },
                                fillColor: WHITE,
                                highlightColor: WHITE,
                                splashColor: PRIMARY_COLOR,
                                textColor: PRIMARY_COLOR
                            ),
                            height: 50,
                        ),
                        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: RegisterButtonComponent(
                            text: AppLocalizations.of(context).translate("register"),
                            onPress: () {
                                RegisterBottomSheet().registerSheet(_scaffoldKey);
                            },
                        )
                    ),
                    Expanded(
                        child: Align(
                            child: ClipPath(
                                child: Container(
                                    color: WHITE,
                                    height: 300,
                                ),
                                clipper: BottomWaveClipper(),
                            ),
                            alignment: Alignment.bottomCenter,
                        ),
                    )
                ],
            ),
        );
    }
}