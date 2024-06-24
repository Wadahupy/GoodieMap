// qr_code_generator.dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:goodiemap_app/models/cart_model.dart';

class QRCodeGenerator extends StatelessWidget {
  final Cart cart;

  const QRCodeGenerator({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final qrData = cart.products
        .map((product) => '${product.name} ................ ₱${product.price}')
        .join('\n');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF46B177), size: 50),
        title: const Text(
          'QR Code',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF46B177),
          ),
        ),
      ),
      body: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: 300.0,
        ),
      ),
    );
  }
}
