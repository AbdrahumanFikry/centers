import 'package:flutter/material.dart';

class ProfileInfo extends StatefulWidget {
  final Widget icon;
  final String title;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final bool edit;
  ProfileInfo({
    this.icon,this.title,
    this.edit,this.onSaved,
    this.validator,
});

  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return widget.edit?
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Roboto',
          fontSize: 14.0,
        ),
        initialValue: widget.title,
        onSaved: widget.onSaved,
        validator: widget.validator,
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.transparent,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
          filled: true,
        ),
      ),
    ):
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
            widget.icon,
              SizedBox(width: 10.0,),
              Text(widget.title,style: TextStyle(
                color: Colors.black,
                fontFamily: 'Cairo',
                fontSize: 15.0,
                fontWeight: FontWeight.bold
              ),)
            ],
          ),
        );
  }
}
