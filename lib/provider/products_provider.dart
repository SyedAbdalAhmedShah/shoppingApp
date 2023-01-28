import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/repository/payment_repo.dart';
import 'package:flutter_application_1/repository/products_repo.dart';
import 'package:flutter_application_1/utils/app_colors.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;
  ProductRepo repo = ProductRepo();
  List<ProductModel> allProd = [];
  PaymentRepo payRepo = PaymentRepo();
  Map<String, dynamic>? paymentIntent;

  List<ProductModel> get allProduct => allProd;
  Future getAllProduct() async {
    isLoading = true;

    print("isloading2 $isLoading");
    try {
      allProd = await repo.getAllProductFromServer();

      isLoading = false;
      print("isloading $isLoading");
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Error is $error');
      }
      return [];
    }
  }

  Future BuyProduct({required BuildContext context, required String ammount}) async {
    isLoading = true;
    notifyListeners();
    try {
      print("ammount $ammount");
      paymentIntent = await payRepo.makePayment(ammount);
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successfull"),
                        ],
                      ),
                    ],
                  ),
                ));
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));
//
        // paymentIntent = null;
      });
    } on StripeException catch (e) {
      isLoading = false;

      print('Error isssssssss:---> $e');
      if (e.error.code == FailureCode.Canceled) {
        Fluttertoast.showToast(
            msg: "Cancled", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.TOP, timeInSecForIosWeb: 1, backgroundColor: AppColors.primaryColor, textColor: Colors.white, fontSize: 16.0);
      }

      notifyListeners();
    } catch (error) {
      isLoading = false;
      notifyListeners();
      log("I am the error ", error: error);
    }
  }
}
