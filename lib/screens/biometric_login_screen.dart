import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
class BiometricLoginScreen extends StatefulWidget {
  @override
  _BiometricLoginScreenState createState() => _BiometricLoginScreenState();
}
class _BiometricLoginScreenState extends State<BiometricLoginScreen> with TickerProviderStateMixin {
  final LocalAuthentication _localAuth = LocalAuthentication();
  bool _isAuthenticating = false;
  String _statusMessage = 'Tap to authenticate with biometric';
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _statusMessage = 'Verifying your identity...';
      });
      authenticated = await _localAuth.authenticate(
        localizedReason: 'Authenticate to access Josephlock',
        options: AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        setState(() {
          _statusMessage = 'Authentication successful!';
        });
        Navigator.of(context).pushReplacementNamed('/dashboard');
      } else {
        setState(() {
          _statusMessage = 'Authentication failed. Please try again.';
        });
      }
    } catch (e) {
      setState(() {
        _statusMessage = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() {
        _isAuthenticating = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A1F44),
              Color(0xFF0D2C5E),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Column(
                  children: [
                    Text(
                      'Josephlock',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Hybrid Cryptography Mode 1',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF00BFA6),
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!_isAuthenticating) GestureDetector(
                      onTap: _authenticate,
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF00BFA6),
                            width: 3,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF00BFA6).withOpacity(0.3),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.fingerprint,
                          size: 60,
                          color: Color(0xFF00BFA6),
                        ),
                      ),
                    ) else Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF00BFA6),
                          width: 3,
                        ),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF00BFA6),
                          ),
                          strokeWidth: 4,
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Text(
                      _statusMessage,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xFF00BFA6).withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            color: Color(0xFF00BFA6),
                            size: 16,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'AES-256 • RSA-2048',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF00BFA6),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '© 2026 Josephlock Security',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}