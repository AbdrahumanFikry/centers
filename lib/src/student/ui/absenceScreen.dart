import 'package:centers/src/common/components/alerts/alertDialog.dart';
import 'package:centers/src/common/components/globalAppBar.dart';
import 'package:centers/src/student/component/absenceScreen/absenceList.dart';
import 'package:centers/src/student/providers/dataProvider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AbsenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Material(
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    delegate: GlobalAppBar(
                      title: 'Absence',
                      component: Consumer<StudentData>(
                        builder: (context, data, _) => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Text(
                                  data.materialAbsence.length.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        screen.size.width > 500 ? 24.0 : 22.0,
                                  ),
                                ),
                                Text(
                                  'Materials',
                                  style: TextStyle(
                                    color: Colors.indigo,
                                    fontFamily: 'Cairo',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: <Widget>[
                                Text(
                                  data.warningCount().toString(),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        screen.size.width > 500 ? 24.0 : 22.0,
                                  ),
                                ),
                                Text(
                                  'Warnings',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    pinned: true,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SizedBox(
                          height: 50.0,
                        ),
                        AbsenceList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: GestureDetector(
                onTap: () {
                  GlobalAlertDialog.show(
                    context: context,
                    dialogContent:
                        'If you didn\'t attend 3 classes in each material you will be panned ',
                    onTap: () {},
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.grey[500].withOpacity(0.4),
                  child: Icon(
                    FontAwesomeIcons.info,
                    color: Colors.white,
                    size: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
