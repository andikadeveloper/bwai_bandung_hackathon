import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  debugPrint('Continue with Apple clicked');
                },
                icon: SvgPicture.asset(
                  'assets/icons/appleinc.svg',
                  width: 18,
                  height: 18,
                ),
                label: const Text('Continue with Apple'),
              ),
              FilledButton.icon(
                onPressed: () {
                  debugPrint('Continue with Google clicked');
                },
                icon: SvgPicture.asset(
                  'assets/icons/google.svg',
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                label: const Text('Continue with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
