import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

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
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '\$${transactions[index].amount.toStringAsFixed(2)}'),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd()
                            .format(transactions[index].createdAt),
                      ),
                      trailing: MediaQuery.of(context).size.width > 360
                          ? FlatButton.icon(
                              textColor: Theme.of(context).errorColor,
                              onPressed: () =>
                                  deleteTransaction(transactions[index].id),
                              icon: const Icon(Icons.delete),
                              label: const Text('Delete'),
                            )
                          : IconButton(
                              icon: const Icon(Icons.delete),
                              color: Theme.of(context).errorColor,
                              onPressed: () =>
                                  deleteTransaction(transactions[index].id),
                            ),
                    ),
                  );
                },
              );
  }
}
