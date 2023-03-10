import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/data/models/transactions_model.dart';
import 'package:finance_app/domain/repositories/transactions/transactions_repository.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<List<TransactionsModel>> getTransactionsList(String userId) async {
    try {
      final result = await _firestore
          .collection("transactions")
          .where("userId", isEqualTo: userId)
          .get();

      final transactionsList = List<TransactionsModel>.from(result.docs
          .map((doc) => TransactionsModel.fromMap(doc.id, doc.data())));

      return transactionsList;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> addTransaction(TransactionsModel transactionsModel) async {
    try {
      final result = await _firestore
          .collection("transactions")
          .add(transactionsModel.toMap());
      result.id.isNotEmpty;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> deleteTransaction(String transactionId) async {
    try {
      final transaction = _firestore.doc("transactions/$transactionId");
      if (transaction.id.isNotEmpty) {
        await transaction.delete();
      }

      return Future.value(true);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> updateTransaction(TransactionsModel transaction) async {
    try {
      _firestore
          .collection('transactions')
          .doc(transaction.id)
          .update(transaction.toMap());

      return Future.value(true);
    } catch (e) {
      throw Exception();
    }
  }
}
