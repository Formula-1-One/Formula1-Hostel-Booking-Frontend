import 'package:flutter/material.dart';
import 'package:paystack_manager/models/transaction.dart';
import 'package:paystack_manager/paystack_pay_manager.dart';

void _processPayment() {
  try {
    PaystackPayManager(context: context)
      ..setSecretKey("sk_test_6bd550a2e53eb6d80a7da3571967f70e4ddb9e7a")
      ..setCompanyAssetImage(const Image(
        image: AssetImage("assets/images/formula1-car.jpg"),
      ))
      ..setAmount(350000) // Price of hostel room

      ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
      ..setCurrency("GHS")
      ..setEmail("ben.angmortey@gmail.com") //The users email here
      ..setFirstName("Benjamon") // FirstName
      ..setLastName("Angmortey Kubi") //LastName
      ..setMetadata(
        {
          "custom_fields": [
            {
              "value": "snapTask",
              "display_name": "Payment to",
              "variable_name": "payment_to"
            }
          ]
        },
      )
      ..onSuccesful(_onPaymentSuccessful)
      ..onPending(_onPaymentPending)
      ..onFailed(_onPaymentFailed)
      ..onCancel(_onPaymentCancelled)
      ..initialize();
  } catch (error) {
    print("Payment Error ==> $error");
  }
}

void _onPaymentSuccessful(Transaction transaction) {
  print("Transaction was successful");
  print("Transaction Message ===> ${transaction.message}");
  print("Transaction Refrence ===> ${transaction.refrenceNumber}");
} // After succesful payment task to carry out

void _onPaymentPending(Transaction transaction) {
  print("Transaction is pendinng");
  print("Transaction Refrence ===> ${transaction.refrenceNumber}");
} // When payment is on depending task to carry out

void _onPaymentFailed(Transaction transaction) {
  print("Transaction failed");
  print("Transaction Message ===> ${transaction.message}");
} // When the payment fails what next

void _onPaymentCancelled(Transaction transaction) {
  print("Transaction was cancelled");
} // When user cancels payment the task to perform
