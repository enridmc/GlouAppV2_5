enum UserRole { admin, sala, cocina, cliente }

class DemoUser {
  const DemoUser({
    required this.name,
    required this.email,
    required this.pin,
    required this.role,
  });

  final String name;
  final String email;
  final String pin;
  final UserRole role;
}
