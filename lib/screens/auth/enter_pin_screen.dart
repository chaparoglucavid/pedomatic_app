import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  static const int _pinLength = 4;
  final List<int> _pinDigits = [];

  void _onKeyTap(int digit) {
    if (_pinDigits.length >= _pinLength) return;

    setState(() => _pinDigits.add(digit));

    if (_pinDigits.length == _pinLength) {
      final pin = _pinDigits.join();
      _onCompleted(pin);
    }
  }

  void _onBackspace() {
    if (_pinDigits.isEmpty) return;
    setState(() => _pinDigits.removeLast());
  }

  void _openFaceId() {}

  Future<void> _onCompleted(String pin) async {
    // Burada yoxlama (API/local) edə bilərsən
    // Nümunə üçün sadəcə dialog:
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('PIN daxil edildi'),
        content: Text('PIN: $pin'),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, '/home-screen'),
            child: const Text('OK'),
          ),
        ],
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Animation
              SizedBox(
                height: 240,
                child: Lottie.asset(
                  'assets/animations/owl.json',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 12),
              const Text(
                'PIN daxil edin',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 18),

              // Dots (****)
              _PinDots(length: _pinLength, filled: _pinDigits.length),

              const Spacer(),

              // Keypad
              _PinKeypad(
                onDigit: _onKeyTap,
                onBackspace: _onBackspace,
                openFaceId: _openFaceId,
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class _PinDots extends StatelessWidget {
  final int length;
  final int filled;

  const _PinDots({required this.length, required this.filled});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (i) {
        final isFilled = i < filled;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled ? Colors.black87 : Colors.transparent,
            border: Border.all(
              color: isFilled ? Colors.black87 : Colors.grey.shade400,
              width: 1.6,
            ),
          ),
        );
      }),
    );
  }
}

class _PinKeypad extends StatelessWidget {
  final void Function(int digit) onDigit;
  final VoidCallback onBackspace;
  final VoidCallback openFaceId; // <-- dynamic yox, bu olsun

  const _PinKeypad({
    required this.onDigit,
    required this.onBackspace,
    required this.openFaceId,
  });

  @override
  Widget build(BuildContext context) {
    final keys = const [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
    ];

    return Column(
      children: [
        for (final row in keys) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: row
                .map((d) => _KeyButton(label: '$d', onTap: () => onDigit(d)))
                .toList(),
          ),
          const SizedBox(height: 12),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _IconKeyButton(
              icon: Icons.close,
              onTap: openFaceId,
              tooltip: 'Təmizlə',
            ),
            _KeyButton(label: '0', onTap: () => onDigit(0)),
            _IconKeyButton(
              icon: Icons.backspace_outlined,
              onTap: onBackspace,
              tooltip: 'Sil',
            ),
          ],
        ),
      ],
    );
  }
}

class _KeyButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _KeyButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _IconKeyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final String tooltip;

  const _IconKeyButton({
    required this.icon,
    required this.onTap,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 88,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          foregroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Icon(icon),
      ),
    );
  }
}
