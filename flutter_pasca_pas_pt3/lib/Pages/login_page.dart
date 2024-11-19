import 'package:flutter/material.dart';
import 'package:flutter_pasca_pas_pt3/Controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_pasca_pas_pt3/Pages/register_page.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.white, // AppBar putih
        foregroundColor: Colors.black, // Warna teks hitam
        elevation: 0, // Menghilangkan bayangan AppBar
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang Kembali!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Warna teks hitam
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Silakan login untuk melanjutkan',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: _loginController.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // Warna tombol hitam
                            foregroundColor: Colors.white, // Warna teks putih
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            _loginController.loginUser(
                              _usernameController.text,
                              _passwordController.text,
                            );
                          },
                          child: Text('Login'),
                        ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun? "),
                    TextButton(
                      onPressed: () => Get.to(() => RegisterPage()),
                      child: Text(
                        'Daftar',
                        style: TextStyle(color: Colors.black), // Warna teks hitam
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
