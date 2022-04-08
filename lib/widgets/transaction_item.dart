import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/model/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTransaction;

  @override
  Widget build(BuildContext context) {
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
            child: FittedBox(child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                icon: Icon(Icons.delete),
                label: Text("Delete"),
                textColor: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(transaction.id),
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteTransaction(transaction.id),
                color: Theme.of(context).errorColor,
              ),
      ),
    );
  }
}
