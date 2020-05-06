class Customer {
  String firstname;
  String lastname;
  String email;
  String phone;

  Customer({this.firstname, this.lastname, this.email, this.phone});
  Customer.copy(Customer from)
      : this(
            firstname: from.firstname,
            lastname: from.lastname,
            email: from.email,
            phone: from.phone);
}
