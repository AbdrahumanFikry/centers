import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            60,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[300],
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    contentPadding: EdgeInsets.all(
                      10.0,
                    ),
                    hintText: 'Search ...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Cairo',
                      fontSize: 18.0,
                    ),
                    errorStyle: TextStyle(
                      color: Theme.of(context).errorColor,
                      fontFamily: 'Cairo',
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    prefixIcon: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.times,
                        color: Colors.black,
                        size: 18.0,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  cursorColor: Colors.indigo,
                  onChanged: (value) {
                    print(value);
                  },
                  style: TextStyle(
                    color: Colors.indigo,
                    fontFamily: 'Cairo',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Container(),
      ),
    );
  }
}
