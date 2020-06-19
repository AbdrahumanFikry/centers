import 'package:centers/src/student/ui/imageViewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageViewer extends StatelessWidget {
  final int id;
  final String type;
  final String content;
  final String date;

  MessageViewer({
    this.id,
    this.content,
    this.type,
    this.date,
  });

  void _showImage(BuildContext context, String image, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return ImageViewer(
            image: image,
            id: id,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return type == 'me'
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                padding: content == 'assets/images/user.png'
                    ? EdgeInsets.all(
                        3.5,
                      )
                    : EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                margin: const EdgeInsets.only(
                  left: 30.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.indigo[400],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      10.0,
                    ),
                    bottomLeft: Radius.circular(
                      10.0,
                    ),
                    topRight: Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                child: content == 'assets/images/user.png'
                    ? GestureDetector(
                        onTap: () => _showImage(context, content, id),
                        child: Hero(
                          tag: id.toString(),
                          child: Image.asset(
                            content,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Text(
                        content,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.start,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: content.substring(0, 4) == 'http'
                    ? EdgeInsets.all(
                        3.5,
                      )
                    : EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 5.0,
                      ),
                margin: const EdgeInsets.only(
                  right: 30.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      10.0,
                    ),
                    bottomRight: Radius.circular(
                      10.0,
                    ),
                    topRight: Radius.circular(
                      10.0,
                    ),
                  ),
                ),
                child: content.substring(0, 4) == 'http'
                    ? GestureDetector(
                        onTap: () => _showImage(context, content, id),
                        child: Hero(
                          tag: id.toString(),
                          child: Image.asset(
                            content,
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Text(
                        content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.start,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(
                  5.0,
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ],
          );
  }
}
