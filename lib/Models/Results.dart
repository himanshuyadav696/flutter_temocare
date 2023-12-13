class Result {
  final int? doctorId;
  final String? email;
  final String? firstName;
  final String? fullName;
  final String? lastName;
  final String? imageUrl;
  final String? availability;
  final String? qualification;
  final String? fee;
  final String? ratings;
  final String? specialization;
  final int? successfulPatients;
  final String? description;
  final String? experience;
  final int? reviews;
  final List<String>? questionnaires;
  final List<String>? certificates;
  Result({
    required this.doctorId,
    required this.email,
    required this.firstName,
    required this.fullName,
    required this.lastName,
    required this.imageUrl,
    required this.availability,
    required this.qualification,
    required this.fee,
    required this.ratings,
    required this.specialization,
    required this.successfulPatients,
    required this.description,
    required this.experience,
    required this.reviews,
    required this.questionnaires,
    this.certificates,
  });
  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
        doctorId:json['doctor_id'],
        email: json['email'],
        firstName: json["first_name"],
        fullName: json['fullName'],
        lastName: json['last_ame'],
        imageUrl: json['image_url'],
        availability: json['availability'],
        qualification: json['qualification'],
        fee: json['fee'],
        ratings: json['ratings'],
        specialization: json['specialization'],
        successfulPatients: json['successfulPatients'],
        description: json['description'],
        experience: json['experience'],
        reviews: json['reviews'],
        questionnaires: json['questionnaires']
    );
  }
}
