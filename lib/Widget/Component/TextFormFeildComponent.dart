import 'package:flutter/material.dart';
import 'package:flutter_app/Common/AppLocale/AppLocalization.dart';
import 'package:flutter_app/Common/DaraTypes/Enum/TextFromFieldType.dart';
import 'package:flutter_app/Common/DaraTypes/TextFromFieldCls.dart';
import 'package:flutter_app/Common/Theme/Colors.dart';

class TextFormFeildComponent extends StatefulWidget {
    final TextFromFieldCls textFormFeildDetails;
    final Function onChange;

    TextFormFeildComponent(
        this.textFormFeildDetails,
        this.onChange
    );

    @override
    _TextFormFeildComponentState createState() => _TextFormFeildComponentState();
}

class _TextFormFeildComponentState extends State<TextFormFeildComponent> {
    String initValue;
    double height, errorHeight = 30;
    double get totalHeight => this.height + ((this.error != null) ? this.errorHeight : 0);
    String error;

    @override
    void initState() {
        super.initState();
        initValue = widget.textFormFeildDetails.initValue != null ? widget.textFormFeildDetails.initValue : "";
    }

    String validate(String val) {
        String error;
        if (widget.textFormFeildDetails.isRequired && val.isEmpty) {
            error = (widget.textFormFeildDetails.requiredMessage != null) ? widget.textFormFeildDetails.requiredMessage : AppLocalizations.of(context).translate('required_message');
        } else if (widget.textFormFeildDetails.validate != null) {
            error = widget.textFormFeildDetails.validate(val);
        } else if (widget.textFormFeildDetails.regex != null) {
            error = validateVal(val, widget.textFormFeildDetails.regex) ? null : widget.textFormFeildDetails.invalidMessage;
        } else if (widget.textFormFeildDetails.textFormFieldType == TextFromFieldType.EMAIL) {
            error = validateEmail(val) ? null : widget.textFormFeildDetails.invalidMessage;
        } else if (widget.textFormFeildDetails.textFormFieldType == TextFromFieldType.PASSWORD) {
            error = validatePassword(val) ? null : widget.textFormFeildDetails.invalidMessage;
        } else if (widget.textFormFeildDetails.textFormFieldType == TextFromFieldType.WITHOUT_SPECIAL_CHARACTER) {
            error = validateNonSpecialChars(val) ? null : widget.textFormFeildDetails.invalidMessage;
        }

        if(mounted) {
            WidgetsBinding.instance
            .addPostFrameCallback((_) => setState(() {
                this.error = error;
            }));
            return error;
        }

        return '';
    }

    @override
    Widget build(BuildContext context) {
        height = widget.textFormFeildDetails.height;
        return Container(
            margin: EdgeInsets.only(top: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    (widget.textFormFeildDetails.label != null) ? Text(
                        widget.textFormFeildDetails.label,
                    ) : Container(),
                    Container(
                        height: 4,
                    ),
                    SizedBox(
                        height: totalHeight,
                        child: TextFormField(
                            initialValue: initValue,
                            inputFormatters: widget.textFormFeildDetails.inputFormatters != null ? widget.textFormFeildDetails.inputFormatters : [],
                            readOnly: widget.textFormFeildDetails.readOnly,
                            maxLines: widget.textFormFeildDetails.maxLines != null ? widget.textFormFeildDetails.maxLines : 1,
                            maxLength: widget.textFormFeildDetails.maxLength,
                            textAlign: widget.textFormFeildDetails.textAlign,
                            onChanged: (String str) {
                                widget.onChange(str);
                            },
                            textInputAction: widget.textFormFeildDetails.next,
                            onFieldSubmitted: (v) {
                                widget.textFormFeildDetails.nextFun(context);
                            },
                            focusNode: widget.textFormFeildDetails.focus,
                            validator: this.validate,
                            textDirection: TextDirection.ltr,
                            decoration: new InputDecoration(
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ),
                                // hintText: widget.textFormFeildDetails.hint,
                                contentPadding: EdgeInsets.only(
                                    top: widget.textFormFeildDetails.maxLines != null ? 20 : 16,
                                    right: 16,
                                    left: 16
                                ),
                                focusedBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(color: TITLE_DARK, width: 1),
                                ),
                                enabledBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(color: TITLE_DARK, width: 1),
                                ),
                                errorBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(color: NIGATIVE_COLOR, width: 1)
                                ),
                                focusedErrorBorder: new OutlineInputBorder(
                                    borderSide: BorderSide(color: NIGATIVE_COLOR, width: 1)
                                ),
                                errorText: widget.textFormFeildDetails.defaultErrorMeesage,
                                prefixIcon: widget.textFormFeildDetails.icon != null ? widget.textFormFeildDetails.icon : null
                            ),
                            keyboardType: widget.textFormFeildDetails.textInputType,
                            obscureText: widget.textFormFeildDetails.secure,
                        )
                    )
                ],
            )
        );
    }

    bool validateVal(String val, String regex) {
        RegExp regExp = new RegExp(regex);
        return regExp.hasMatch(val);
    }

    bool validateEmail(String email) {
        if(email == null || email == '')
            return true;
        else {
            String pattern =
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            return this.validateVal(email, pattern);
        }
    }

    bool validatePassword(String password) {
        String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        return this.validateVal(password, pattern);
    }

    bool validateNonSpecialChars(String text) {
        String pattern = r'''^([^\./\\\{\}"'<>:@\^\r\n]+)$''';
        return this.validateVal(text, pattern);
    }
}