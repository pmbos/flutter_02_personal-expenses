import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return
        //Should contain a list of expenses/transactions
        transactions.isEmpty
            ? LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: [
                      Text(
                        'No transactions found!',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/images/waiting.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  );
                },
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionItem(
                      transaction: transactions[index],
                      deleteTransaction: deleteTransaction);
                },
              );
  }
}
