class TimeLineData {
  List<Data> data;

  TimeLineData({this.data});

  TimeLineData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int id;
  String day;
  List<TimeLine> timeLine;

  Data({this.id, this.day, this.timeLine});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    if (json['time_line'] != null) {
      timeLine = new List<TimeLine>();
      json['time_line'].forEach((v) {
        timeLine.add(new TimeLine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['day'] = this.day;
    if (this.timeLine != null) {
      data['time_line'] = this.timeLine.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeLine {
  int id;
  String title;
  String time;
  String type;
  String teacher;

  TimeLine({this.id, this.title, this.time, this.type, this.teacher});

  TimeLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    time = json['time'];
    type = json['type'];
    teacher = json['teacher'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['time'] = this.time;
    data['type'] = this.type;
    data['teacher'] = this.teacher;
    return data;
  }
}
