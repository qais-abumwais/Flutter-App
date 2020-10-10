import 'package:flutter/material.dart';
import 'package:flutter_app/Common/AppLocale/AppLocalization.dart';
import 'package:flutter_app/Widget/Page/AccountPage.dart';
import 'package:flutter_app/Widget/Page/LoginPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Common/Theme/Colors.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            supportedLocales: [
                Locale('en', 'US'),
                Locale('ar', ''),
            ],
            localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
                primaryColor: PRIMARY_COLOR,
                primaryColorLight: LIGHT_PRIMARY_COLOR,
                primaryColorDark: PRIMARY_COLOR,
                accentColor: ACCECNT_COLOR,
                errorColor: NIGATIVE_COLOR,
                backgroundColor: BACKGROUND,
                buttonColor: SECONDARY_COLOR,
                focusColor: DARK_SECONDARY_COLOR,
                bottomSheetTheme: BottomSheetThemeData(
                    backgroundColor: PRIMARY_COLOR
                )
            ),
            home: AccountPage(),
        );
    }
}
