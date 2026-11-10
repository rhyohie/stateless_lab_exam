import 'dart:math' as math;

import 'package:flutter/material.dart';

// Shared colors used across the page.
const Color kBlue = Color(0xFF1D5CFF);
const Color kNavy = Color(0xFF0F1B4C);
const Color kLightBlue = Color(0xFFDCE8FF);
const Color kPageBackground = Color(0xFFF0F2F7);
const Color kBorder = Color(0xFFE1E5EE);
const Color kMutedText = Color(0xFF5B6478);

// The layout was designed for a 400 px wide screen.
const double kDesignWidth = 400;

/// Scale factor based on the current window width.
/// Every size on the page (text, icons, padding, radii) is multiplied by it,
/// so the whole page grows and shrinks when the window is resized.
double scaleOf(BuildContext context) {
  final Size size = MediaQuery.sizeOf(context);
  final double byWidth = size.width / kDesignWidth;
  final double byHeight = size.height / 820;
  return math.min(byWidth, byHeight).clamp(0.75, 1.0).toDouble();
}

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  // Change this to your own full name.
  static const String studentName = 'John Erold B. Miano';

  @override
  Widget build(BuildContext context) {
    final double s = scaleOf(context);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double contentWidth = screenWidth;

    return Scaffold(
      backgroundColor: kPageBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        toolbarHeight: 60 * s,
        leadingWidth: 56 * s,
        leading: IconButton(
          iconSize: 26 * s,
          padding: EdgeInsets.all(8 * s),
          icon: const Icon(Icons.arrow_back, color: kNavy),
          onPressed: () => debugPrint('Back clicked'),
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            color: kNavy,
            fontSize: 24 * s,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12 * s),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                IconButton(
                  iconSize: 30 * s,
                  padding: EdgeInsets.all(8 * s),
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: kNavy,
                  ),
                  onPressed: () => debugPrint('Cart clicked'),
                ),
                Positioned(
                  right: 4 * s,
                  top: 4 * s,
                  child: Container(
                    width: 20 * s,
                    height: 20 * s,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: kBlue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12 * s,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: contentWidth,
              child: Padding(
                padding: EdgeInsets.all(12 * s),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------- Introduction ----------
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12 * s,
                        vertical: 6 * s,
                      ),
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(8 * s),
                      ),
                      child: Text(
                        'CAMPUS STORE',
                        style: TextStyle(
                          color: kBlue,
                          fontSize: 13 * s,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5 * s,
                        ),
                      ),
                    ),
                    SizedBox(height: 10 * s),
                    Text(
                      'Ready for checkout',
                      style: TextStyle(
                        color: kNavy,
                        fontSize: 32 * s,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4 * s),
                    Text(
                      'Review your items before placing your order.',
                      style: TextStyle(color: kMutedText, fontSize: 15 * s),
                    ),
                    SizedBox(height: 18 * s),

                    // ---------- Delivery card ----------
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14 * s,
                        vertical: 12 * s,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16 * s),
                        border: Border.all(color: kBorder),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.location_on, color: kBlue, size: 30 * s),
                          SizedBox(width: 12 * s),
                          Container(width: 1, height: 40 * s, color: kBorder),
                          SizedBox(width: 14 * s),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deliver to $studentName',
                                  style: TextStyle(
                                    color: kNavy,
                                    fontSize: 17 * s,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 2 * s),
                                Text(
                                  'Roxas, Davao City',
                                  style: TextStyle(
                                    color: kMutedText,
                                    fontSize: 15 * s,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () =>
                                debugPrint('Change delivery address clicked'),
                            child: Text(
                              'Change',
                              style: TextStyle(
                                color: kBlue,
                                fontSize: 16 * s,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 22 * s),

                    // ---------- Order items heading ----------
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Order Items',
                          style: TextStyle(
                            color: kNavy,
                            fontSize: 22 * s,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '3 items',
                          style: TextStyle(color: kMutedText, fontSize: 15 * s),
                        ),
                      ],
                    ),
                    SizedBox(height: 12 * s),

                    // ---------- Product cards (reusable widget) ----------
                    const CartItemCard(
                      name: 'Wireless Mouse',
                      price: 450.00,
                      quantity: 1,
                      icon: Icons.mouse_outlined,
                    ),
                    SizedBox(height: 12 * s),
                    const CartItemCard(
                      name: 'USB-C Hub',
                      price: 850.00,
                      quantity: 1,
                      icon: Icons.usb,
                    ),
                    SizedBox(height: 12 * s),
                    const CartItemCard(
                      name: 'Laptop Stand',
                      price: 700.00,
                      quantity: 1,
                      icon: Icons.laptop_mac,
                    ),
                    SizedBox(height: 16 * s),

                    // ---------- Discount banner ----------
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14 * s,
                        vertical: 12 * s,
                      ),
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(14 * s),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_offer_outlined,
                            color: kBlue,
                            size: 28 * s,
                          ),
                          SizedBox(width: 12 * s),
                          Container(
                            width: 1,
                            height: 38 * s,
                            color: const Color(0x401D5CFF),
                          ),
                          SizedBox(width: 14 * s),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'STUDENT10 applied',
                                  style: TextStyle(
                                    color: const Color(0xFF123A9E),
                                    fontSize: 17 * s,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '10% discount on items',
                                  style: TextStyle(
                                    color: kMutedText,
                                    fontSize: 14 * s,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.check_circle, color: kBlue, size: 32 * s),
                        ],
                      ),
                    ),
                    SizedBox(height: 16 * s),

                    // ---------- Payment summary ----------
                    Container(
                      padding: EdgeInsets.all(16 * s),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16 * s),
                        border: Border.all(color: kBorder),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Payment Summary',
                            style: TextStyle(
                              color: kNavy,
                              fontSize: 20 * s,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10 * s),
                          const SummaryRow(
                            label: 'Subtotal',
                            amount: 'PHP 2,000.00',
                          ),
                          SizedBox(height: 6 * s),
                          const SummaryRow(
                            label: 'Discount (10%)',
                            amount: '- PHP 200.00',
                          ),
                          SizedBox(height: 6 * s),
                          const SummaryRow(
                            label: 'Delivery Fee',
                            amount: 'PHP 50.00',
                          ),
                          SizedBox(height: 10 * s),
                          const Divider(height: 1, color: kBorder),
                          SizedBox(height: 10 * s),
                          const SummaryRow(
                            label: 'Total',
                            amount: 'PHP 1,850.00',
                            isTotal: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16 * s),

                    // ---------- Place order button ----------
                    SizedBox(
                      width: double.infinity,
                      height: 56 * s,
                      child: ElevatedButton.icon(
                        onPressed: () => debugPrint(
                            'Place order clicked! Total: PHP 1850.00'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kBlue,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14 * s),
                          ),
                        ),
                        icon: Icon(Icons.lock, size: 24 * s),
                        label: Text(
                          'Place Order',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20 * s,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8 * s),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Reusable product card. Everything it shows comes from the constructor.
class CartItemCard extends StatelessWidget {
  final String name;
  final double price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double s = scaleOf(context);

    return Container(
      padding: EdgeInsets.all(12 * s),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16 * s),
        border: Border.all(color: kBorder),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product icon in a light-blue rounded box
          Container(
            width: 72 * s,
            height: 72 * s,
            decoration: BoxDecoration(
              color: kLightBlue,
              borderRadius: BorderRadius.circular(14 * s),
            ),
            child: Icon(icon, color: kNavy, size: 38 * s),
          ),
          SizedBox(width: 14 * s),

          // Name, price, quantity controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: kNavy,
                    fontSize: 18 * s,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2 * s),
                Text(
                  'PHP ${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: kBlue,
                    fontSize: 17 * s,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8 * s),
                Row(
                  children: [
                    QuantityButton(
                      icon: Icons.remove,
                      onPressed: () => debugPrint('Decrease quantity: $name'),
                    ),
                    SizedBox(width: 8 * s),
                    Container(
                      width: 46 * s,
                      height: 36 * s,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10 * s),
                        border: Border.all(color: kBorder),
                      ),
                      child: Text(
                        '$quantity',
                        style: TextStyle(
                          color: kNavy,
                          fontSize: 16 * s,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 8 * s),
                    QuantityButton(
                      icon: Icons.add,
                      onPressed: () => debugPrint('Increase quantity: $name'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete button
          IconButton(
            padding: EdgeInsets.zero,
            iconSize: 28 * s,
            constraints: BoxConstraints(minWidth: 36 * s, minHeight: 36 * s),
            icon: const Icon(Icons.delete_outline, color: kMutedText),
            onPressed: () => debugPrint('Remove item: $name'),
          ),
        ],
      ),
    );
  }
}

/// Small outlined +/- button used inside CartItemCard.
class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const QuantityButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double s = scaleOf(context);

    return SizedBox(
      width: 36 * s,
      height: 36 * s,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          foregroundColor: kBlue,
          side: const BorderSide(color: kBlue, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10 * s),
          ),
        ),
        child: Icon(icon, size: 20 * s, color: kBlue),
      ),
    );
  }
}

/// One aligned label/amount row in the payment summary.
class SummaryRow extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  const SummaryRow({
    super.key,
    required this.label,
    required this.amount,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final double s = scaleOf(context);
    final TextStyle style = TextStyle(
      color: kNavy,
      fontSize: (isTotal ? 22 : 16) * s,
      fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text(amount, style: style),
      ],
    );
  }
}
