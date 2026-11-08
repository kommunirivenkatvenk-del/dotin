import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionService {
  final InAppPurchase _iap = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  static const String basicTierId = 'dotin_basic_299'; // ₹299/mo
  static const String proCreatorTierId = 'dotin_pro_30'; // $30/mo

  bool isBasicSubscriber = false;
  bool isProCreator = false;

  void initialize() {
    final Stream<List<PurchaseDetails>> purchaseUpdated = _iap.purchaseStream;
    _subscription = purchaseUpdated.listen(
      (purchaseDetailsList) {
        _listenToPurchaseUpdated(purchaseDetailsList);
      },
      onDone: () => _subscription.cancel(),
      onError: (error) {
        // Handle stream errors
      },
    );
  }

  void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
    for (var purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        if (purchaseDetails.productID == basicTierId) {
          isBasicSubscriber = true;
        } else if (purchaseDetails.productID == proCreatorTierId) {
          isBasicSubscriber = true;
          isProCreator = true;
        }

        if (purchaseDetails.pendingCompletePurchase) {
          _iap.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<List<ProductDetails>> loadProducts() async {
    const Set<String> ids = {basicTierId, proCreatorTierId};
    final ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    return response.productDetails;
  }

  void buyProduct(ProductDetails product) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _iap.buySubscription(purchaseParam: purchaseParam);
  }

  void dispose() {
    _subscription.cancel();
  }
}import 'dart:async';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionService {
  final InAppPurchase _iap = InAppPurchase.instance;
  
  // Product IDs matching your Google Play / App Store configuration
  static const String basicTierId = 'dotin_basic_299'; // ₹299/mo
  static const String proCreatorTierId = 'dotin_pro_30'; // $30/mo

  bool isProCreator = false;
  bool isBasicSubscriber = false;

  Future<void> initialize() async {
    final bool available = await _iap.isAvailable();
    if (!available) {
      // Store not available
      return;
    }
  }

  Future<List<ProductDetails>> loadProducts() async {
    const Set<String> ids = {basicTierId, proCreatorTierId};
    final ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    return response.productDetails;
  }

  void buyProduct(ProductDetails product) {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    _iap.buySubscription(purchaseParam: purchaseParam);
  }
}
