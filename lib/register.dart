import 'dart:convert';
import 'package:local_auth/local_auth.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
final LocalAuthentication _localAuthentication = LocalAuthentication();

Future<String?> registerFingerprint() async {
  // Check if a biometric authentication method is available
  print("Somethin somethin");
  bool isBiometricAvailable = await _localAuthentication.canCheckBiometrics;
  
  if (isBiometricAvailable) {
    // Get a list of available biometric types
    List<BiometricType> availableBiometrics = await _localAuthentication.getAvailableBiometrics();
    
    if (availableBiometrics.contains(BiometricType.fingerprint)) {
      // Register the user's fingerprint
      bool didSucceed = await _localAuthentication.authenticate(
        localizedReason: 'Please register your fingerprint',
        // biometricOnly: true,
      );
      
      if (didSucceed) {
        // If the fingerprint registration was successful, generate a hash value from the biometric data
        var bytes = utf8.encode(availableBiometrics.toString());
        var hash = sha256.convert(bytes);
        print(hash.toString());
        return hash.toString();
      }
    }
  }
  
  return null;
}

class Registerbio extends StatefulWidget {
  const Registerbio({super.key});

  @override
  State<Registerbio> createState() => _RegisterbioState();
}

class _RegisterbioState extends State<Registerbio> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color(0xFF3366FF),
                              const Color(0xFF00CCFF),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: Column(
                        children: [
                          TextField(
    
      decoration: InputDecoration(
      border: OutlineInputBorder(),
      labelText: 'username or emailaddress',
      ),),
      GestureDetector(onTap:registerFingerprint,child: Icon(Icons.fingerprint, size: 100,color: Colors.grey,)),
                        ],
                      )),
    );
  }
}