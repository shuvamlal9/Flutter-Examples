import 'package:expense_tracker/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'models/transactions.dart';
import 'widgets/input_transaction.dart';
import 'widgets/transactions_list.dart';

class HomePage extends StatefulWidget {
  final Future<Database> myDatabase;
  HomePage(this.myDatabase);
  @override
  _HomePageState createState() => _HomePageState(myDatabase);
}

class _HomePageState extends State<HomePage> {
  final Future<Database> database;

  _HomePageState(this.database);

  final List<Transactions> _userTransactions = [
    // Transaction(id: '1', title: "New Shoe", amount: 6.8, date: DateTime.now()),
    // Transaction(id: '2', title: "Paint Ball", amount: 7.4, date: DateTime.now())
  ];

  Future<void> insertTransaction(Transactions transactions) async {
    final Database db = await database;

    await db.insert('transactions_database', transactions.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void _addTransactions(String txTitle, double txAmount, DateTime chsnDate) {
    final val = Transactions(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chsnDate);

    setState(() async {
      await insertTransaction(val);
      _userTransactions.add(val);
    });
  }

  void _deleteTransactions(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  void _startAddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: InputTransaction(_addTransactions),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  List<Transactions> get _recentTransactions {
    return _userTransactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text(
        "Expense Tracker",
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddNewTransactions(context),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(_recentTransactions)),
            Container(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.7,
                child:
                    TransactionsList(_userTransactions, _deleteTransactions)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransactions(context),
        splashColor: Colors.blueGrey,
      ),
    );
  }
}
