import 'package:centers/src/student/component/profileScreen/profileAppBar.dart';
import 'package:flutter/material.dart';
import 'package:centers/src/student/component/profileScreen/profileInfo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class StudentProfileScreen extends StatefulWidget {
  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  //-------------------------------variables------------------------------------
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String _name, _email;
  int _phone;
  bool _edit = false;

  //--------------------------------methods-------------------------------------
  String nameValidator(value) {
    if (value.isEmpty) {
      return 'This field is required!';
    }
    return null;
  }

  String emailValidator(value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Invalid email!';
    }
    return null;
  }
  String phoneValidator(value) {
    if (value.isEmpty) {
      return 'Invalid phone!';
    }
    return null;
  }
  void onSavedName(value) {
    _name = value;
  }

  void onSavedEmail(value) {
    _email = value;
  }
  void onSavedPhone(value) {
    _phone = int.parse(value);
  }
  Future<void> _update() async {
    final formData = _formKey.currentState;
    if (formData.validate()) {
      formData.save();
      print(':::::::::::::' + _name);
      print(':::::::::::::' + _email);
      print(':::::::::::::' + _phone.toString());
      //TODO ---------
      setState(() {
        _edit = false;
      });
    }
  }
  //---------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Stack(
            children: <Widget>[
              Material(
                child: CustomScrollView(
                  slivers: <Widget>[
                  SliverPersistentHeader(
                      delegate: ProfileAppBar(
                        title: 'Profile',
                        icon: _edit? InkWell(
                          onTap: (){_update();},
                            child: Padding(
                              padding: const EdgeInsets.only(left:280.0,bottom: 135),
                              child: Text('Done',style: TextStyle(color: Colors.white,fontFamily: 'cairo',fontSize: 20),),
                            )):
                        Padding(
                          padding: const EdgeInsets.only(bottom:135.0,left: 300.0),
                          child: IconButton(icon: Icon(Icons.edit,color: Colors.white,size: 25,), onPressed: (){
                            setState(() {
                              _edit=true;
                            });
                          }),
                        ),
                      ),
                    pinned: true,
                  ),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(
                            height: 80.0,
                          ),
                          ProfileInfo(
                            icon: FaIcon(FontAwesomeIcons.user,color: Colors.indigo,size: 35,),
                            //icon: Icon(Icons.person,color: Colors.indigo,size: 35,),
                            title: 'Mohammed Essam',
                            onSaved: onSavedName,
                            validator: nameValidator,
                            edit: _edit,
                          ),
                          ProfileInfo(
                            icon: Icon(Icons.mail_outline,color: Colors.indigo,size: 35,),
                            //icon: Image.asset('assets/images/emailIcon.png',width: 35,height: 35,),
                            title: 'me6636366@gmail.com',
                            onSaved: onSavedEmail,
                            validator: emailValidator,
                            edit: _edit,
                          ),
                          ProfileInfo(
                            icon: FaIcon(FontAwesomeIcons.phone,color: Colors.indigo,size: 35,),
                            //icon: Icon(Icons.phone,color: Colors.indigo,size: 35,),
                            title: '01002228293',
                            onSaved: onSavedPhone,
                            validator: phoneValidator,
                            edit: _edit,
                          ),
                          ProfileInfo(
                            icon: Image.asset('assets/images/maleAvatar.png',width: 35,height: 35,),
                            title: 'male',
                            edit: false,
                          ),
                          ProfileInfo(
                            icon: Icon(Icons.supervised_user_circle,color: Colors.indigo,size: 35,),
                            title: 'level 2',
                            edit: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
