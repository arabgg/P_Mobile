import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white, // Ganti primary dengan backgroundColor
        foregroundColor: Colors.black, // Ganti onPrimary dengan foregroundColor
        padding: EdgeInsets.symmetric(
            horizontal: 50, vertical: 15), // Ukuran tombol besar
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Sudut bundar modern
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
