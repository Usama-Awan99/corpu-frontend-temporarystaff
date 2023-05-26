class Applicant {
  String? name;
  String? phone;
  String? education;
  List<String>? preferences;
  String? experience;
  String? availabilityDay;
  String? availabilityTime;

  Applicant({
    this.name,
    this.phone,
    this.education,
    this.preferences,
    this.experience,
    this.availabilityDay,
    this.availabilityTime, required String email,
  });
}
