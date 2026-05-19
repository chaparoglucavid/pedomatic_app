import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pedomatic_app/services/api_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final PageController _pageController = PageController();
  final ApiService _api = ApiService();
  int _currentStep = 0;

  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();

  String _name = '', _email = '', _password = '', _confirmPassword = '';

  void _nextStep() {
    if (_currentStep == 0) {
      if (_formKey1.currentState!.validate()) {
        _formKey1.currentState!.save();
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
        setState(() => _currentStep++);
      }
    } else {
      if (_formKey2.currentState!.validate()) {
        _formKey2.currentState!.save();
        _register();
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() => _currentStep--);
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _register() async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()),
      );

      final response = await _api.register(
        name: _name,
        email: _email,
        password: _password,
        confirmPassword: _confirmPassword,
      );

      Navigator.pop(context); // Close loading

      if (response.statusCode == HttpStatus.created || response.statusCode == HttpStatus.ok) {
        final box = Hive.box('userInformations');
        await box.put('isRegistered', true);
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Qeydiyyat uğurla tamamlandı! Zəhmət olmasa daxil olun.')),
        );
        Navigator.of(context).popUntil((route) => route.isFirst);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response.data['message'] ?? 'Xəta baş verdi')),
        );
      }
    } catch (e) {
      if (Navigator.canPop(context)) Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xəta baş verdi: $e')),
      );
    }
  }

  InputDecoration _buildInputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.pinkAccent),
      filled: true,
      fillColor: Colors.grey[50],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.pinkAccent, width: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: _previousStep,
        ),
        title: Text(
          "Qeydiyyat (${_currentStep + 1}/2)",
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: (_currentStep + 1) / 2,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStep1(),
                _buildStep2(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _nextStep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: Text(
                  _currentStep == 0 ? "Davam Et" : "Tamamla",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Xoş Gəlmisiniz!",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Zəhmət olmasa əsas məlumatlarınızı daxil edin.",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 32),
            TextFormField(
              decoration: _buildInputDecoration("Ad və Soyad", Icons.person_outline),
              validator: (v) => v!.isEmpty ? "Ad tələb olunur" : null,
              onSaved: (v) => _name = v!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              decoration: _buildInputDecoration("Email", Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              validator: (v) => !v!.contains("@") ? "Düzgün email daxil edin" : null,
              onSaved: (v) => _email = v!,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Təhlükəsizlik",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Hesabınız üçün güclü bir şifrə təyin edin.",
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            const SizedBox(height: 32),
            TextFormField(
              obscureText: true,
              decoration: _buildInputDecoration("Şifrə", Icons.lock_outline),
              validator: (v) => v!.length < 6 ? "Minimum 6 simvol" : null,
              onChanged: (v) => _password = v,
              onSaved: (v) => _password = v!,
            ),
            const SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: _buildInputDecoration("Şifrəni Təsdiqlə", Icons.lock_reset_outlined),
              validator: (v) => v != _password ? "Şifrələr uyğun deyil" : null,
              onSaved: (v) => _confirmPassword = v!,
            ),
          ],
        ),
      ),
    );
  }
}
