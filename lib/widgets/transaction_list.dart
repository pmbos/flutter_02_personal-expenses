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
            : ListView(
                children: transactions
                    .map((transaction) => TransactionItem(
                          //A valuekey is a 'unique' key that you specify yourself
                          //A UniqueKey is calculated every time build is run.
                          key: ValueKey(transaction.id),
                          transaction: transaction,
                          deleteTransaction: deleteTransaction,
                        ))
                    .toList(),
              );
  }
}
