import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart'; 
import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
final TextEditingController emailController = TextEditingController(); final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

@override
Widget build(BuildContext context) {
final authProvider = Provider.of<AuthProvider>(context);


return Scaffold(
 
appBar: AppBar(title: const Text('Login')), body: Padding(
padding: const EdgeInsets.all(16.0), child: Column(
children: [ TextField(
controller: emailController,
decoration: const InputDecoration(labelText: 'Email'),
),
TextField(
controller: passwordController,
decoration: const InputDecoration(labelText: 'Password'), obscureText: true,
),
const SizedBox(height: 20), ElevatedButton( onPressed: () async {
bool success = await authProvider.login( emailController.text,
passwordController.text,
);
if (success) {
Navigator.of(context).pushReplacementNamed('/profile');
} else {
 
ScaffoldMessenger.of(context).showSnackBar(const SnackBar( content: Text('Login failed!'),
));
}
},
child: const Text('Login'),
),
],
),
),
);
}
}
