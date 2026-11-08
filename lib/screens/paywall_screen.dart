// Replace the button handlers in paywall_screen.dart:
// Basic Tier Button:
onPressed: () {
  final basicProduct = _products.firstWhere(
    (p) => p.id == SubscriptionService.basicTierId,
    orElse: () => _products.first,
  );
  if (_products.isNotEmpty) {
    _subscriptionService.buyProduct(basicProduct);
  }
},

// Pro Creator Tier Button:
onPressed: () {
  final proProduct = _products.firstWhere(
    (p) => p.id == SubscriptionService.proCreatorTierId,
    orElse: () => _products.last,
  );
  if (_products.isNotEmpty) {
    _subscriptionService.buyProduct(proProduct);
  }
},import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import '../services/subscription_service.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  final SubscriptionService _subscriptionService = SubscriptionService();
  List<ProductDetails> _products = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initStore();
  }

  Future<void> _initStore() async {
    await _subscriptionService.initialize();
    final products = await _subscriptionService.loadProducts();
    setState(() {
      _products = products;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upgrade dotin Tier')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Text(
                  'Choose Your Plan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                // Basic Tier Card (₹299/mo)
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Basic Tier', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const Text('₹299 / month • Ad-free video streaming & standard access'),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            // Trigger purchase for basic
                          },
                          child: const Text('Subscribe Basic (₹299)'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Pro Creator Tier Card ($30/mo)
                Card(
                  color: Colors.deepPurple.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pro Creator Tier', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                        const Text('\$30 / month • Unlocks AI-VFX editing tools & 56% Creator Revenue Split'),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
                          onPressed: () {
                            // Trigger purchase for Pro Creator
                          },
                          child: const Text('Subscribe Pro Creator (\$30)'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
