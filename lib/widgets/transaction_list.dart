// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Container(
            width: double.infinity,
            child: LayoutBuilder(builder: (context, constrains) {
              return Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constrains.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png',
                        fit: BoxFit.cover),
                  ),
                ],
              );
            }),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                            child: Text('\$${transactions[index].amount}'))),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge),
                  subtitle: Text(
                    DateFormat.yMMMd()
                        .add_jm()
                        .format(transactions[index].date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          label: Text('Delete'),
                          icon: Icon(Icons.delete),
                          style: ButtonStyle(
                              foregroundColor: MaterialStatePropertyAll(
                            Theme.of(context).errorColor,
                          )),
                          onPressed: () => deleteTx(transactions[index].id),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Theme.of(context).errorColor,
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
/*

Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            (transactions[index].title),
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .add_jm()
                                .format(transactions[index].date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );


*/