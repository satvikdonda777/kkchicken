class TimeSlotModel {
  String? status;
  List<Timeslots>? timeslots;

  TimeSlotModel({this.status, this.timeslots});

  TimeSlotModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Timeslots'] != null) {
      timeslots = <Timeslots>[];
      json['Timeslots'].forEach((v) {
        timeslots!.add(Timeslots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (timeslots != null) {
      data['Timeslots'] = timeslots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timeslots {
  int? id;
  String? slot;

  Timeslots({this.id, this.slot});

  Timeslots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slot'] = slot;
    return data;
  }
}
