import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
      ? Column(
          children: <Widget>[
            Text(
              'No transactions added yet!',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        )
      : ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              elevation: 5,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: FittedBox(
                        child: Text('\$${transactions[index].amount}')),
                  ),
                ),
                title: Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteTransaction(index),
                  color: Theme.of(context).errorColor,
                ),
              ),
            );
          },
          itemCount: transactions.length,
        );
  }
}
