import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputWidget extends StatefulWidget {
  final String hintText;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool isPassword;
  final bool isLoading;
  final bool editing;

  const InputWidget({
    @required this.labelText,
    @required this.hintText,
    this.onSaved,
    this.validator,
    this.isPassword = false,
    this.isLoading = false,
    this.editing = false,
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
              fontSize: widget.editing ? 14.0 : 18.0,
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
              hintText: widget.editing ? null : widget.hintText,
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
            initialValue: widget.editing ? widget.hintText : null,
            cursorColor: Colors.indigo,
            obscureText: widget.isPassword ? _obscureText : false,
            readOnly: widget.isLoading ? true : false,
            onSaved: widget.onSaved,
            validator: widget.validator,
            style: TextStyle(
              color: widget.editing ? Colors.black : Colors.indigo,
              fontFamily: 'Cairo',
              fontSize: widget.editing ? 16.0 : 14.0,
            ),
          ),
          SizedBox(
            height: widget.editing ? 5.0 : 15.0,
          ),
        ],
      ),
    );
  }
}
