/// pending : 27
/// called : 23
/// rescheduled : 11
/// calls : [{"FirstName":"Danielle","LastName":"Johnson","duration":17},{"FirstName":"Danielle","LastName":"Johnson","duration":17},{"FirstName":"Danielle","LastName":"Johnson","duration":17},null]

class ListModel {
  int? pending;
  int? called;
  int? rescheduled;
  List<Calls>? calls;

  ListModel({this.pending, this.called, this.rescheduled, this.calls});

  ListModel.fromJson(dynamic json) {
    pending = json['pending'];
    called = json['called'];
    rescheduled = json['rescheduled'];
    if (json['calls'] != null) {
      calls = [];
      json['calls'].forEach((v) {
        calls?.add(Calls.fromJson(v));
      });
    }
  }

  // Dart → JSON (optional, handy for debug/POST)
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['pending'] = pending;
  //   map['called'] = called;
  //   map['rescheduled'] = rescheduled;
  //   if (calls != null) {
  //     map['calls'] = calls?.map((v) => v.toJson()).toList();
  //   }
  //   return map;
  // }
}

/// -------------------------------------------------------
/// FirstName : "Danielle"
/// LastName : "Johnson"
/// duration : 17

class Calls {
  String? firstName;
  String? lastName;
  int? duration;

  Calls({this.firstName, this.lastName, this.duration});

  Calls.fromJson(dynamic json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    duration = json['duration'];
  }

  // Dart → JSON (optional, handy for debug/POST)
  // Map<String, dynamic> toJson() {
  //   final map = <String, dynamic>{};
  //   map['FirstName'] = firstName;
  //   map['LastName'] = lastName;
  //   map['duration'] = duration;
  //   return map;
  // }
}
