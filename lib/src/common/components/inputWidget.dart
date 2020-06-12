import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool isPassword;
  final bool isLoading;

  const InputWidget({
    @required this.labelText,
    @required this.hintText,
    this.onSaved,
    this.validator,
    this.isPassword = false,
    this.isLoading = false,
  });

  @override
  _InputWidgetState createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            widget.labelText,
            style: TextStyle(
              color: Colors.indigo[200],
              fontFamily: 'Cairo',
              fontSize: ScreenUtil().setSp(
                ScreenUtil.screenWidth > 1750 ? 20 : 34,
                allowFontScalingSelf: true,
              ),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey[300],
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isLoading ? Colors.white : Colors.grey[300],
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: widget.isLoading ? Colors.white : Colors.indigo,
                ),
              ),
              contentPadding: EdgeInsets.all(
                10.0,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontFamily: 'Cairo',
              ),
              errorStyle: TextStyle(
                color: Theme.of(context).errorColor,
                fontFamily: 'Cairo',
              ),
              suffixIcon: widget.isLoading
                  ? null
                  : widget.isPassword
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(
                            _obscureText
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            color: Colors.grey,
                            size: 18.0,
                          ),
                        )
                      : null,
            ),
            cursorColor: Colors.indigo,
            obscureText: widget.isPassword ? _obscureText : false,
            readOnly: widget.isLoading ? true : false,
            onSaved: widget.onSaved,
            validator: widget.validator,
            style: TextStyle(
              color: Colors.indigo,
              fontFamily: 'Cairo',
              fontSize: ScreenUtil().setSp(
                ScreenUtil.screenWidth > 1750 ? 18 : 32,
                allowFontScalingSelf: true,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
