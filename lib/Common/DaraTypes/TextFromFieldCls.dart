import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Common/DaraTypes/Enum/TextFromFieldType.dart';
import 'package:flutter_app/Common/Theme/Colors.dart';

class TextFromFieldCls {
    final String label;

    ///
    /// ## Required Message
    /// If isRequired is true, and value is empty
    /// after validation this message will be shown
    final String requiredMessage;
    final String invalidMessage;
    final String initValue;
    final Widget icon;
    final TextInputAction next;
    final FocusNode focus;
    final Function nextFun;
    final TextFromFieldType textFormFieldType;
    final double height;
    final int maxLines;
    final Color hintColor;
    final bool isRequired;
    final String Function(String) validate;
    final String regex;
    final int maxLength;
    final bool readOnly;
    List<TextInputFormatter> _inputFormatters;
    List<TextInputFormatter> get inputFormatters => this._inputFormatters;
    final TextAlign textAlign;
    final String defaultErrorMeesage;
    final bool withStar;

    bool get secure => this.textFormFieldType == TextFromFieldType.PASSWORD;
    TextInputType get textInputType {
        switch (this.textFormFieldType) {
            case TextFromFieldType.EMAIL:
                return TextInputType.emailAddress;

            case TextFromFieldType.NUMBER:
                return TextInputType.number;

            case TextFromFieldType.MULTILINE:
                return TextInputType.multiline;

            case TextFromFieldType.UNSIGNED_NUMBER:
                return TextInputType.numberWithOptions(decimal: true, signed: false);
            default:
                return TextInputType.text;
        }
    }

    TextFromFieldCls({
        this.label,
        this.requiredMessage,
        this.invalidMessage,
        this.initValue,
        this.icon,
        this.next = TextInputAction.none,
        this.focus,
        this.nextFun,
        this.height = 50,
        this.maxLines,
        this.textFormFieldType = TextFromFieldType.TEXT,
        this.hintColor = SECONDARY_COLOR,
        this.validate,
        this.isRequired = false,
        this.regex,
        this.maxLength,
        this.readOnly = false,
        inputFormatters,
        this.textAlign = TextAlign.start,
        this.defaultErrorMeesage,
        this.withStar = false
    }) {
        if (inputFormatters == null) {
            this._inputFormatters = [
                LengthLimitingTextInputFormatter(250)
            ];
        } else {
            this._inputFormatters = inputFormatters;
        }
    }
}