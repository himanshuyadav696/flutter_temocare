class Welcome1 {
  Welcome1({
    this.error,
    required this.response,
  });
  dynamic error;
  Response response;
}

class Response {
  Response({
    required this.data,
    required this.message,
  });
  Data data;
  Message message;
}

class Data {
  Data({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;
}

class Result {
  Result({
    required this.doctorId,
    required this.email,
    required this.firstName,
    required this.fullName,
    required this.lastName,
    required this.imageUrl,
    required this.availability,
    required this.qualifi,
    required this.fee,
    required this.ratings,
    required this.specialization,
    required this.successfullPatients,
    required this.description,
    required this.experience,
    required this.reviews,
    required this.questionaires,
    required this.certificates,
  });

  int doctorId;
  String email;
  String firstName;
  String fullName;
  String lastName;
  String imageUrl;
  String availability;
  String qualifi;
  String fee;
  String ratings;
  String specialization;
  int successfullPatients;
  String description;
  String experience;
  int reviews;
  List<dynamic> questionaires;
  String certificates;
}

class Message {
  Message({
    required this.success,
    required this.statusCode,
    required this.successCode,
    required this.successMessage,
  });
  bool success;
  int statusCode;
  int successCode;
  String successMessage;
}
