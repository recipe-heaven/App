class NewUserFormData {
  String name;

  String password;

  String email;

  String username;

  /// Returns a map of all the fields with their values
  toMap() {
    return {
      "name": this.name,
      "email": this.email,
      "username": this.username,
      "password": this.password
    };
  }
}
