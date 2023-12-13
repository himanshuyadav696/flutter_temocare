class Results {
  final int doctorId;
  final String email;
  final String firstName;
  final String fullName;
  final String lastName;
  final String imageUrl;
  final String availability;
  final String qualification;
  final double fee;
  final double ratings;
  final String specialization;
  final int successfulPatients;
  final String description;
  final int experience;
  final int reviews;
  final List<dynamic> questionnaires; // Update the type accordingly
  final List<String>? certificates; // Update the type accordingly
  Results({
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
    required this.certificates,
  });
  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      doctorId: json['doctor_id'],
      email: json['email'],
      firstName: json['first_name'],
      fullName: json['fullName'],
      lastName: json['last_name'],
      imageUrl: json['image_url'],
      availability: json['availability'],
      qualification: json['qualifi'],
      fee: double.parse(json['fee']),
      ratings: double.parse(json['ratings']),
      specialization: json['specialization'],
      successfulPatients: json['successfull_patients'],
      description: json['description'],
      experience: json['experience'],
      reviews: json['reviews'],
      questionnaires: json['questionaires'] ?? [],
      certificates: json['certificates'] != null
          ? List<String>.from(json['certificates'])
          : null,
    );
  }
}